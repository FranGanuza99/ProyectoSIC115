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
		   <br>
       <br>    
     <p id="titulo">Eliminar usuario</p>
       <br>
       <hr>
       <br>
       <br>
       <br>
                  <p>&nbsp</p>
                  <% 
                    Dim conn, SQL, log, nom, apel

                    log = Request.QueryString("usuario")

                    set conn=Server.CreateObject("ADODB.Connection")
                    conn.open "Datos","",""

                    SQL="SELECT * FROM usuarios WHERE login = '" & Log & "'"
                    SET Lista = conn.execute(SQL)


                    log = Lista("Login")
                    nom=Lista("Nombre")
                    apel=Lista("Apellido")
                  %>
                 <table id="margenInput" border="1" cellspacing="3" cellpadding="1" align="center">
                       <tr style="color:black;font-size:160%;"> 
                          <th>Nombre de usuario </th>
                          <td><%=log%></td>
                          </tr>

                       <tr style="color:black;font-size:160%;"> 
                          <th>Nombres</th>
                          <td><%=nom%></td>
                       </tr>

                       <tr style="color:black;font-size:160%;"> 
                          <th>Apellidos</th>
                          <td><%=apel%></td>
                       </tr>
                      
                     

                  </table>
                  
              <form id="botoncito" name="user" method="post" action="eliminar.asp">
              <td colspan="2"><input id= "margenInput" type="submit" name="eliminar" value="Eliminar"></td>
                             <input type="hidden" name="log" value="<%=log%>">
                          </form>

                </td>
              </tr>
           </table>
         </div>
     </body>
</html>
