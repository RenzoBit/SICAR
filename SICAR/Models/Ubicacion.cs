namespace SICAR.Models
{
	using System;
	using System.Collections.Generic;
	using System.ComponentModel.DataAnnotations;
	using System.ComponentModel.DataAnnotations.Schema;

	[Table("ca_ubicacion")]
	[DisplayColumn("hora")]
	public partial class Ubicacion
	{
		[Key]
		public int idubicacion { get; set; }

		[Display(Name = "Orden")]
		//[Required(ErrorMessage = "Seleccione una orden")]
		public int idorden { get; set; }

		[Display(Name = "Latitud")]
		//[Required(ErrorMessage = "Ingrese la latitud")]
		[StringLength(20)]
		public string latitud { get; set; }

		[Display(Name = "Longitud")]
		//[Required(ErrorMessage = "Ingrese la longitud")]
		[StringLength(20)]
		public string longitud { get; set; }

		[Display(Name = "Hora")]
		//[Required(ErrorMessage = "Ingrese una hora")]
		public DateTime hora { get; set; }

		[Display(Name = "Dirección")]
		[StringLength(200)]
		public string direccion { get; set; }

		public Orden orden { get; set; }
	}
}
