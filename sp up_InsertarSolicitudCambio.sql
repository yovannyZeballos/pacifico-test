/**************************************************************************************************      
OBJETIVO:      
Inserta una solicitud en la tabla SOLICITUD_SC y SOLICITUD_MODIFICACION. Obtiene el Numero de Solicitud       
de SC desde la tabal NUMERADORES.      
ENTRADAS:Declaradas m�s abajo      
RETORNO:Un recordset con el n�mero de la nueva solicitud.      
CASO DE USO:  H24      
CREADO POR:  ELM      
FECHA CREACION:  11-12-2000      
CREADO POR:  TSC      
FECHA MODIFICACION:     26-06-2002      
MODIFICADO POR:  TSC-RLV      
FECHA MODIFICACION:     14-06-2007      
REQUERIMIENTO:  DS-01860 (LMB)      
***********************************************************************************************/      
CREATE PROCEDURE dbo.up_InsertarSolicitudCambio       
@CodigoDocumento int,      
@TipoSolicitud smallint,      
@DescripcionModificacion varchar(100),      
@CodigoMotivoEndoso smallint,      
@CodigoEntidad smallint,      
@FechaInicioVigencia datetime,      
@CodigoEstado smallint,      
@CodigoUsuario smallint,      
@CondicionLiberacionEndosoBancario char(1),      
@CondicionTipoSCMasivo char(1) = 'N',    
@CodigoTipoCredito int = NULL,    
@FechaCartaEntidad datetime = NULL,  
@MontoEndosado decimal(15,2) = NULL,
@EndosoLiberado int = NULL
AS      

declare @intNumeroSolicitud int      
           
SELECT @intNumeroSolicitud = UltimoNumero + 1      
FROM dbo.TABLA_NUMERADORES      
WHERE CodigoNumerador = @TipoSolicitud      
 AND   CodigoSubNumerador = 0   

IF  @intNumeroSolicitud IS NULL
THEN
	RAISERROR('No se encontró el numero de solicitud', 16, 1);
    RETURN;
END

SELECT @intNumeroSolicitud as Numero      
      
   
INSERT INTO dbo.SOLICITUD_SC (NumeroSolicitud,CodigoDocumento,CodigoEstado,CodigoTipoSolicitud,FechaCreacion,      
UsuarioCreacion,FechaInicioVigencia,FechaUltimaModificacion,UsuarioUltimaModificacion, CondicionTipoSCMasiva ) VALUES      
(@intNumeroSolicitud,@CodigoDocumento,@CodigoEstado,@TipoSolicitud,getdate(),@CodigoUsuario,@FechaInicioVigencia,getdate(),
@CodigoUsuario, @CondicionTipoSCMasivo)      
      
    
UPDATE dbo.TABLA_NUMERADORES SET UltimoNumero = @intNumeroSolicitud      
WHERE CodigoNumerador = @TipoSolicitud      
 AND CodigoSubNumerador = 0      
    
  