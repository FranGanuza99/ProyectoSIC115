<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
     <head>
          <title>Sistema Contable</title>
          <META HTTP-EQUIV="EXPIRES" CONTENT="0">
          <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
          <meta name="Sitio Contable" content="Sistema Contable Empresa Consultora de Software MICROTECN"/>
          
          <script language="Javascript">
                function validar(f){
                    if(f.empleado.value == 0){
                       alert("Debe seleccionar un empleado");
                       return false;
                    }
                }
          </script>

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
		 <br><br>
       <p id="titulo" style="font-size: 55px;">Eliminar empleado</p>
       <hr>
               <center> <td valign="top" class="content"> 
			  
                    <%
                    Dim Conexion 
                    Set Conexion = Server.CreateObject("ADODB.Connection")
                    Conexion.open "Datos","",""
            
                    SQL="SELECT COUNT(*) AS total FROM Empleados"
                    r=conexion.Execute(SQL)
                    num=r("total")
            
                    if num=0 then
                       Response.write("<center><h1>No hay Empleados en la base de datos</h1></center>")
                    else
                  %>
                  <form name = "Formulario" method = "get" action = "mostrar.asp" onsubmit="return(validar(this))">
                   <table>    
                        <tr>
                           <th colspan = "2" style="font-size: 45px; padding-left: 2cm;"> Seleccione el empleado que desea eliminar</th>              
                        </tr>
                        <br><br>
                        <tr>
                            <td>
                            <br><br>
 	                    <select name="empleado" style="margin: 1.50cm; font-size: 30px;">
                                <option value="0">-Seleccione un usuario-</option>
	                <% 
		           sql="SELECT * FROM Empleados  ORDER BY Apellidos"
		           set UserList = Conexion.execute(sql)

		           dim loginusr 

		           While Not (UserList.EOF)
			      apel = UserList("Apellidos")
			      Response.Write("<option value= '" & apel &"' >" & apel & "</option>")
			      UserList.MoveNext
		           Wend
		           Conexion.close
	                 %> 
	                    </select>
                           </td>
                        </tr> 
                        <br><br>
                        <tr>            
                           <td colspan = "2">
                            <br><br>
                              <input id="margenInput" type = "submit" name = "aceptar" value = "ACEPTAR " style="font-size: 28px; border-radius: 15px; border-color: black; border-width: 4px;">
                          </td>
                        </tr> 

                     </table>  
                   </form>
                 <%
                   end if
                 %>
                </td>
              </tr>
           </table>
          </div>         
     </body>
</html>
