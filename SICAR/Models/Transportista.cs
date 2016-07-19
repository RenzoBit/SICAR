namespace SICAR.Models
{
	using System;
	using System.Collections.Generic;
	using System.ComponentModel;
	using System.ComponentModel.DataAnnotations;
	using System.ComponentModel.DataAnnotations.Schema;

	[Table("ca_transportista")]
	[DisplayColumn("nombre")]
	public partial class Transportista : Persona
	{
		public Transportista()
		{
			lorden = new HashSet<Orden>();
		}

		[Display(Name = "Tiempo")]
		[Required(ErrorMessage = "Ingrese un tiempo")]
		[DefaultValue(120)]
		public int tiempo { get; set; }

		public ICollection<Orden> lorden { get; set; }
	}
}
