<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
     <head>
          <title>Sistema Contable</title>
          <META HTTP-EQUIV="EXPIRES" CONTENT="0">
          <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
          <meta name="Sitio Contable" content="Sistema Contable Empresa Consultora de Software MICROTECN"/>
    	  
          <script language = "javascript" src = "../script/formularios.js"></script>	
          
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
     <p id="titulo">Modificar datos de usuario</p>
       <br>
       <hr>
       <br>
       <br>
       <br>
		  <div id='logo1'>
               <td valign="top" class="content" style="color:black;font-size:250%;"> 
			
                  <% 
                    'Se Obtienen los datos del usuario al que se le modificaran los datos
	            Dim conn
	            Set conn = Server.CreateObject("ADODB.Connection")
	            conn.open "Datos","",""
	            Dim sqldat, userid

	            userid = Session("sesion_nombre")
	            sqldat="SELECT * FROM usuarios WHERE Login = '" & userid & "'"

	            Dim datos
	            set datos = conn.execute(sqldat)
	            Dim  nom, apel, pass

	            nom = datos("Nombre")
	            apel = datos("Apellido")
	            pass = datos("clave")
	            conn.close	
                  %>
                    
                 <form name = "usuario" method = "post" action = "actualizar.asp" onSubmit = "return(validar3(this));">

                      <table style="align-content: center">
                        <br>
                          <center><p style="color: black ; font-size: 24px">Datos de cuenta</p></center><br>
                            <tr style="color:black;font-size:175%;"> 

                               <td> Usuario </td>
                               <td> &nbsp;&nbsp;&nbsp; <input id="cajitasInput" type  ="text" name = "login" maxlength = "10" disabled value = "<%= userid %>"> 
                                    <input type  ="hidden" name = "user" value = "<%= userid %>">
                               </td>
                            </tr> 
                            <tr style="color:black;font-size:175%;"> 
                               <td> Contrase&ntildea </td>
                               <td>&nbsp;&nbsp;&nbsp; <input id="cajitasInput" type  ="password" name = "clave" maxlength = "10" value = "<%= pass %>"> </td>
                            </tr>  
                            <tr style="color:black;font-size:175%;"> 
                               <td> Confirmar contrase&ntildea </td>
                               <td>&nbsp;&nbsp;&nbsp; <input id="cajitasInput" type  ="password" name = "clave2" maxlength = "10" value = "<%= pass %>"> </td>
                            </tr> 
                            <tr style="color:black;font-size:175%;"> 
                               <td> Nombre </td>
                               <td> &nbsp;&nbsp;&nbsp;&nbsp;<input id="cajitasInput" type  ="text" name = "nombre" maxlength = "25" value = "<%= nom %>"> </td>
                            </tr> 
                            <tr style="color:black;font-size:175%;"> 
                               <td> Apellido </td>
                               <td> &nbsp;&nbsp;&nbsp;&nbsp;<input id="cajitasInput" type  ="text" name = "apellido" maxlength = "25" value = "<%= apel %>"> </td>
                            </tr> 
                            <tr>
                               <th colspan = "2"> <br><br>
                                    <input id="margenInput" type = "submit" name = "aceptar" value = "ACEPTAR ">&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input id="margenInput" type  ="reset" name = "cancelar" value = "RESTAURAR"> 
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
