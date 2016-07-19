namespace SICAR.Models
{
	using System;
	using System.Data.Entity;
	using System.ComponentModel.DataAnnotations.Schema;
	using System.Linq;

	public partial class BDSICAR : DbContext
	{
		public BDSICAR()
			: base("name=BDSICAR")
		{
		}

		public virtual DbSet<Carga> Carga { get; set; }
		public virtual DbSet<CargaTipo> CargaTipo { get; set; }
		public virtual DbSet<Cliente> Cliente { get; set; }
		public virtual DbSet<Cotizacion> Cotizacion { get; set; }
		public virtual DbSet<Distancia> Distancia { get; set; }
		public virtual DbSet<Orden> Orden { get; set; }
		public virtual DbSet<Persona> Persona { get; set; }
		public virtual DbSet<Servicio> Servicio { get; set; }
		public virtual DbSet<Transportista> Transportista { get; set; }
		public virtual DbSet<Ubicacion> Ubicacion { get; set; }
		public virtual DbSet<Ubigeo> Ubigeo { get; set; }
		public virtual DbSet<Unidad> Unidad { get; set; }

		protected override void OnModelCreating(DbModelBuilder modelBuilder)
		{
			modelBuilder.Entity<Carga>()
				.Property(e => e.descripcion)
				.IsUnicode(false);

			modelBuilder.Entity<CargaTipo>()
				.Property(e => e.nombre)
				.IsUnicode(false);

			modelBuilder.Entity<CargaTipo>()
				.HasMany(e => e.lcarga)
				.WithRequired(e => e.cargatipo)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Cliente>()
				.Property(e => e.ruc)
				.IsFixedLength()
				.IsUnicode(false);

			modelBuilder.Entity<Cliente>()
				.HasMany(e => e.lcotizacion)
				.WithRequired(e => e.cliente)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Cliente>()
				.HasMany(e => e.lorden)
				.WithRequired(e => e.cliente)
				.HasForeignKey(e => e.idcliente)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Cotizacion>()
				.Property(e => e.idep)
				.IsFixedLength()
				.IsUnicode(false);

			modelBuilder.Entity<Cotizacion>()
				.Property(e => e.ipro)
				.IsFixedLength()
				.IsUnicode(false);

			modelBuilder.Entity<Cotizacion>()
				.Property(e => e.idis)
				.IsFixedLength()
				.IsUnicode(false);

			modelBuilder.Entity<Cotizacion>()
				.Property(e => e.fdep)
				.IsFixedLength()
				.IsUnicode(false);

			modelBuilder.Entity<Cotizacion>()
				.Property(e => e.fpro)
				.IsFixedLength()
				.IsUnicode(false);

			modelBuilder.Entity<Cotizacion>()
				.Property(e => e.fdis)
				.IsFixedLength()
				.IsUnicode(false);

			modelBuilder.Entity<Cotizacion>()
				.Property(e => e.numero)
				.IsFixedLength()
				.IsUnicode(false);

			modelBuilder.Entity<Cotizacion>()
				.Property(e => e.idir)
				.IsUnicode(false);

			modelBuilder.Entity<Cotizacion>()
				.Property(e => e.fdir)
				.IsUnicode(false);

			modelBuilder.Entity<Cotizacion>()
				.Property(e => e.observacion)
				.IsUnicode(false);

			modelBuilder.Entity<Cotizacion>()
				.Property(e => e.estado)
				.IsFixedLength()
				.IsUnicode(false);

			modelBuilder.Entity<Distancia>()
				.Property(e => e.idep)
				.IsFixedLength()
				.IsUnicode(false);

			modelBuilder.Entity<Distancia>()
				.Property(e => e.ipro)
				.IsFixedLength()
				.IsUnicode(false);

			modelBuilder.Entity<Distancia>()
				.Property(e => e.idis)
				.IsFixedLength()
				.IsUnicode(false);

			modelBuilder.Entity<Distancia>()
				.Property(e => e.fdep)
				.IsFixedLength()
				.IsUnicode(false);

			modelBuilder.Entity<Distancia>()
				.Property(e => e.fpro)
				.IsFixedLength()
				.IsUnicode(false);

			modelBuilder.Entity<Distancia>()
				.Property(e => e.fdis)
				.IsFixedLength()
				.IsUnicode(false);

			modelBuilder.Entity<Orden>()
				.Property(e => e.numero)
				.IsFixedLength()
				.IsUnicode(false);

			modelBuilder.Entity<Orden>()
				.Property(e => e.idep)
				.IsFixedLength()
				.IsUnicode(false);

			modelBuilder.Entity<Orden>()
				.Property(e => e.ipro)
				.IsFixedLength()
				.IsUnicode(false);

			modelBuilder.Entity<Orden>()
				.Property(e => e.idis)
				.IsFixedLength()
				.IsUnicode(false);

			modelBuilder.Entity<Orden>()
				.Property(e => e.fdep)
				.IsFixedLength()
				.IsUnicode(false);

			modelBuilder.Entity<Orden>()
				.Property(e => e.fpro)
				.IsFixedLength()
				.IsUnicode(false);

			modelBuilder.Entity<Orden>()
				.Property(e => e.fdis)
				.IsFixedLength()
				.IsUnicode(false);

			modelBuilder.Entity<Orden>()
				.Property(e => e.idir)
				.IsUnicode(false);

			modelBuilder.Entity<Orden>()
				.Property(e => e.fdir)
				.IsUnicode(false);

			modelBuilder.Entity<Orden>()
				.Property(e => e.observacion)
				.IsUnicode(false);

			modelBuilder.Entity<Orden>()
				.Property(e => e.estado)
				.IsFixedLength()
				.IsUnicode(false);

			modelBuilder.Entity<Orden>()
				.Property(e => e.cnombre)
				.IsUnicode(false);

			modelBuilder.Entity<Orden>()
				.Property(e => e.ccelular)
				.IsUnicode(false);

			modelBuilder.Entity<Orden>()
				.Property(e => e.cemail)
				.IsUnicode(false);

			modelBuilder.Entity<Orden>()
				.HasMany(e => e.lubicacion)
				.WithRequired(e => e.orden)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Persona>()
				.Property(e => e.codigo)
				.IsFixedLength()
				.IsUnicode(false);

			modelBuilder.Entity<Persona>()
				.Property(e => e.nombre)
				.IsUnicode(false);

			modelBuilder.Entity<Persona>()
				.Property(e => e.correo)
				.IsUnicode(false);

			modelBuilder.Entity<Persona>()
				.Property(e => e.domicilio)
				.IsUnicode(false);

			modelBuilder.Entity<Servicio>()
				.Property(e => e.nombre)
				.IsUnicode(false);

			modelBuilder.Entity<Servicio>()
				.HasMany(e => e.lcotizacion)
				.WithRequired(e => e.servicio)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Servicio>()
				.HasMany(e => e.lorden)
				.WithRequired(e => e.servicio)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Ubicacion>()
				.Property(e => e.latitud)
				.IsUnicode(false);

			modelBuilder.Entity<Ubicacion>()
				.Property(e => e.longitud)
				.IsUnicode(false);

			modelBuilder.Entity<Ubicacion>()
				.Property(e => e.direccion)
				.IsUnicode(false);

			modelBuilder.Entity<Ubigeo>()
				.Property(e => e.dep)
				.IsFixedLength()
				.IsUnicode(false);

			modelBuilder.Entity<Ubigeo>()
				.Property(e => e.pro)
				.IsFixedLength()
				.IsUnicode(false);

			modelBuilder.Entity<Ubigeo>()
				.Property(e => e.dis)
				.IsFixedLength()
				.IsUnicode(false);

			modelBuilder.Entity<Ubigeo>()
				.Property(e => e.nombre)
				.IsUnicode(false);

			modelBuilder.Entity<Ubigeo>()
				.Property(e => e.latitud)
				.IsUnicode(false);

			modelBuilder.Entity<Ubigeo>()
				.Property(e => e.longitud)
				.IsUnicode(false);

			modelBuilder.Entity<Ubigeo>()
				.HasMany(e => e.lcotizacioni)
				.WithRequired(e => e.ubigeoi)
				.HasForeignKey(e => new { e.idep, e.ipro, e.idis })
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Ubigeo>()
				.HasMany(e => e.lcotizacionf)
				.WithRequired(e => e.ubigeof)
				.HasForeignKey(e => new { e.fdep, e.fpro, e.fdis })
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Ubigeo>()
				.HasMany(e => e.ldistanciai)
				.WithRequired(e => e.ubigeoi)
				.HasForeignKey(e => new { e.idep, e.ipro, e.idis })
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Ubigeo>()
				.HasMany(e => e.ldistanciaf)
				.WithRequired(e => e.ubigeof)
				.HasForeignKey(e => new { e.fdep, e.fpro, e.fdis })
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Ubigeo>()
				.HasMany(e => e.lordeni)
				.WithRequired(e => e.ubigeoi)
				.HasForeignKey(e => new { e.idep, e.ipro, e.idis })
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Ubigeo>()
				.HasMany(e => e.lordenf)
				.WithRequired(e => e.ubigeof)
				.HasForeignKey(e => new { e.fdep, e.fpro, e.fdis })
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Unidad>()
				.Property(e => e.nombre)
				.IsUnicode(false);

			modelBuilder.Entity<Unidad>()
				.HasMany(e => e.lcarga)
				.WithRequired(e => e.unidad)
				.WillCascadeOnDelete(false);
		}
	}
}
