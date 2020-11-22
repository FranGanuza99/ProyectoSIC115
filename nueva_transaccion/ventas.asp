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
       <p id="titulo">Registro de ventas </p>
       <br>
       <hr>
       <br>
       <br>
       <br>
		   <div id='logo1'>
               <td valign="top" class="content"> 
                   
      <%    
        tipoVenta = Request.QueryString("tipo")

        if tipoVenta = "1" then 

        Dim Conexion 
	Set Conexion = Server.CreateObject("ADODB.Connection")
	Conexion.open "Datos","",""
	Dim sql, List
	sql="SELECT ordenes.NumOrden, Catalogo.NombreCuenta FROM ordenes, Catalogo WHERE ordenes.codigo=Catalogo.codigo and ordenes.codigo>1079 and ordenes.codigo<1083 ORDER BY NumOrden"
	set List = Conexion.execute(sql)
	dim cod, nom
     %>
	 <fieldset id="tablaLoginCom" style="padding:2">
  <form name = "form1" method = "post" action = "mostrarventas.asp" OnSubmit = "return(validar2(this));">
   <br> <center>Numero de orden: </center><br>
   <center> <select name="orden">
       <option  value ="0">Seleccione una orden</option>
      <% While Not (List.EOF)
          cod = List("NumOrden")
          nom = List("NombreCuenta")
          Response.Write("<option value= '" & cod &"' >" & cod &"- "&nom&"</option>")
          List.MoveNext
         Wend
      %>
    </select></center>
    
    
    <input type = "hidden" name = "tipo" value = "<%= tipoVenta %>"><br><br>
    <input id="nInput2" type = "submit" value = "Enviar" name = "Aceptar"> 
  </form>
  <p>&nbsp</p><br>
  <center><a href="../nueva_ordenfabricacion/norden_fabricacion.asp">Crear nueva Orden de fabricacion</a></center>
  

  <% 
     Conexion.close  
     else 
  %>
<h1><font color="black"><N> Registro de Ventas <N></font></h1>
  <form name = "form2" method = "post" action = "registrarVentas.asp" OnSubmit = "return(validar3(this));">
    Monto <input type = "text" name = "monto" maxlength = "10"><br>   
    <input type = "radio" name = "coc" value = "1" checked = "true">Efectivo<br>
    <input type = "radio" name = "coc" value = "2">Credito<br>
    <input type = "hidden" name = "tipo" value = "<%= tipoVenta %>">
    <input type = "submit" value = "Enviar" name = "Aceptar"> 
  </form>

  <% end if %>

                </td>
              </tr>
           </table>
         </div>
     </body>
</html>
