namespace SICAR.Models
{
	using System;
	using System.Collections.Generic;
	using System.ComponentModel;
	using System.ComponentModel.DataAnnotations;
	using System.ComponentModel.DataAnnotations.Schema;

	[Table("ca_servicio")]
	[DisplayColumn("nombre")]
	public partial class Servicio
	{
		public Servicio()
		{
			lcotizacion = new HashSet<Cotizacion>();
			lorden = new HashSet<Orden>();
		}

		[Key]
		public int idservicio { get; set; }

		[Display(Name = "Nombre")]
		[Required(ErrorMessage = "Ingrese un nombre")]
		[StringLength(100)]
		public string nombre { get; set; }

		[Display(Name = "Costo")]
		[Required(ErrorMessage = "Ingrese un costo")]
		[DefaultValue(0)]
		public decimal costo { get; set; }

		public ICollection<Cotizacion> lcotizacion { get; set; }

		public ICollection<Orden> lorden { get; set; }
	}
}
