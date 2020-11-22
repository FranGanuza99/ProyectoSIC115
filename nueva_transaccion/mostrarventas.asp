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
          <!--#include virtual="/Sistema_Contable/plantilla.asp"-->
		   <div id='logo1'>
               <td valign="top" class="content"> 
             <%    
               orden = Request.form("orden")
               tipo = Request.form("tipo")

               Set Conexion = Server.CreateObject("ADODB.Connection")
	       Conexion.open "Datos","",""
	       Dim sql, List
	       sql="SELECT  Catalogo.NombreCuenta,  ordenes.Monto, ordenes.PrecioU, ordenes.Cantidad, ordenes.codigo FROM ordenes, Catalogo WHERE ordenes.codigo=Catalogo.codigo and ordenes.NumOrden="&orden&" ORDER BY NumOrden"
	       set List = Conexion.execute(sql)

               precio=List("PrecioU")
               p=precio*1.1
               cantidad=List("Cantidad")
               m=p*cantidad
      %>
   
    <fieldset style="padding: 20; margin:40; border-style:rige;">
    <h1 align="center">Orden de fabricacion</h1>
    <form name = "form1" method = "post" action = "registrarVentas.asp" OnSubmit = "return(validar2(this));">
    <table width="500" cellspacing="20" align="center"> 
      <tr>
          <td>
	       No de Orden:<br>
               <input type="text" name="orden" value="<%=orden%>" size="10" onfocus="this.blur()">
          </td>
      </tr>
      <tr>
           <td>  Producto:<br>
               <input type="text" name="producto" value="<%=List("NombreCuenta")%>" size="10" onfocus="this.blur()">
          </td>
           <td align="right">
               Cantidad:<br>
              <input type="text" name="cantidad" value="<%=cantidad%>" size="10" onfocus="this.blur()">
           </td>
       </tr>
       <tr>
          <td>
	       Precio Unitario<br>
               <input type="text" name="precio" value="<%=p%>" size="10" onfocus="this.blur()">
          </td>
          <td align="right">
	       Monto:<br>
               <input type="text" name="monto" value="<%=m%>" size="10" onfocus="this.blur()">
          </td>
       </tr>
       <tr>
           <td><input type = "radio" name = "coc" value = "1" checked = "true">Efectivo<br></td>
           <td><input type = "radio" name = "coc" value = "2">Credito<br></td>
       </tr>
       <tr>
          <th ><input type = "submit" name = "aceptar" value = "ACEPTAR"></th>
             <th ><input type = "BUTTON" name = "cancelar" value = "CANCELAR" onclick="window.location='ventas.asp?tipo=1'"></th>
      </tr>

  </table>
         <input type = "hidden" name = "codigo" value = "<%= List("codigo") %>">          
         <input type = "hidden" name = "tipo" value = "<%= tipo %>">
  </form>                            
  </fieldset>

                </td>
              </tr>
           </table>
         </div>
     </body>
</html>
