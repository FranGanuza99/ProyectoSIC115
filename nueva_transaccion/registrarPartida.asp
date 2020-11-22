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
      ctaCar1 = Request.Form("cc1")
      ctaCar2 = Request.Form("cc2")
      ctaCar3 = Request.Form("cc3")
      ctaCar4 = Request.Form("cc4")
      ctaCar5 = Request.Form("cc5")

      ctaAbo1 = Request.Form("ca1")
      ctaAbo2 = Request.Form("ca2")
      ctaAbo3 = Request.Form("ca3")
      ctaAbo4 = Request.Form("ca4")
      ctaAbo5 = Request.Form("ca5")

      monCar1 = Request.Form("mc1")
      monCar2 = Request.Form("mc2")
      monCar3 = Request.Form("mc3")
      monCar4 = Request.Form("mc4")
      monCar5 = Request.Form("mc5")

      monAbo1 = Request.Form("ma1")
      monAbo2 = Request.Form("ma2")
      monAbo3 = Request.Form("ma3")
      monAbo4 = Request.Form("ma4")
      monAbo5 = Request.Form("ma5")

      fech = Date()

      set conn = Server.CreateObject("ADODB.Connection")
      conn.open "Datos","",""

      cad = "SELECT * FROM Diario ORDER BY NumTrans"
      set L = conn.execute(cad)

      While Not (L.EOF)
        numero = L("NumTrans")
        L.MoveNext
      Wend

      if numero = "" then
        numero = 0
      end if   

      ' *************** INGRESO TODOS LOS CARGOS ***************

      if ctaCar1 <> 0 then
        sql1 = "INSERT INTO Diario (NumTrans, codigo, cargo, fecha) VALUES ('" & numero+1 & "', '" & ctaCar1 & "', '" & monCar1 & "', '" & fech & "')"
        conn.execute(sql1)
      end if

      if ctaCar2 <> 0 then
        sql1 = "INSERT INTO Diario (NumTrans, codigo, cargo, fecha) VALUES ('" & numero+1 & "', '" & ctaCar2 & "', '" & monCar2 & "', '" & fech & "')"
        conn.execute(sql1)
      end if

      if ctaCar3 <> 0 then
        sql1 = "INSERT INTO Diario (NumTrans, codigo, cargo, fecha) VALUES ('" & numero+1 & "', '" & ctaCar3 & "', '" & monCar3 & "', '" & fech & "')"
        conn.execute(sql1)
      end if

      if ctaCar4 <> 0 then
        sql1 = "INSERT INTO Diario (NumTrans, codigo, cargo, fecha) VALUES ('" & numero+1 & "', '" & ctaCar4 & "', '" & monCar4 & "', '" & fech & "')"
        conn.execute(sql1)
      end if

      if ctaCar5 <> 0 then
        sql1 = "INSERT INTO Diario (NumTrans, codigo, cargo, fecha) VALUES ('" & numero+1 & "', '" & ctaCar5 & "', '" & monCar5 & "', '" & fech & "')"
        conn.execute(sql1)
      end if

      ' *************** INGRESO TODOS LOS ABONOS ***************

      if ctaAbo1 <> 0 then
        sql1 = "INSERT INTO Diario (NumTrans, codigo, abono, fecha) VALUES ('" & numero+1 & "', '" & ctaAbo1 & "', '" & monAbo1 & "', '" & fech & "')"
        conn.execute(sql1)
      end if

      if ctaAbo2 <> 0 then
        sql1 = "INSERT INTO Diario (NumTrans, codigo, abono, fecha) VALUES ('" & numero+1 & "', '" & ctaAbo2 & "', '" & monAbo2 & "', '" & fech & "')"
        conn.execute(sql1)
      end if

      if ctaAbo3 <> 0 then
        sql1 = "INSERT INTO Diario (NumTrans, codigo, abono, fecha) VALUES ('" & numero+1 & "', '" & ctaAbo3 & "', '" & monAbo3 & "', '" & fech & "')"
        conn.execute(sql1)
      end if

      if ctaAbo4 <> 0 then
        sql1 = "INSERT INTO Diario (NumTrans, codigo, abono, fecha) VALUES ('" & numero+1 & "', '" & ctaAbo4 & "', '" & monAbo4 & "', '" & fech & "')"
        conn.execute(sql1)
      end if

      if ctaAbo5 <> 0 then
        sql1 = "INSERT INTO Diario (NumTrans, codigo, abono, fecha) VALUES ('" & numero+1 & "', '" & ctaAbo5 & "', '" & monAbo5 & "', '" & fech & "')"
        conn.execute(sql1)
      end if

      ' ********************************************************
      conn.close 
    %>
   <script language="Javascript">
      alert("Partida guardada en libro Diario")
      window.location="nueva_transaccion.asp"
   </script> 

                </td>
              </tr>
           </table>
         </div>
     </body>
</html>
