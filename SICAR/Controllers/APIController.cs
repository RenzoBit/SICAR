using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using SICAR.Models;
using System.Text;
using Newtonsoft.Json.Linq;

namespace SICAR.Controllers
{
	public class Orden2Controller : ApiController
	{
		private BDSICAR db = new BDSICAR();

		public IEnumerable<Orden> Get(int id)
		{
			return db.Orden.Where(x => x.idpersona == id).AsEnumerable();
		}
	}

	public class Transportista2Controller : ApiController
	{
		private BDSICAR db = new BDSICAR();

		public IEnumerable<Transportista> Get()
		{
			return db.Transportista.AsEnumerable();
		}
	}

	public class Ubicacion2Controller : ApiController
	{
		private BDSICAR db = new BDSICAR();

		public HttpResponseMessage Post(Ubicacion ubicacion)
		{
			ubicacion.hora = DateTime.Now;
			using (WebClient webClient = new WebClient())
			{
				webClient.Encoding = Encoding.UTF8;
				dynamic result = JObject.Parse(webClient.DownloadString("http://maps.googleapis.com/maps/api/geocode/json?latlng=" + ubicacion.latitud + "," + ubicacion.longitud + "&sensor=false"));
				ubicacion.direccion = result.results[0].formatted_address;
			}
			if (ModelState.IsValid)
			{
				db.Ubicacion.Add(ubicacion);
				db.SaveChanges();
				HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, ubicacion);
				response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = ubicacion.idubicacion }));
				return response;
			}
			else
				return Request.CreateResponse(HttpStatusCode.BadRequest);
		}
	}

}