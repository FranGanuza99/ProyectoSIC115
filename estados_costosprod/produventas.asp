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
          <script languge="Javascript">
             function validar(f){
                if(f.orden.value==0){
                   alert("Seleccione una orden!!");
                   f.orden.focus();
                   return false;
                } 
                else{
                   return true
                }
             }
          </script>
          
          <%
               'Creacion del Objeto para conectarse a la base de datos 
                Set conn=Server.CreateObject("ADOdb.Connection")

                'Se abre la conexi�n a la base de datos
                conn.Open "Datos","","" 
                 
               
                sql="SELECT * FROM ordenes ORDER BY NumOrden"
                set R=conn.Execute(sql)

           %>       
      </head>
      <style type="text/css">
      body {
      background:url('/imagen/fondodefault2.png') no-repeat center center fixed;
      -webkit-background-size: cover;
      -moz-background-size: cover;
      -o-background-size: cover;
      background-size: cover;
      }
    </style>
      <body leftmargin="10" topmargin="160">
          <!--#include virtual="/Sistema_Contable/plantilla.asp"-->
          <br><br>
                <p id="titulo" style="font-size: 55px;">Finalizar orden de fabricaci&oacuten</p>
       <br>
       <hr>
       <br>
       <br>
       <br>

      <div id='logo1'>
<fieldset id="tablaLoginCom" style="padding:2">
               <td valign="top" class="content"> 
                    <p id="titulo" style="font-size: 35px; margin-top: 20%; color: black; padding-inline-start: 40px;">Seleccione una orden de fabricacion</p>
                    <p>&nbsp</p>
                    <form name="dat" method="POST" action="actualizar.asp" onsubmit="return(validar(this))">
                       <center> <select name="orden" style="margin: 0.5cm; font-size: 25px;">
                           <option value="0" selected>Seleccione una orden</option>
                        <%
                          while Not(R.EOF)
                              num = R("NumOrden")
                        Response.Write("<option value= '" & num & "'>"& num &"</option>")
                        R.MoveNext
                          wend
                        %>
                        </select></center>
                        <p>&nbsp</p>
                       <center> <input type= "submit" name="aceptar" value="Aceptar" style="font-size: 20px; border-radius: 15px; border-color: black; border-width: 4px;"></center>
                   </form>
                </td>
              </tr>
           </table>
         </div>
     </body>
</html>