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
          background:url('/imagen/fg.jpg') no-repeat center center fixed;
          -webkit-background-size: cover;
          -moz-background-size: cover;
          -o-background-size: cover;
          background-size: cover;
          }
        </style>
         <!--#include virtual="/Sistema_Contable/plantilla.asp"-->
		 <div id='logo1'>
               <td valign="top" class="content"> 
			   <center><h1><font color="black"><N> Modificar Datos De Usuario <N></font></h1></center>
                  <%	
	            Dim nom,ape,tel,mail,loginuser,pass

                    nom = Request.Form("nombre")
	            ape = Request.Form("apellido")
	            loginuser = Request.Form("user")
	            pass = Request.Form("clave")

   	            Dim conn, sql
	            Set conn = Server.CreateObject("ADODB.Connection")
	            conn.open "Datos","",""

	            sql = "UPDATE usuarios SET Nombre = '" & nom & "', Apellido = '" & ape & "', Clave = '" & pass & "' WHERE Login = '" & loginuser & "'"
	            conn.execute(sql)
	            conn.close
                  %><br>
                  <center><h2>  Los datos se han modificado exitosamente </h2></center>
                </td>
              </tr>
           </table>
		   <!--Boton regresar a nueva busqueda -->
     </font></h1> </center>
      <!-- -->
         </div>
      
     </body>
</html>
