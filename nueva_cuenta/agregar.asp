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
                <p id="titulo">Nueva cuenta</p>
       <br>
       <hr>
       <br>
       <br>
       <br>
		  <div id='logo1'>
               <td valign="top" class="content">
                 <%
                    nom=Request.form("nombre")
                    cod=Request.form("codigo")
                    tipo=Request.form("sel")
                   
                    Set Conexion = Server.CreateObject("ADODB.Connection")
		    Conexion.open "Datos","",""
		    sql="INSERT INTO catalogo(NombreCuenta, Codigo, Tipo) VALUES('"&nom&"', '"&cod&"', '"&tipo&"')"
		    Conexion.Execute(sql)

                 %> 
				
				 <h1><font color="black"> La cuenta <%=nom%> ha sido agregada</font></h1>
                </td>
              </tr>
           </table>
         </div>
     </body>
</html>
