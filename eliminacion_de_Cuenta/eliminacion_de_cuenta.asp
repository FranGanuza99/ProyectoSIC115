  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
     <head>
          <title>Sistema Contable</title>
          <META HTTP-EQUIV="EXPIRES" CONTENT="0">
          <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
          <meta name="Sitio Contable" content="Sistema Contable Empresa Consultora de Software MICROTECN"/>

          <script language="Javascript">
                function validar(f){
                    if(f.cuenta.value == 0){
                       alert("Debe seleccionar una Cuenta");
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
                <p id="titulo">Eliminar cuentas</p>
       <br>
       <hr>
       <br>
       <br>
       <br>
       <div id='logo1'>
       <fieldset id="tablaLoginCom" style="padding:2">
		
               <td valign="top" class="content"> 
			  
         <br><br>
                  <%
                    Dim Conexion 
                    Set Conexion = Server.CreateObject("ADODB.Connection")
                    Conexion.open "Datos","",""
            
                    SQL="SELECT COUNT(*) AS total FROM Catalogo"
                    r=conexion.Execute(SQL)
                    num=r("total")
            
                    if num=0 then
                       Response.write("<center><h1>No hay  Cuentas en el catalogo</h1></center>")
                    else

                  %>
                  <form name = "formcuenta" method = "get" action = "mostrar.asp" onsubmit="return(validar(this))">
                   <center><table>    
                        <tr>
                           <th colspan = "2"> Seleccione la cuenta que desea eliminar </th>              
                        </tr>
                        <tr>
                            <td>
                            <br><br>            
 	                    <center><select name="cuenta">
                                <option value="0">-Seleccione una cuenta-</option>
	                <% 
		           sql="SELECT * FROM Catalogo ORDER BY NombreCuenta"
		           set UserList = Conexion.execute(sql)

		           dim loginusr 

		           While Not (UserList.EOF)
			      nom = UserList("NombreCuenta")
                              cod = UserList("Codigo")
			      Response.Write("<option value= '" & cod &"' >" & nom & "</option>")
			      UserList.MoveNext
		           Wend
		           Conexion.close
	                 %> 
	                   </select></center>
                           </td>
                        </tr> 
                        <tr>            
                           <td colspan = "2">
                            <br><br>
                              <input type = "submit" name = "aceptar" value = "Aceptar ">
                          </td>
                        </tr> 
                     </table>  </center>
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
