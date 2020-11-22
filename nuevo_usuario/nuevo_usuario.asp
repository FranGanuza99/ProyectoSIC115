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
		      <br><br> <p id="titulo">Formulario para nuevo usuarios</p>
       <br>
       <hr>
        <br><br>
           
                  <% If Session("nuevo")<>"" Then %>
                  <form  name = "add" method = "post" action = "procesarusuario.asp" onSubmit = "return(validar(this));">

                      <table id="margenInput" width = "40%" align="center" cellspacing=10 cellpadding=10 border= 1 >

                           <tr style="color:black;font-size:160%;"> 
                              <th colspan = "2"> Nuevo usuario </th>
                           </tr> 
                           <tr style="color:black;font-size:150%;"> 
                              <td> Nombre del nuevo usuario </td>
                              <td> <input style="text-align: center;" disabled id="cajitasInput" type = "text" name = "usuario" value = '<%=Request.QueryString("usuario")%>'>
                                   <input  type = "hidden" name = "usuario2" value = '<%=Request.QueryString("usuario")%>'>  </td>
								 
                           </tr> 
                           <tr style="color:black;font-size:150%;"> 
                              <td> * Clave </td>
                              <td> <input style="text-align: center;" id="cajitasInput" type  ="password" name = "clave" maxlength = "10"> </td>
                           </tr>  
                           <tr style="color:black;font-size:150%;"> 
                              <td> * Confirmar Clave </td>
                              <td> <input style="text-align: center;" id="cajitasInput" type  ="password" name = "clave2" maxlength = "10"> </td>
                           </tr> 
                           <tr style="color:black;font-size:150%;"> 
                              <td> * Nombres</td>
                              <td> <input style="text-align: center;" id="cajitasInput" type  ="text" name = "nombre" maxlength = "25"> </td>
                           </tr> 
                           <tr style="color:black;font-size:150%;"> 
                              <td> * Apellidos </td>
                              <td> <input style="text-align: center;" id="cajitasInput" type  ="text" name = "apellido" maxlength = "25"> </td>
                           </tr> 
                           <tr>
                              <td colspan = "2"> <br>
                                  <input   id="cajitasInput" type = "submit" name = "enviar" value = "Enviar ">
                                  &nbsp;&nbsp;&nbsp;&nbsp;<input id="cajitasInput" type  ="button" name = "cancelar" value = "Cancelar" onClick = "window.location = 'cancel.asp';"> 
                              </td>
                           </tr> 
                      </table>  
                  </form>
                  <script language = "javascript"> 
                        document.add.clave.focus();
                  </script>
                  <% else %>
                  <%
                    dim Us
                    Us = Request.Form("Usuario")
                    If(Request.Form("usuario")<>"") Then
                       set conn=Server.CreateObject("ADODB.Connection")
                       conn.open "Datos","",""
                       sql = "SELECT * FROM usuarios WHERE login = '" & Request.Form("usuario") & "'"
 
                       set lista = conn.execute(sql)
 
                       if not(lista.eof) then
                          Response.write("<script language = 'javascript'>alert('Nombre de usuario a existente\n Por favor, ingrese uno nuevo.')</script>")
                       else
                          Session("nuevo") = "ok"
                          Response.redirect("./nuevo_usuario.asp?usuario=" & Us)
                       end if
                    end if
                  %>
                  <form name = "addusuario" method = "post" action = "nuevo_usuario.asp" onSubmit = "return(validar2(this));">
                    <fieldset id="tablaLogin2" style="padding:2">
                  <table align="center" width=250 cellspacing=10 cellpadding=10 border=0 bordercolor=#9984a4>
                       
                        <tr>
                          <br><br>
                           <tr><h2 style="color: black"; align="center"> Introduzca su nombre de usuario</h2></tr>
                           <td> <input id="cajitasInput" type  ="text" name = "usuario" maxlength = "10"> </td>
                        </tr> 
                        <tr>
                           <th colspan = "2"> 
                              <input id="margenInput" type = "submit" name = "check" value = "Aceptar">&nbsp;&nbsp;&nbsp;
                              <input id="margenInput" type  ="button" name = "cancelar" value = "Cancelar" onClick = "window.location = 'cancel.asp';"> 
                           </th>
                        </tr> 
                   </table>  
                   </form>
                   <script language = "javascript"> document.addusuario.usuario.focus(); </script>
                   <% end if %>
                 </td>
				 </div>
     </body>
</html>
