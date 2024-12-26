USE [VIAP]
GO

/****** Object:  Table [dbo].[BENEFICIARIO]    Script Date: 5/12/2024 14:02:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BENEFICIARIO](
	[CodigoAsegurado] [int] NOT NULL,
	[CodigoDocumento] [int] NOT NULL,
	[NumeroBeneficiario] [smallint] NOT NULL,
	[PorcentajeBeneficio] [decimal](10, 6) NULL,
	[CodigoPersona] [int] NULL,
	[TipoPagoBeneficio] [smallint] NULL,
	[RelacionParentesco] [smallint] NULL,
	[TipoBeneficiario] [char](1) NULL,
	[ApellidoPaterno] [varchar](30) NULL,
	[ApellidoMaterno] [varchar](30) NULL,
	[Nombres] [varchar](40) NULL,
	[FechaNacimiento] [datetime] NULL,
	[Sexo] [char](1) NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[UsuarioCreacion] [smallint] NULL,
	[FechaUltimaModificacion] [datetime] NOT NULL,
	[UsuarioUltimaModificacion] [smallint] NULL,
	[DescripcionParentesco] [varchar](30) NULL,
	[TipoDocumentoIdentidad] [varchar](3) NULL,
	[NroDocumentoIdentidad] [varchar](12) NULL,
	[IndicadorModificacionDatosPID] [tinyint] NOT NULL,
 CONSTRAINT [XPKBENEFICIARIO] PRIMARY KEY CLUSTERED 
(
	[CodigoAsegurado] ASC,
	[CodigoDocumento] ASC,
	[NumeroBeneficiario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
