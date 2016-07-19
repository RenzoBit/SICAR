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
	public class CotizacionController : Controller
	{
		private BDSICAR db = new BDSICAR();

		public ActionResult Index()
		{
			return View(new HashSet<Cotizacion>());
		}

		[HttpPost]
		public ActionResult Index(string numero = "", DateTime? desde = null, DateTime? hasta = null)
		{
			List<Cotizacion> l = db.Cotizacion.Where(
				x => ("" == numero.Trim() || x.lorden.Any(y => y.numero.Contains(numero.Trim())))
				&& ((null == desde && null == hasta) || x.fecha >= desde && x.fecha <= hasta))
				.OrderBy(x => x.fecha).Include(c => c.cliente).Include(c => c.servicio).ToList();
			return View(l);
		}

		public ActionResult Create()
		{
			ViewBag.idpersona = new SelectList(db.Cliente, "idpersona", "nombre");
			ViewBag.idservicio = new SelectList(db.Servicio, "idservicio", "nombre");
			ViewBag.idep = new SelectList(db.Ubigeo.Where(x => x.dep != "00" && x.pro == "00" && x.dis == "00").OrderBy(x => x.nombre), "dep", "nombre");
			ViewBag.ipro = new SelectList(db.Ubigeo.Where(x => 0 == 1), "pro", "nombre");
			ViewBag.idis = new SelectList(db.Ubigeo.Where(x => 0 == 1), "dis", "nombre");
			ViewBag.fdep = new SelectList(db.Ubigeo.Where(x => x.dep != "00" && x.pro == "00" && x.dis == "00").OrderBy(x => x.nombre), "dep", "nombre");
			ViewBag.fpro = new SelectList(db.Ubigeo.Where(x => 0 == 1), "pro", "nombre");
			ViewBag.fdis = new SelectList(db.Ubigeo.Where(x => 0 == 1), "dis", "nombre");
			Session["lcarga"] = new List<Carga>();
			return View(new Cotizacion() { numero = "0000000000", fecha = DateTime.Now, observacion = "La fecha de vencimiento", bruto = 0, neto = 0, estado = "G", distancia = 0 });
		}

		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult Create(Cotizacion cotizacion)
		{
			if (((List<Carga>)Session["lcarga"]).Count == 0)
				ModelState.AddModelError("idcotizacion", "Agregue al menos una carga");
			if (cotizacion.idpersona > 0)
			{
				Cliente cliente = db.Cliente.Find(cotizacion.idpersona);
				if (cliente.deuda)
				{
					ModelState.AddModelError("idpersona", "El cliente tiene notificaciones de deuda");
					/*
					if (Correo.sepuede && cliente.correo != null)
						Correo.enviar2(cliente.correo, "Solicitud de cotización", "Su solicitud de cotización de transporte de carga fue rechazada por tener notificaciones de deuda");
					*/
				}
			}
			if (ModelState.IsValid)
			{
				Ubigeo ubigeoi = db.Ubigeo.Find(cotizacion.idep, cotizacion.ipro, cotizacion.idis);
				Ubigeo ubigeof = db.Ubigeo.Find(cotizacion.fdep, cotizacion.fpro, cotizacion.fdis);
				Servicio servicio = db.Servicio.Find(cotizacion.idservicio);
				cotizacion.distancia = Convert.ToDecimal(Halp.distance(Double.Parse(ubigeoi.latitud), Double.Parse(ubigeoi.longitud), Double.Parse(ubigeof.latitud), Double.Parse(ubigeof.longitud), 'K'));
				cotizacion.numero = db.Database.SqlQuery<string>("SELECT RIGHT('0000000000' + CAST(IDENT_CURRENT('ca_cotizacion') AS VARCHAR(10)), 10)").FirstOrDefault<string>();
				cotizacion.bruto += servicio.costo * cotizacion.distancia;
				cotizacion.neto += servicio.costo * cotizacion.distancia;
				foreach (Carga carga in ((List<Carga>)Session["lcarga"]))
				{
					carga.monto = carga.cargatipo.costo * cotizacion.distancia;
					cotizacion.bruto += carga.cargatipo.costo * cotizacion.distancia;
					cotizacion.neto += carga.cargatipo.costo * cotizacion.distancia;
				}
				db.Cotizacion.Add(cotizacion);
				db.SaveChanges();
				foreach (Carga carga in ((List<Carga>)Session["lcarga"]))
				{
					carga.idcotizacion = cotizacion.idcotizacion;
					carga.cargatipo = null;
					carga.unidad = null;
					db.Carga.Add(carga);
					db.SaveChanges();
				}
				return RedirectToAction("Index");
			}
			ViewBag.idpersona = new SelectList(db.Cliente, "idpersona", "nombre", cotizacion.idpersona);
			ViewBag.idservicio = new SelectList(db.Servicio, "idservicio", "nombre", cotizacion.idservicio);
			ViewBag.idep = new SelectList(db.Ubigeo.Where(x => x.dep != "00" && x.pro == "00" && x.dis == "00").OrderBy(x => x.nombre), "dep", "nombre", cotizacion.idep);
			ViewBag.ipro = new SelectList(db.Ubigeo.Where(x => x.dep == cotizacion.idep && x.pro != "00" && x.dis == "00").OrderBy(x => x.nombre), "pro", "nombre", cotizacion.ipro);
			ViewBag.idis = new SelectList(db.Ubigeo.Where(x => x.dep == cotizacion.idep && x.pro == cotizacion.ipro && x.dis != "00").OrderBy(x => x.nombre), "dis", "nombre", cotizacion.idis);
			ViewBag.fdep = new SelectList(db.Ubigeo.Where(x => x.dep != "00" && x.pro == "00" && x.dis == "00").OrderBy(x => x.nombre), "dep", "nombre", cotizacion.fdep);
			ViewBag.fpro = new SelectList(db.Ubigeo.Where(x => x.dep == cotizacion.fdep && x.pro != "00" && x.dis == "00").OrderBy(x => x.nombre), "pro", "nombre", cotizacion.fpro);
			ViewBag.fdis = new SelectList(db.Ubigeo.Where(x => x.dep == cotizacion.fdep && x.pro == cotizacion.fpro && x.dis != "00").OrderBy(x => x.nombre), "dis", "nombre", cotizacion.fdis);
			return View(cotizacion);
		}

		public ActionResult IndexCarga()
		{
			return PartialView((List<Carga>)Session["lcarga"]);
		}

		public ActionResult CreateCarga(int idcarga, int idcotizacion)
		{
			ViewBag.idunidad = new SelectList(db.Unidad, "idunidad", "nombre");
			ViewBag.idcargatipo = new SelectList(db.CargaTipo, "idcargatipo", "nombre");
			return PartialView(new Carga() { idcarga = idcarga, idcotizacion = idcotizacion, ancho = 0, largo = 0, peso = 0, volumen = 0, profundidad = 0, monto = 0 });
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

		public JsonResult ProvinciaList(string id)
		{
			return Json(new SelectList(db.Ubigeo.Where(x => x.dep == id && x.pro != "00" && x.dis == "00").OrderBy(x => x.nombre), "pro", "nombre"), JsonRequestBehavior.AllowGet);
		}

		public JsonResult DistritoList(string id)
		{
			return Json(new SelectList(db.Ubigeo.Where(x => x.dep == id.Substring(0, 2) && x.pro == id.Substring(2, 2) && x.dis != "00").OrderBy(x => x.nombre), "dis", "nombre"), JsonRequestBehavior.AllowGet);
		}

		[HttpPost]
		public JsonResult CotizacionList(string term)
		{
			var data = db.Cotizacion.Select(x => new { idcotizacion = x.idcotizacion, numero = x.numero, estado = x.estado }).Where(x => x.numero.Contains(term) && x.estado == "G");
			return Json(data, JsonRequestBehavior.AllowGet);
		}
	}
}