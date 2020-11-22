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
        background:url('/imagen/fondodefault2.png') no-repeat center center fixed;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
        }
      </style>
      
          <!--#include virtual="/Sistema_Contable/plantilla.asp"-->
		    
                  <% 
                    Dim conn, SQL, log, nom, apel

                    log = Request.form("log")

                    set conn=Server.CreateObject("ADODB.Connection")
                    conn.open "Datos","",""

                    SQL="DELETE * FROM usuarios WHERE login = '" & log & "'"
                    conn.execute(SQL)
                    conn.close
                  %>
                  <br><br><br><br><br><br><br><br><br>
				  <center><h1 style="color: DarkSlateGrey"> El usuario  " <%=log%> " se ha dado de baja exitosamente <br></h1></center>
          <br><br>
          <a id="nuevaE" href="./eliminar_usuario.asp">Eliminar nuevamente</a>
                </td>
              </tr>
           </table>
         </div>
     </body>
</html>
