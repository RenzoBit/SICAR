namespace SICAR.Models
{
	using System;
	using System.Collections.Generic;
	using System.ComponentModel;
	using System.ComponentModel.DataAnnotations;
	using System.ComponentModel.DataAnnotations.Schema;

	[Table("ca_cotizacion")]
	[DisplayColumn("numero")]
	public class Cotizacion
	{
		public Cotizacion()
		{
			lcarga = new HashSet<Carga>();
			lorden = new HashSet<Orden>();
		}

		[Key]
		public int idcotizacion { get; set; }

		[Display(Name = "Cliente")]
		[Required(ErrorMessage = "Seleccione un cliente")]
		public int idpersona { get; set; }

		[Display(Name = "Tipo de servicio")]
		[Required(ErrorMessage = "Seleccione un tipo de servicio")]
		public int idservicio { get; set; }

		[Display(Name = "Departamento inicial")]
		[Required(ErrorMessage = "Seleccione un departamento inicial")]
		[StringLength(2)]
		public string idep { get; set; }

		[Display(Name = "Provincia inicial")]
		[Required(ErrorMessage = "Seleccione una provincia inicial")]
		[StringLength(2)]
		public string ipro { get; set; }

		[Display(Name = "Distrito inicial")]
		[Required(ErrorMessage = "Seleccione un distrito inicial")]
		[StringLength(2)]
		public string idis { get; set; }

		[Display(Name = "Departamento final")]
		[Required(ErrorMessage = "Seleccione un departamento final")]
		[StringLength(2)]
		public string fdep { get; set; }

		[Display(Name = "Provincia final")]
		[Required(ErrorMessage = "Seleccione una provincia final")]
		[StringLength(2)]
		public string fpro { get; set; }

		[Display(Name = "Distrito final")]
		[Required(ErrorMessage = "Seleccione un distrito final")]
		[StringLength(2)]
		public string fdis { get; set; }

		[Display(Name = "Número")]
		[Required(ErrorMessage = "Ingrese una cotización")]
		[StringLength(10)]
		public string numero { get; set; }

		[Display(Name = "Fecha")]
		[Required(ErrorMessage = "Ingrese una fecha")]
		[Column(TypeName = "date")]
		[DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
		public DateTime fecha { get; set; }

		[Display(Name = "Dirección inicial")]
		[Required(ErrorMessage = "Ingrese una dirección inicial")]
		[StringLength(200)]
		public string idir { get; set; }

		[Display(Name = "Dirección final")]
		[Required(ErrorMessage = "Ingrese una dirección final")]
		[StringLength(200)]
		public string fdir { get; set; }

		[Display(Name = "Observación")]
		[Required(ErrorMessage = "Ingrese una observación")]
		[StringLength(200)]
		public string observacion { get; set; }

		[Display(Name = "Monto bruto")]
		[Required(ErrorMessage = "Ingrese un monto bruto")]
		[DefaultValue(0)]
		public decimal bruto { get; set; }

		[Display(Name = "Monto neto")]
		[Required(ErrorMessage = "Ingrese un monto neto")]
		[DefaultValue(0)]
		public decimal neto { get; set; }

		[Display(Name = "Estado")]
		[Required(ErrorMessage = "Ingrese un estado")]
		[StringLength(1)]
		[DefaultValue("G")]
		public string estado { get; set; }

		[Display(Name = "Distancia")]
		[Required(ErrorMessage = "Ingrese una distancia")]
		[DefaultValue(0)]
		public decimal distancia { get; set; }

		public Cliente cliente { get; set; }

		public Servicio servicio { get; set; }

		public Ubigeo ubigeoi { get; set; }

		public Ubigeo ubigeof { get; set; }

		public ICollection<Carga> lcarga { get; set; }

		public ICollection<Orden> lorden { get; set; }
	}
}
