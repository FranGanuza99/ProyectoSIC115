  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
     <head>
          <title>Sistema Contable</title>
          <META HTTP-EQUIV="EXPIRES" CONTENT="0">
          <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
          <meta name="Sitio Contable" content="Sistema Contable Empresa Consultora de Software MICROTECN"/>
    	  
          <script language = "javascript" src = "../script/formularios2.js"></script>	
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
          <br><br>
       <p id="titulo"> Modificar datos de empleados</p>
       <br>
       <hr>
       <br>
       <br>
       <br>
		  <div id='logo1'>
           
                  <% 
                    'Se Obtienen los datos del usuario al que se le modificaran los datos
	            Dim conn
	            Set conn = Server.CreateObject("ADODB.Connection")
	            conn.open "Datos","",""
	            Dim sqldat, userid

	            apell = Request.QueryString("usuario")
	            sqldat="SELECT * FROM Empleados WHERE Apellidos = '" & apell & "'"

	            Dim datos
	            set datos = conn.execute(sqldat)
	            Dim  nom, apel, puest, salario, horas

	            nom = datos("Nombres")
	            apel = datos("Apellidos")
	            puest = datos("Puesto")
                    salario = datos("salario")
                    horas = datos("horas")
	            conn.close	
                  %>
                <form name = "usuario" method = "post" action = "actualizar.asp" onSubmit = "return(validar3(this));">
 <fieldset id="tablaLogin6" style="padding:2">
                  <table id="fieldset1">

                        <tr>
                           <th style="font-size: 18px" colspan = "2"> Datos de Cuenta </th>
                        </tr> 
                        <tr>
                           <td> Apellidos: </td>
                           <td> <input type  ="text" name = "ap" maxlength = "50" value = "<%= apel %>"> 
                                <input type  ="hidden" name = "ap2" value = "<%= apel %>">
                           </td>
                        </tr> 
                        <tr>
                           <td> Nombres: </td>
                           <td> <input type  ="text" name = "no" maxlength = "50" value = "<%= nom %>"> </td>
                        </tr> 
                        <tr>
                           <td> Puesto: </td>
                           <td> <input type  ="text" name = "pu" maxlength = "50" value = "<%= puest %>"> </td>
                        </tr> 
                        <tr>
                           <td> Salario: </td>
                           <td> <input type  ="text" name = "sa" maxlength = "25" value = "<%= salario %>"> </td>
                        </tr> 
                        <tr>
                           <td> Horas: </td>
                           <td> <input type  ="text" name = "ho" maxlength = "25" value = "<%= horas %>"> </td>
                        </tr> 
                        <tr>
                           <th colspan = "2"> <br>
                           <input id="margenInput" type = "submit" name = "aceptar" value = "Aceptar ">&nbsp;&nbsp;&nbsp;&nbsp;
                           <input id="margenInput" type  ="reset" name = "cancelar" value = "Restaurar"> 
                           </th>
                        </tr> 
                  </table>
                  </form>
                </td>
              </tr>
           </table>
         </div>
     </body>
</html>
