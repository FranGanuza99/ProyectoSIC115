<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
     <head>
          <title>Sistema Contable</title>
          <META HTTP-EQUIV="EXPIRES" CONTENT="0">
          <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
          <meta name="Sitio Contable" content="Sistema Contable Empresa Consultora de Software MICROTECN"/>
          <meta http-equiv = "refresh" Content = "2;url=../index.asp">
          
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
			   <center><h1><font color="black"><N> Modificar Datos Del Empleado <N></font></h1></center>
                  <%	
	            Dim nom,ape,pue,sal,hor

	            nom = Request.Form("no")
	            ape = Request.Form("ap")
	            pue = Request.Form("pu")
	            sal = Request.Form("sa")
	            hor = Request.Form("ho")
                    ape2 = Request.Form("ap2")


	            Dim conn, sql
	            Set conn = Server.CreateObject("ADODB.Connection")
	            conn.open "Datos","",""

	            sql = "UPDATE Empleados SET Nombres = '" & nom & "', Apellidos = '" & ape & "', Puesto = '" & pue & "', Salario = '" & sal & "', horas = '" & hor & "' WHERE Apellidos = '" & ape2 & "'"
	            conn.execute(sql)
	            conn.close
                  %>
                    <h2>  Los Datos han sido Modificados!! </h2>
                </td>
              </tr>

          <!--PENDIENTE POR AGREGAR ICONO DE CONFIRMACION -->
          <img src="imagen/check.png" alt="Fondo" id="bg" align="middle"/>

           </table>
         </div>
     </body>
</html>
