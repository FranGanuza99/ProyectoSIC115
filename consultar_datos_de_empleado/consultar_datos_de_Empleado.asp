<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
     <head>
          <title>Sistema Contable</title>
          <META HTTP-EQUIV="EXPIRES" CONTENT="0">            
          <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
          <meta name="Sitio Contable" content="Sistema Contable Empresa Consultora de Software MICROTECN"/>
          
          <script language="Javascript">
                function validar(f){
                    if(f.usuario.value == 0){
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
       <p id="titulo" style="font-size: 55px;"> Consultar Datos Del Empleado</p>
       <br>
       <hr>
       <br>
       <br>
       <br>

               <td valign="top" class="content"> 
			  
         <br>
                  <form name = "formusuario" method = "get" action = "consulta2.asp" onsubmit="return(validar(this))">
                      <center> <table>    
                             <tr>
                                <th colspan = "2" style="font-size: 45px; position: fixed; padding-left: 2cm;"> Selecciona un Empleado </th>  

                             </tr>

                             <tr>
                                <td>              
 	                           <select name="usuario" style="margin: 2.50cm; font-size: 30px;">
                                     <option value="0">-Ning&uacuten empleado seleccionado-</option>
	                           <% 
		                     Dim Conexion 
		                     Set Conexion = Server.CreateObject("ADODB.Connection")
		                     Conexion.open "Datos","",""
		                     Dim sql, UserList
		                     sql="SELECT * FROM Empleados"
		                     set UserList = Conexion.execute(sql)

		                     dim loginusr 

		                     While Not (UserList.EOF)
			                 loginusr = UserList("Apellidos")
			                 Response.Write("<option value= '" & loginusr &"' >" & loginusr & "</option>")
			                 UserList.MoveNext
		                     Wend
		                     Conexion.close
	                           %> 
	                           </select>
                                </td>
                             </tr> 
                             <tr>            
                                <td colspan = "2">
                                   <input id="margenInput" type = "submit" name = "aceptar" value = "Aceptar " style="font-size: 28px; border-radius: 15px; border-color: black; border-width: 4px;">
                                </td>
                             </tr> 
                       </table>  </center>
                  </form>
                  <br>
                </td>
              </tr>
           </table>
         </div>
     </body>
</html>
