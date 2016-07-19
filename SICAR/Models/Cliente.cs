namespace SICAR.Models
{
	using System;
	using System.Collections.Generic;
	using System.ComponentModel;
	using System.ComponentModel.DataAnnotations;
	using System.ComponentModel.DataAnnotations.Schema;

    [Table("ca_cliente")]
	[DisplayColumn("nombre")]
	public partial class Cliente : Persona
    {
        public Cliente()
		{
			lcotizacion = new HashSet<Cotizacion>();
			lorden = new HashSet<Orden>();
        }

		[Display(Name = "Deuda")]
		[Required(ErrorMessage = "Ingrese un valor de deuda")]
		[DefaultValue(false)]
		public bool deuda { get; set; }

		[Display(Name = "R.U.C.")]
		[StringLength(11)]
		public string ruc { get; set; }

		public ICollection<Cotizacion> lcotizacion { get; set; }

		public ICollection<Orden> lorden { get; set; }
    }
}
