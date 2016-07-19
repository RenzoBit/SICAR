namespace SICAR.Models
{
	using System;
	using System.Collections.Generic;
	using System.ComponentModel;
	using System.ComponentModel.DataAnnotations;
	using System.ComponentModel.DataAnnotations.Schema;

	[Table("ca_cargatipo")]
	[DisplayColumn("nombre")]
	public partial class CargaTipo
	{
		public CargaTipo()
		{
			lcarga = new HashSet<Carga>();
		}

		[Key]
		public int idcargatipo { get; set; }

		[Display(Name = "Nombre")]
		[Required(ErrorMessage = "Ingrese un nombre")]
		[StringLength(100)]
		public string nombre { get; set; }

		[Display(Name = "Costo")]
		[Required(ErrorMessage = "Ingrese un costo")]
		[DefaultValue(0)]
		public decimal costo { get; set; }

		public ICollection<Carga> lcarga { get; set; }
	}
}
