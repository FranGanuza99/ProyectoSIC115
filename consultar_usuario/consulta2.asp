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
     <body leftmargin="0" topmargin="0">
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

<br><br>
          <p id="titulo">Consultar usuario</p>
       <br>
       <hr>
       <br>
       <br>
       <br>
		   <div id='logo1'><br>
               <td valign="top" class="content">
			 
                  <% 
                    Dim conn, SQL, log, nom, apel

                    log = Request.QueryString("usuario")

                    set conn=Server.CreateObject("ADODB.Connection")
                    conn.open "Datos","",""

                    SQL="SELECT * FROM usuarios WHERE login = '" & Log & "'"
                    SET Lista = conn.execute(SQL)

                    while Not(Lista.EOF)
                        log = Lista("Login")
                        nom=Lista("Nombre")
                        apel=Lista("Apellido")
                  %>
                 <center> <table id= margenInput2 width = "140%"  cellspacing=1 cellpadding=1 border=1>
                        <tr style="color:black;font-size:150%;"> 
                           <th>Nombre de Usuario </th>
                           <td><%=log%></td>
                        </tr>
                        <tr style="color:black;font-size:150%;"> 
                           <th>Nombres</th>
                           <td><%=nom%></td>
                        </tr>
                        <tr style="color:black;font-size:150%;"> 
                           <th>Apellidos</th>
                           <td><%=apel%></td>
                        </tr>
                  <%
                        Lista.MoveNext
                    Wend
                    Lista.Close
                  %>
                  </table></center>
                </td>
              </tr>
           </table>
		   <!--Boton regresar a nueva busqueda -->
       <br>
      <a id="nuevaE" href="./consultar_usuario.asp">Consultar nuevamente</a>
      <!-- -->
         </div>
      
     </body>
</html>
