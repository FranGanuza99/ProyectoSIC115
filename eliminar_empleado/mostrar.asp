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
                    Dim conn, SQL, log, nom, apel

                    apel = Request.QueryString("empleado")

                    set conn=Server.CreateObject("ADODB.Connection")
                    conn.open "Datos","",""

                    SQL="SELECT * FROM Empleados WHERE Apellidos = '" & apel & "'"
                    SET Lista = conn.execute(SQL)


                    nom=Lista("Nombres")
                    puesto=Lista("Puesto")
                    salario=Lista("Salario")
                  %>
                 <table id= "margenInput" width = "100%" align="center" cellspacing=10 cellpadding=10 border=1>
                       <tr> 
                          <th>Nombre del Empleado </th>
                          <td><%=apel%>, <%=nom%></td>
                          </tr>

                       <tr> 
                          <th>Puesto</th>
                          <td><%=Puesto%></td>
                       </tr>

                       <tr> 
                          <th>Salario</th>
                          <td><%=salario%></td>
                       </tr>
                       <tr>
                          <form name="user" method="get" action="eliminar.asp">
                              <td colspan="2"><input id="margenInput" type="submit" name="eliminar" value="ELIMINAR"></td>
                              <input type="hidden" name="apel" value="<%=apel%>">
                          <form>
                       </tr>
                  </table>
                </td>
              </tr>
           </table>
         </div>
     </body>
</html>
