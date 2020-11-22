<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
     <head>
          <title>Sistema Contable</title>
          <META HTTP-EQUIV="EXPIRES" CONTENT="0">
          <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
          <meta name="Sitio Contable" content="Sistema Contable Empresa Consultora de Software MICROTECN"/>
  
          <script language="JavaScript" src = "forms.js"></script>
          <script language = "javascript" src = "visual.js"></script>
 
          <link rel="stylesheet" href="estilo.css" type="text/css">
          <link rel="stylesheet" href="estilo1.css" type="text/css">

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
       <p id="titulo">Registro de compras </p>
       <br>
       <hr>
       <br>
       <br>
       <br>

		   <div id='logo1'>
        <fieldset id="tablaLoginCom" style="padding:2">
               <td valign="top" class="content"> 
  
            
  <% tipoCompra = Request.QueryString("tipo")

        if tipoCompra = "1" then 

        Dim Conexion 
	Set Conexion = Server.CreateObject("ADODB.Connection")
	Conexion.open "Datos","",""
	Dim sql, List
	sql="SELECT * FROM catalogo WHERE Codigo >= 1063 AND Codigo <= 1079 OR Codigo = 0 ORDER BY Codigo"
	set List = Conexion.execute(sql)
	dim cod, nom
  %>

  <form  name = "form1" method = "post" action = "registrarCompras.asp" OnSubmit = "return(validar2(this));">
  
   <center><select name="mp">
      <% While Not (List.EOF)
          cod = List("codigo")
          nom = List("NombreCuenta")
          Response.Write("<option value= '" & cod &"' > " &  nom & "</option>")
          List.MoveNext
         Wend
      %>
    </select></center>
    <br>
    <table id= fieldset1 width = "40%"  cellspacing=1 cellpadding=0 border=0>
    <tr style="color:black;font-size:140%">  
    <th>Cantidad</th>
    <td> <input type = "text" name = "cantidad" maxlength = "10"><br></td><br>
  </tr>
  
   
   <tr style="color:black;font-size:140%"> 
   <th>Precio</th>
    <td><input type = "text" name = "precio" maxlength = "10"><br></td>
 </tr>
   
    <tr style="color:black;font-size:110%"> 
    <td><input type = "radio" name = "coc" value = "1" checked = "true">Efectivo<br></td>

    <td><input type = "radio" name = "coc" value = "2">Credito<br></td>
    </tr>
    <input type = "hidden" name = "tipo" value = "<%= tipoCompra %>">
   <td> <input id="nInput" type = "submit" value = "Enviar" name = "Aceptar"> </td>
  </form>
</table>
  <% 
     Conexion.close  
     else 
  %>

  <form name = "form2" method = "post" action = "registrarCompras.asp" OnSubmit = "return(validar3(this));">
    Monto <input type = "text" name = "cantidad" maxlength = "10"><br>   
    <input type = "radio" name = "coc" value = "1" checked = "true">Efectivo<br>
    <input type = "radio" name = "coc" value = "2">Credito<br>
    <input type = "hidden" name = "tipo" value = "<%= tipoCompra %>">
    <input type = "submit" value = "Enviar" name = "Aceptar"> 
  </form>

  <% end if %>

                </td>
              </tr>
           </table>
         </div>
     </body>
</html>
