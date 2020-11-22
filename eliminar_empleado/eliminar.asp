<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
     <head>
          <title>Sistema Contable</title>
          <META HTTP-EQUIV="EXPIRES" CONTENT="0">
          <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
          <meta name="Sitio Contable" content="Sistema Contable Empresa Consultora de Software MICROTECN"/>

          <style type="text/css">
		   @import url("../css/formato.css");
           @import url("../css/formato2.css");           
         </style>      
     </head>
     <body leftmargin="10" topmargin="160">

      <style type="text/css">
          body {
          background:url('/imagen/fondodefault2.jpg') no-repeat center center fixed;
          -webkit-background-size: cover;
          -moz-background-size: cover;
          -o-background-size: cover;
          background-size: cover;
          }
      </style>

          <!--#include virtual="/Sistema_Contable/plantilla.asp"-->
		  <div id='logo1'>
               <td valign="top" class="content">
			   <center><h1><font color="black"><N> Eliminar Empleado <N></font></h1></center>
                   <p>&nbsp</p>
                  <% 
                    apel = Request.QueryString("apel")

                    set conn=Server.CreateObject("ADODB.Connection")
                    conn.open "Datos","",""

                    SQL="DELETE * FROM Empleados WHERE Apellidos = '" & apel & "'"
                    conn.execute(SQL)
					
					sql = "UPDATE Empleados SET Nombres = '" & nom & "', Apellidos = '" & ape & "', Puesto = '" & pue & "', Salario = '" & sal & "', horas = '" & hor & "' WHERE Apellidos = '" & ape2 & "'"
	                conn.execute(sql)
	                conn.close
                  %>
				  <center><h3><font color="black"><N> El empleado <%=apel%> ha sido eliminado <br> de la base de datos <N></font></h3></center>
                </td>
              </tr>
           </table>
           <center><h1 align="right"><font color="#3399FF"><A HREF="./eliminar_empleado.asp">Consultar Empleados a Eliminar</A></font></h1> </center>
         </div>
     </body>
</html>
