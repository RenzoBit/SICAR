namespace SICAR.Models
{
	using System;
	using System.Collections.Generic;
	using System.ComponentModel.DataAnnotations;
	using System.ComponentModel.DataAnnotations.Schema;

	[Table("ca_distancia")]
	[DisplayColumn("distancia")]
	public partial class Distancia
	{
		[Key]
		[Column(Order = 0)]
		[StringLength(2)]
		public string idep { get; set; }

		[Key]
		[Column(Order = 1)]
		[StringLength(2)]
		public string ipro { get; set; }

		[Key]
		[Column(Order = 2)]
		[StringLength(2)]
		public string idis { get; set; }

		[Key]
		[Column(Order = 3)]
		[StringLength(2)]
		public string fdep { get; set; }

		[Key]
		[Column(Order = 4)]
		[StringLength(2)]
		public string fpro { get; set; }

		[Key]
		[Column(Order = 5)]
		[StringLength(2)]
		public string fdis { get; set; }

		public int distancia { get; set; }

		public Ubigeo ubigeoi { get; set; }

		public Ubigeo ubigeof { get; set; }
	}
}
