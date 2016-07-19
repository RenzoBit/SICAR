namespace SICAR.Models
{
	using System;
	using System.Collections.Generic;
	using System.ComponentModel;
	using System.ComponentModel.DataAnnotations;
	using System.ComponentModel.DataAnnotations.Schema;

	[Table("ca_carga")]
	[DisplayColumn("descripcion")]
	public partial class Carga
	{
		[Key]
		public int idcarga { get; set; }

		[Display(Name = "Cotización")]
		public int? idcotizacion { get; set; }

		[Display(Name = "Orden")]
		public int? idorden { get; set; }

		[Display(Name = "Unidad de medida")]
		[Required(ErrorMessage = "Seleccione una unidad de medida")]
		public int idunidad { get; set; }

		[Display(Name = "Tipo de carga")]
		[Required(ErrorMessage = "Seleccione un tipo de carga")]
		public int idcargatipo { get; set; }

		[Display(Name = "Cantidad ancho")]
		[Required(ErrorMessage = "Ingrese un ancho")]
		[DefaultValue(0)]
		public decimal ancho { get; set; }

		[Display(Name = "Cantidad largo")]
		[Required(ErrorMessage = "Ingrese un largo")]
		[DefaultValue(0)]
		public decimal largo { get; set; }

		[Display(Name = "Peso")]
		[Required(ErrorMessage = "Ingrese un peso")]
		[DefaultValue(0)]
		public decimal peso { get; set; }

		[Display(Name = "Volumen")]
		[Required(ErrorMessage = "Ingrese un volumen")]
		[DefaultValue(0)]
		public decimal volumen { get; set; }

		[Display(Name = "Profundidad")]
		[Required(ErrorMessage = "Ingrese una profundidad")]
		[DefaultValue(0)]
		public decimal profundidad { get; set; }

		[Display(Name = "Descripción")]
		[StringLength(100)]
		public string descripcion { get; set; }

		[Display(Name = "Monto")]
		[Required(ErrorMessage = "Ingrese un monto")]
		[DefaultValue(0)]
		public decimal monto { get; set; }

		public CargaTipo cargatipo { get; set; }

		public Cotizacion cotizacion { get; set; }

		public Orden orden { get; set; }

		public Unidad unidad { get; set; }
	}
}
