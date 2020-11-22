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
                       alert("Debe seleccionar un usuario");
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
     <p id="titulo">Consultar usuario</p>
       <br>
       <hr>
       <br>
       <br>
       <br>
		                    
              <fieldset id="tablaLogin3" style="padding:2">
                        <center> <form name = "formusuario" method = "get" action = "consulta2.asp" onsubmit="return(validar(this))">
                           <table>    
                                <tr><br><br>
                                   <th colspan = "2"> &nbsp</th>              
                                </tr>
                                <tr>
                                   <td>              
 	                              <select name="usuario">
                                          <option value="0">-Seleccione un Usuario-</option>
	                              <% 
		                        Dim Conexion 
		                        Set Conexion = Server.CreateObject("ADODB.Connection")
		                        Conexion.open "Datos","",""
		                        Dim sql, UserList
		                        sql="SELECT * FROM usuarios ORDER BY login"
		                        set UserList = Conexion.execute(sql)
		                        dim loginusr 
		                        While Not (UserList.EOF)
			                  loginusr = UserList("Login")
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
                                    <br>
                                       <input id="margenInput" type = "submit" name = "aceptar" value = "Aceptar ">
                                   </td>
                                </tr> 
                           </table>  
                        </form> </center>
                    </td>
                </tr>
           </table>
          </div>
     </body>
</html>
