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
      background:url('/imagen/index.png') no-repeat center center fixed;
      -webkit-background-size: cover;
      -moz-background-size: cover;
      -o-background-size: cover;
      background-size: cover;
      }
    </style>

        <!--#include virtual="/Sistema_Contable/plantilla.asp"-->
		 <br><br>
       <p id="titulo">Datos del empleado</p>
       <br>
       <hr>
       <br>
       <br>
       <br>
               <td valign="top" class="content"> 
			   <center><h2 style="color: black">N&oacutemina personal</h2></center>
         <br>
                  <% 
                    Dim conn, SQL, log, nom, apel

                    Log = Request.QueryString("usuario")

                    set conn=Server.CreateObject("ADODB.Connection")
                    conn.open "Datos","",""

                    SQL="SELECT * FROM Empleados WHERE Apellidos = '" & Log & "'"
                    SET Lista = conn.execute(SQL)

                    while Not(Lista.EOF)
                        Ape=Lista("Apellidos")
                        Nom=Lista("Nombres")
                        Pue=Lista("Puesto")
                        Sal=Lista("Salario")
                        Hor=Lista("HOras")
                  %>
                  <table id="margenInput" align="center" width=250 cellspacing=10 cellpadding=10 border=1> 
                        <tr> 
                           <th>Nombres: </th>
                           <td><%=Nom%></td>
                        </tr>
                        <tr> 
                           <th>Apellidos:</th>
                           <td><%=Ape%></td>
                        </tr>
                        <tr> 
                           <th>Puesto:</th>
                           <td><%=Pue%></td>
                        </tr>
                        <tr> 
                           <th>Salario:</th>
                           <td>$&nbsp;<%=Sal%></td>
                        </tr>
                        <tr> 
                           <th>Horas:</th>
                           <td><%=Hor%></td>
                        </tr>
                  <%
                        Lista.MoveNext
                    Wend
                    Lista.Close
                  %>
                  </table>
                </td>
              </tr>
           </table><br><br><br>
            <center><a id="titulo" style="font-size: 18px" href="./consultar_datos_de_empleado.asp">Realizar otra consulta</a> </center>
         </div>

      <!--Boton regresar a nueva busqueda -->
     
      <!-- -->
     </body>
</html>
