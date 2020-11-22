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
        background:url('/imagen/fondodeault.png') no-repeat center center fixed;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
        }
      </style>
      
          <!--#include virtual="/Sistema_Contable/plantilla.asp"-->
           <br><br>
                <p id="titulo">Eliminar cuenta</p>
       <br>
       <hr>
       <br>
       <br>
       <br>
		  <div id='logo1'>
               <td valign="top" class="content"> 
			 
                  <p>&nbsp</p>
                  <% 
                    cod = Request.form("cod")
                    nom = Request.form("nom")

                    set conn=Server.CreateObject("ADODB.Connection")
                    conn.open "Datos","",""

                    SQL="DELETE * FROM Catalogo WHERE Codigo ="&cod
                    conn.execute(SQL)
                    conn.close
                  %>
				   <center><h1><font color="black"> La cuenta <%=nom%> ha sido eliminada <br> del catalogo de cuentas
           </font></h1></center>
                </td>
              </tr>
           </table>
         </div>
     </body>
</html>
