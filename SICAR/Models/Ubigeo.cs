namespace SICAR.Models
{
	using System;
	using System.Collections.Generic;
	using System.ComponentModel.DataAnnotations;
	using System.ComponentModel.DataAnnotations.Schema;

	[Table("ca_ubigeo")]
	[DisplayColumn("nombre")]
	public class Ubigeo
	{
		public Ubigeo()
		{
			lcotizacioni = new HashSet<Cotizacion>();
			lcotizacionf = new HashSet<Cotizacion>();
			ldistanciai = new HashSet<Distancia>();
			ldistanciaf = new HashSet<Distancia>();
			lordeni = new HashSet<Orden>();
			lordenf = new HashSet<Orden>();
		}

		[Key]
		[Column(Order = 0)]
		[StringLength(2)]
		public string dep { get; set; }

		[Key]
		[Column(Order = 1)]
		[StringLength(2)]
		public string pro { get; set; }

		[Key]
		[Column(Order = 2)]
		[StringLength(2)]
		public string dis { get; set; }

		[Display(Name = "Nombre")]
		[Required(ErrorMessage = "Ingrese un nombre")]
		[StringLength(200)]
		public string nombre { get; set; }

		[Display(Name = "Latitud")]
		[StringLength(20)]
		public string latitud { get; set; }

		[Display(Name = "Longitud")]
		[StringLength(20)]
		public string longitud { get; set; }

		public ICollection<Cotizacion> lcotizacioni { get; set; }

		public ICollection<Cotizacion> lcotizacionf { get; set; }

		public ICollection<Distancia> ldistanciai { get; set; }

		public ICollection<Distancia> ldistanciaf { get; set; }

		public ICollection<Orden> lordeni { get; set; }

		public ICollection<Orden> lordenf { get; set; }
	}
}
