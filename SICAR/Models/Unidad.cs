namespace SICAR.Models
{
	using System;
	using System.Collections.Generic;
	using System.ComponentModel.DataAnnotations;
	using System.ComponentModel.DataAnnotations.Schema;

	[Table("ca_unidad")]
	[DisplayColumn("nombre")]
	public partial class Unidad
	{
		public Unidad()
		{
			lcarga = new HashSet<Carga>();
		}

		[Key]
		public int idunidad { get; set; }

		[Display(Name = "Nombre")]
		[Required(ErrorMessage = "Ingrese un nombre")]
		[StringLength(100)]
		public string nombre { get; set; }

		public ICollection<Carga> lcarga { get; set; }
	}
}
