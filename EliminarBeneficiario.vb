Public Function EliminarBeneficiario( _
    ByVal ilngCodigo As Long, _
    ByVal iblnCondicionCopia As Boolean, _
    ByVal ilngCodigoAsegurado As Long, _
    ByVal iintNumeroBeneficiario As Integer) As Boolean
          
          Dim strSQL As String
          Dim objDataAccess As STKDataAccessAES.CADO
          
10    On Error GoTo EliminarBeneficiarioErr

    #If COMPLUS = 1 Then
              Dim ctxContexto As ObjectContext
20            Set ctxContexto = GetObjectContext
    #End If
          
          'GrabarLog "EliminarBeneficiario - Inicio " & CStr(Now), vbLogEventTypeInformation
          
30
40            strSQL = "DELETE FROM BENEFICIARIO "
70   
          
80        strSQL = strSQL & "WHERE CodigoDocumento = " & CStr(ilngCodigo) & " AND "
90        strSQL = strSQL & "CodigoAsegurado = " & CStr(ilngCodigoAsegurado) & " AND "
100       strSQL = strSQL & "NumeroBeneficiario = " & CStr(iintNumeroBeneficiario)
          
110       Set objDataAccess = CreateObject("STKDataAccessAES.CADO")
120       objDataAccess.ExecuteSQL strSQL
130       Set objDataAccess = Nothing

140       EliminarBeneficiario = True

          'GrabarLog "EliminarBeneficiario - Fin " & CStr(Now), vbLogEventTypeInformation
          
    #If COMPLUS = 1 Then
150           ctxContexto.SetComplete
    #End If
          
160   Exit Function
EliminarBeneficiarioErr:
170       EliminarBeneficiario = False
          
    #If COMPLUS = 1 Then
180           ctxContexto.SetAbort
    #End If
          
190       Call RaiseError(CSolicitudPoliza_EliminarBeneficiario, "CSolicitudPoliza:EliminarBeneficiario Method", Err.Description & " Línea : " & Erl)
End Function
