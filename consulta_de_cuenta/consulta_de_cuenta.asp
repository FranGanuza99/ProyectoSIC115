<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
     <head>
          <title>Sistema Contable</title>
          <META HTTP-EQUIV="EXPIRES" CONTENT="0">
          <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
          <meta name="Sitio Contable" content="Empresa Consultora de Software MICROTECN"/>
          
          <script language="Javascript">
                function validar(f){
                    if(f.cuenta.value == 0){
                       alert("Debe seleccionar una cuenta");
                       return false;
                    }
                    return true;
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
        background:url('/imagen/fondodeault.png') no-repeat center center fixed;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
        }
      </style>

          <!--#include virtual="/Sistema_Contable/plantilla.asp"-->
          <br><br>
                <p id="titulo">Consultar cuentas</p>
       <br>
       <hr>
       <br>
       <br>
       <br>
		   <div id='logo1'>
              <fieldset id="tablaLoginCom" style="padding:2"> 
               <td valign="top" class="content"> 
	
         <br><br>

                       <center><form name = "formusuario" method = "get" action = "consulta.asp" onsubmit="return(validar(this))">
                       <table>    
                             <tr>
                                <th colspan = "2"> Selecciona una Cuenta </th>              
                             </tr>
                             <tr>
                                <td>
                                  <br><br>
 	                            <center><select name="cuenta">
                                          <option value="0">-Seleccione una cuenta-</option>
	                     <% 
		               Dim Conexion 
		               Set Conexion = Server.CreateObject("ADODB.Connection")
		               Conexion.open "Datos","",""
		               sql="SELECT DISTINCT Catalogo.NombreCuenta, Catalogo.codigo  FROM Catalogo, Diario where Catalogo.Codigo=Diario.codigo ORDER BY Catalogo.NombreCuenta"
		               set List = Conexion.Execute(sql)
                            
		               dim loginusr 
                                
            		       While Not (List.EOF)
			           nombre = List("NombreCuenta")
                                   codigo = List("codigo")
			           Response.Write("<option value= '" & codigo &"' >" & nombre & "</option>")
			           List.MoveNext
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
                     </table>  
                 </form></center>        
              </td>
            </tr>
         </table>
       </div>
     </body>
</html>
