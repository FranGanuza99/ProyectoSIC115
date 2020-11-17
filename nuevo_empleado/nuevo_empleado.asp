<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

     <head>
          <title>Sistema Contable</title>
          <META HTTP-EQUIV="EXPIRES" CONTENT="0">
          <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
          <meta name="Sitio Contable" content="Sistema Contable Empresa Solidaria Textil"/>
          <script language = "javascript" src = "formularios.js"></script>   
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
         <p id="titulo"> Formulario de nuevo empleado</p>
         <br>
         <hr>
         <br>
         <br>
         <br>
      
     <fieldset id="tablaLoginEmpleado" style="padding:2">

      <td valign="top" class="content">      
        
       .<center><h2><N> Complete el fomulario con los datos correspondientes</h2></center>
       <br>
          <form method="post" action="capturar_datos.asp" onSubmit = "return(validar(this));">
          <center><p id="inputEmpleado">Nombre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input id="cajitasInput"  type="text" name="nombre" size="25" value=""<% =Request("log") %>">
          <p>&nbsp;</p>
          <center><p id="inputEmpleado">Apellido&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input id="cajitasInput"  type="text" name="apellido" size="25" value=""<% =Request("log") %>">
          <p>&nbsp;</p>
          <center><p id="inputEmpleado">Cargo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input id="cajitasInput"  type="text" name="puesto" size="25" value=""<% =Request("log") %>">
          <p>&nbsp;</p>  
          <center><p id="inputEmpleado">Salario&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input id="cajitasInput"  type="text" name="salario" size="25" value=""<% =Request("log") %>">   
          <p>&nbsp;</p>
          <center><p id="inputEmpleado">Horas X ($)&nbsp;&nbsp;
          <input id="cajitasInput"  type="text" name="hora" size="25" value=""<% =Request("log") %>">
                      <br>
                      <br><br>
                      <br>

             <p align="center"><input id="margenInput" type="submit" name="Submit" value="Guardar"></p>
                      </form>
                   <fielset>
               </td>
             </tr>
           </table>
         </div>
     </body>
</html>
