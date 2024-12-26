USE [VIAP_Ayer]
GO

/****** Object:  Table [dbo].[SOLICITUD_SC]    Script Date: 27/11/2024 14:25:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SOLICITUD_SC](
	[NumeroSolicitud] [int] NOT NULL,
	[CodigoDocumento] [int] NULL,
	[CodigoEstado] [smallint] NULL,
	[CodigoTipoSolicitud] [smallint] NOT NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [smallint] NULL,
	[FechaUltimaModificacion] [datetime] NOT NULL,
	[UsuarioUltimaModificacion] [smallint] NULL,
	[FechaInicioVigencia] [datetime] NULL,
	[UltimaObservacion] [varchar](255) NULL,
	[Login] [char](20) NULL,
	[CondicionActualizarDireccionOtrasPolizas] [char](1) NULL,
	[CondicionTipoSCMasiva] [char](1) NULL,
	[LoginEvaluador] [varchar](20) NULL,
	[FlagRehabilitacionRevisada] [bit] NULL,
	[FlagInboxAgencias] [bit] NOT NULL,
	[FlagInboxEvaluacion] [bit] NULL,
	[Reasignada] [bit] NULL,
	[ObservacionConfidencial] [varchar](600) NULL,
 CONSTRAINT [XPKSOLICITUD_SC] PRIMARY KEY CLUSTERED 
(
	[NumeroSolicitud] ASC,
	[CodigoTipoSolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
