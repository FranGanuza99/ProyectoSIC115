<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
     <head>
          <title>Sistema Contable</title>
          <META HTTP-EQUIV="EXPIRES" CONTENT="0">
          <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
          <meta name="Sitio Contable" content="Sistema Contable Empresa Consultora de Software MICROTECN"/>       

          <script language="JavaScript" src = "forms.js"></script>
          <script language = "javascript" src = "visual.js"></script>

          <link rel="stylesheet" href="estilo.css" type="text/css">
          <link rel="stylesheet" href="estilo1.css" type="text/css">

          <style type="text/css">
		   @import url("../css/formato.css");
           @import url("../css/formato2.css");           
          </style>   
     </head>
     <body leftmargin="10" topmargin="160">
         <!--#include virtual="/Sistema_Contable/plantilla.asp"-->
		  <div id='logo1'>
               <td valign="top" class="content"> 
      <%
      tipoVenta = Request.Form("tipo") 
      codigo = Request.Form("codigo")
      orden = Request.Form("orden")
      monto = Request.Form("monto")
      pago = Request.Form("coc")
      fech = Date()

      
      set conn = Server.CreateObject("ADODB.Connection")
      conn.open "Datos","",""


      cad = "SELECT * FROM Diario"
      set L = conn.execute(cad)

      While Not (L.EOF)
        numero = L("NumTrans")
        L.MoveNext
      Wend

      if numero = "" then
        numero = 0
      end if   
      
      costo=Round((monto/1.1), 2)

      if(pago = 1) then
        cuenta1 = 1000
      else
        cuenta1 = 1002
      end if
      
      cuenta2 = 5001
      cuenta3 = 4003 
      
      if(tipoVenta = 1) then
          cuenta4=codigo
          sql="DELETE FROM ordenes WHERE NumOrden="&orden
          conn.execute(sql)
      else
          cuenta4=1086           
      end if

      



      sql1 = "INSERT INTO Diario (NumTrans, codigo, cargo, fecha) VALUES ('" & numero+1 & "', '" & cuenta1 & "', '" & monto & "', '" & fech & "')"
      sql2 = "INSERT INTO Diario (NumTrans, codigo, abono, fecha) VALUES ('" & numero+1 & "', '" & cuenta2 & "', '" & monto & "', '" & fech & "')"
      sql3 = "INSERT INTO Diario (NumTrans, codigo, cargo, fecha) VALUES ('" & numero+1 & "', '" & cuenta3 & "', '" & costo & "', '" & fech & "')"
      sql4 = "INSERT INTO Diario (NumTrans, codigo, abono, fecha) VALUES ('" & numero+1 & "', '" & cuenta4 & "', '" & costo & "', '" & fech & "')"

      conn.execute(sql1)
      conn.execute(sql2)
      conn.execute(sql3)
      conn.execute(sql4)



      conn.close 
    %>
   <h1> Partida guardada en el libro Diario </h1>
                </td>
              </tr>
           </table>
         </div>
     </body>
</html>
