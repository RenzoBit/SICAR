using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SICAR.Models;
using System.Net;
using Newtonsoft.Json.Linq;
using System.Text;

namespace SICAR.Controllers
{
	public class UbicacionController : Controller
	{
		private BDSICAR db = new BDSICAR();

		public ActionResult Index()
		{
			return View(new HashSet<Ubicacion>());
		}

		[HttpPost]
		public ActionResult Index(string numero = "", DateTime? desde = null, DateTime? hasta = null)
		{
			List<Ubicacion> l = db.Ubicacion.Where(
				x => ("" == numero.Trim() || x.orden.numero.Contains(numero.Trim()))
				&& ((null == desde && null == hasta) || x.orden.fecha >= desde && x.orden.fecha <= hasta))
				.OrderBy(x => x.orden.numero).Include(c => c.orden).ToList();
			return View(l);
		}

		[HttpPost]
		public ActionResult Seguimiento(int[] idubicacion)
		{
			List<Orden> l = new List<Orden>();
			if (idubicacion.Length > 0)
			{
				Orden orden1 = null;
				Orden orden2 = null;
				Ubicacion ubicacion1 = null;
				bool existe;
				foreach (int i in idubicacion)
				{
					ubicacion1 = db.Ubicacion.Find(i);
					existe = false;
					foreach (Orden o in l)
						if (o.idorden == ubicacion1.idorden)
						{
							o.lubicacion.Add(new Ubicacion() { idubicacion = ubicacion1.idubicacion, latitud = ubicacion1.latitud, longitud = ubicacion1.longitud, hora = ubicacion1.hora, direccion = ubicacion1.direccion });
							existe = true;
							break;
						}
					if (!existe)
					{
						orden1 = db.Orden.Include(x => x.transportista).SingleOrDefault(x => x.idorden == ubicacion1.idorden);
						orden2 = new Orden() { idorden = orden1.idorden, numero = orden1.numero, fecha = orden1.fecha, transportista = orden1.transportista };
						orden2.lubicacion.Add(new Ubicacion() { idubicacion = ubicacion1.idubicacion, latitud = ubicacion1.latitud, longitud = ubicacion1.longitud, hora = ubicacion1.hora, direccion = ubicacion1.direccion });
						l.Add(orden2);
					}
				}
			}
			return View(l);
		}

		protected override void Dispose(bool disposing)
		{
			db.Dispose();
			base.Dispose(disposing);
		}

		public void uno()
		{
			List<Ubicacion> l = db.Ubicacion.Where(x => x.direccion == null).ToList();
			using (WebClient webClient = new WebClient())
			{
				webClient.Encoding = Encoding.UTF8;
				dynamic r = null;
				foreach (Ubicacion o in l)
				{
					r = JObject.Parse(webClient.DownloadString("http://maps.googleapis.com/maps/api/geocode/json?latlng=" + o.latitud + "," + o.longitud + "&sensor=false"));
					if (r.status == "OK")
					{
						o.direccion = r.results[0].formatted_address;
						db.Entry(o).State = EntityState.Modified;
						db.SaveChanges();
					}
				}
			}
		}

		public void dos()
		{
			List<Ubigeo> l = db.Ubigeo.Where(x => x.dep != "00" && x.pro != "00" && x.dis != "00" && (x.latitud == null || x.longitud == null)).ToList();
			using (WebClient webClient = new WebClient())
			{
				webClient.Encoding = Encoding.UTF8;
				dynamic r = null;
				string c = null;
				foreach (Ubigeo o in l)
				{
					c = db.Database.SqlQuery<string>("SELECT A.nombre + ', ' + B.nombre + ', ' + C.nombre + ', Peru' FROM ca_ubigeo A, ca_ubigeo B, ca_ubigeo C WHERE A.dep = {0} AND A.pro = {1} AND A.dis = {2} AND B.dep = A.dep AND B.pro = A.pro AND B.dis = '00' AND C.dep = A.dep AND C.pro = '00' AND C.dis = '00'", o.dep, o.pro, o.dis).FirstOrDefault<string>();
					r = JObject.Parse(webClient.DownloadString("http://maps.googleapis.com/maps/api/geocode/json?address=" + c + "&sensor=true"));
					if (r.status == "OK")
					{
						o.latitud = r.results[0].geometry.location.lat;
						o.longitud = r.results[0].geometry.location.lng;
						db.Entry(o).State = EntityState.Modified;
						db.SaveChanges();
					}
				}
			}
		}
	}
}