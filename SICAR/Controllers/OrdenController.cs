using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SICAR.Models;

namespace SICAR.Controllers
{
	public class OrdenController : Controller
	{
		private BDSICAR db = new BDSICAR();

		public ActionResult Index()
		{
			return View(new HashSet<Orden>());
		}

		[HttpPost]
		public ActionResult Index(string numero = "", DateTime? desde = null, DateTime? hasta = null)
		{
			List<Orden> l = db.Orden.Where(
				x => ("" == numero.Trim() || x.cotizacion.numero.Contains(numero.Trim()))
				&& ((null == desde && null == hasta) || x.fecha >= desde && x.fecha <= hasta))
				.OrderBy(x => x.fecha).Include(o => o.cliente).Include(o => o.cotizacion).Include(o => o.servicio).ToList();
			return View(l);
		}

		public ActionResult Create2(int id = 0)
		{
			Cotizacion c = db.Cotizacion.Find(id);
			List<Carga> l = db.Carga.Where(x => x.idcotizacion == c.idcotizacion).ToList();
			List<Carga> lcarga = new List<Carga>();
			foreach (Carga o in l)
				lcarga.Add(new Carga() { idunidad = o.idunidad, idcargatipo = o.idcargatipo, ancho = o.ancho, largo = o.largo, peso = o.peso, volumen = o.volumen, profundidad = o.profundidad, descripcion = o.descripcion, monto = o.monto, unidad = db.Unidad.Find(o.idunidad), cargatipo = db.CargaTipo.Find(o.idcargatipo) });
			Orden orden = new Orden() { idcotizacion = c.idcotizacion, idcliente = c.idpersona, idservicio = c.idservicio, numero = "0000000000", fecha = DateTime.Now, idep = c.idep, ipro = c.ipro, idis = c.idis, fdep = c.fdep, fpro = c.fpro, fdis = c.fdis, idir = c.idir, fdir = c.fdir, observacion = "La fecha de vencimiento", bruto = c.bruto, neto = c.neto, estado = "G", distancia = c.distancia, cotizacion_numero = c.numero };
			ViewBag.idcliente = new SelectList(db.Cliente, "idpersona", "nombre", orden.idcliente);
			ViewBag.idpersona = new SelectList(db.Transportista, "idpersona", "nombre");
			ViewBag.idservicio = new SelectList(db.Servicio, "idservicio", "nombre", orden.idservicio);
			ViewBag.idep = new SelectList(db.Ubigeo.Where(x => x.dep != "00" && x.pro == "00" && x.dis == "00").OrderBy(x => x.nombre), "dep", "nombre", orden.idep);
			ViewBag.ipro = new SelectList(db.Ubigeo.Where(x => x.dep == orden.idep && x.pro != "00" && x.dis == "00").OrderBy(x => x.nombre), "pro", "nombre", orden.ipro);
			ViewBag.idis = new SelectList(db.Ubigeo.Where(x => x.dep == orden.idep && x.pro == orden.ipro && x.dis != "00").OrderBy(x => x.nombre), "dis", "nombre", orden.idis);
			ViewBag.fdep = new SelectList(db.Ubigeo.Where(x => x.dep != "00" && x.pro == "00" && x.dis == "00").OrderBy(x => x.nombre), "dep", "nombre", orden.fdep);
			ViewBag.fpro = new SelectList(db.Ubigeo.Where(x => x.dep == orden.fdep && x.pro != "00" && x.dis == "00").OrderBy(x => x.nombre), "pro", "nombre", orden.fpro);
			ViewBag.fdis = new SelectList(db.Ubigeo.Where(x => x.dep == orden.fdep && x.pro == orden.fpro && x.dis != "00").OrderBy(x => x.nombre), "dis", "nombre", orden.fdis);
			Session["lcarga"] = lcarga;
			return View(orden);
		}

		public ActionResult Create()
		{
			ViewBag.idcliente = new SelectList(db.Cliente, "idpersona", "nombre");
			ViewBag.idpersona = new SelectList(db.Transportista, "idpersona", "nombre");
			ViewBag.idservicio = new SelectList(db.Servicio, "idservicio", "nombre");
			ViewBag.idep = new SelectList(db.Ubigeo.Where(x => x.dep != "00" && x.pro == "00" && x.dis == "00").OrderBy(x => x.nombre), "dep", "nombre");
			ViewBag.ipro = new SelectList(db.Ubigeo.Where(x => 0 == 1), "pro", "nombre");
			ViewBag.idis = new SelectList(db.Ubigeo.Where(x => 0 == 1), "dis", "nombre");
			ViewBag.fdep = new SelectList(db.Ubigeo.Where(x => x.dep != "00" && x.pro == "00" && x.dis == "00").OrderBy(x => x.nombre), "dep", "nombre");
			ViewBag.fpro = new SelectList(db.Ubigeo.Where(x => 0 == 1), "pro", "nombre");
			ViewBag.fdis = new SelectList(db.Ubigeo.Where(x => 0 == 1), "dis", "nombre");
			Session["lcarga"] = new List<Carga>();
			return View(new Orden() { numero = "0000000000", fecha = DateTime.Now, observacion = "La fecha de vencimiento", bruto = 0, neto = 0, estado = "G", distancia = 0 });
		}

		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult Create(Orden orden)
		{
			if (((List<Carga>)Session["lcarga"]).Count == 0)
				ModelState.AddModelError("idorden", "Agregue al menos una carga");
			if (ModelState.IsValid)
			{
				Ubigeo ubigeoi = db.Ubigeo.Find(orden.idep, orden.ipro, orden.idis);
				Ubigeo ubigeof = db.Ubigeo.Find(orden.fdep, orden.fpro, orden.fdis);
				Servicio servicio = db.Servicio.Find(orden.idservicio);
				orden.distancia = Convert.ToDecimal(Halp.distance(Double.Parse(ubigeoi.latitud), Double.Parse(ubigeoi.longitud), Double.Parse(ubigeof.latitud), Double.Parse(ubigeof.longitud), 'K'));
				orden.numero = db.Database.SqlQuery<string>("SELECT RIGHT('0000000000' + CAST(IDENT_CURRENT('ca_orden') AS VARCHAR(10)), 10)").FirstOrDefault<string>();
				orden.bruto += servicio.costo * orden.distancia;
				orden.neto += servicio.costo * orden.distancia;
				foreach (Carga carga in ((List<Carga>)Session["lcarga"]))
				{
					carga.monto = carga.cargatipo.costo * orden.distancia;
					orden.bruto += carga.cargatipo.costo * orden.distancia;
					orden.neto += carga.cargatipo.costo * orden.distancia;
				}
				db.Orden.Add(orden);
				db.SaveChanges();
				foreach (Carga carga in ((List<Carga>)Session["lcarga"]))
				{
					carga.idorden = orden.idorden;
					carga.cargatipo = null;
					carga.unidad = null;
					db.Carga.Add(carga);
					db.SaveChanges();
				}
				if (orden.idcotizacion > 0)
				{
					Cotizacion cotizacion = db.Cotizacion.Find(orden.idcotizacion);
					cotizacion.estado = "A";
					db.Entry(cotizacion).State = EntityState.Modified;
					db.SaveChanges();
				}
				return RedirectToAction("Index");
			}
			ViewBag.idcliente = new SelectList(db.Cliente, "idpersona", "nombre", orden.idcliente);
			ViewBag.idpersona = new SelectList(db.Transportista, "idpersona", "nombre", orden.idpersona);
			ViewBag.idservicio = new SelectList(db.Servicio, "idservicio", "nombre", orden.idservicio);
			ViewBag.idep = new SelectList(db.Ubigeo.Where(x => x.dep != "00" && x.pro == "00" && x.dis == "00").OrderBy(x => x.nombre), "dep", "nombre", orden.idep);
			ViewBag.ipro = new SelectList(db.Ubigeo.Where(x => x.dep == orden.idep && x.pro != "00" && x.dis == "00").OrderBy(x => x.nombre), "pro", "nombre", orden.ipro);
			ViewBag.idis = new SelectList(db.Ubigeo.Where(x => x.dep == orden.idep && x.pro == orden.ipro && x.dis != "00").OrderBy(x => x.nombre), "dis", "nombre", orden.idis);
			ViewBag.fdep = new SelectList(db.Ubigeo.Where(x => x.dep != "00" && x.pro == "00" && x.dis == "00").OrderBy(x => x.nombre), "dep", "nombre", orden.fdep);
			ViewBag.fpro = new SelectList(db.Ubigeo.Where(x => x.dep == orden.fdep && x.pro != "00" && x.dis == "00").OrderBy(x => x.nombre), "pro", "nombre", orden.fpro);
			ViewBag.fdis = new SelectList(db.Ubigeo.Where(x => x.dep == orden.fdep && x.pro == orden.fpro && x.dis != "00").OrderBy(x => x.nombre), "dis", "nombre", orden.fdis);
			return View(orden);
		}

		public ActionResult IndexCarga()
		{
			return PartialView((List<Carga>)Session["lcarga"]);
		}

		public ActionResult CreateCarga(int idcarga, int idorden)
		{
			ViewBag.idunidad = new SelectList(db.Unidad, "idunidad", "nombre");
			ViewBag.idcargatipo = new SelectList(db.CargaTipo, "idcargatipo", "nombre");
			return PartialView(new Carga() { idcarga = idcarga, idorden = idorden, ancho = 0, largo = 0, peso = 0, volumen = 0, profundidad = 0, monto = 0 });
		}

		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult CreateCarga(Carga carga)
		{
			if (ModelState.IsValid)
			{
				ViewBag.OK = "1";
				carga.unidad = db.Unidad.Find(carga.idunidad);
				carga.cargatipo = db.CargaTipo.Find(carga.idcargatipo);
				((List<Carga>)Session["lcarga"]).Add(carga);
			}
			ViewBag.idunidad = new SelectList(db.Unidad, "idunidad", "nombre", carga.idunidad);
			ViewBag.idcargatipo = new SelectList(db.CargaTipo, "idcargatipo", "nombre", carga.idcargatipo);
			return PartialView(carga);
		}

		protected override void Dispose(bool disposing)
		{
			db.Dispose();
			base.Dispose(disposing);
		}
	}
}