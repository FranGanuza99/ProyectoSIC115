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

        <style type="text/css">
          body {
          background:url('/imagen/wall3.jpg') no-repeat center center fixed;
          -webkit-background-size: cover;
          -moz-background-size: cover;
          -o-background-size: cover;
          background-size: cover;
          }
        </style>

         <!--#include virtual="/Sistema_Contable/plantilla.asp"-->
		  <div id='logo1'>
               <td valign="top" class="content"> 
           <%
      tipoPago = Request.Form("tipo") 
      Monto = Request.Form("cantidad")
      pago = Request.Form("coc")
      fech = Date()

      Dim Monto, cuenta1, cuenta2

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

      select case tipoPago
       case 1    
        cuenta1 = 4001
       case 2    
        cuenta1 = 4014
       case 3    
        cuenta1 = 2003
       case 4    
        cuenta1 = 2002
       case 5    
        cuenta1 = 2017
       case 6    
        cuenta1 = 4000
       case 7    
        cuenta1 = 4007

      end select

      if(pago = 1) then
        cuenta2 = 1000
      else
        cuenta2 = 1001
      end if
      

      sql1 = "INSERT INTO Diario (NumTrans, codigo, cargo, fecha) VALUES ('" & numero+1 & "', '" & cuenta1 & "', '" & Monto & "', '" & fech & "')"
      sql2 = "INSERT INTO Diario (NumTrans, codigo, abono, fecha) VALUES ('" & numero+1 & "', '" & cuenta2 & "', '" & Monto & "', '" & fech & "')"
      conn.execute(sql1)
      conn.execute(sql2)

      conn.close 
    %>
   <h1> Partida guardada en el libro Diario </h1>
                </td>
              </tr>
           </table>
         </div>
         <center><h1 align="right"><font color="#3399FF"><A HREF="./menu.asp">Realizar nueva Transacción</A></font></h1> </center>
    </body>
</html>
