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
          <% tipopago = Request.QueryString("tipo") %>


  <form name = "form" method = "Post" action = "registrarPagos.asp" OnSubmit = "return(validar3(this));">
    Cantidad a pagar <input type = "text" name = "cantidad" maxlength = "10"><br>   
    <input type = "radio" name = "coc" value = "1" checked = "true">Efectivo<br>
    <input type = "radio" name = "coc" value = "2">Cheque<br>
    <input type = "hidden" name = "tipo" value = "<%= tipopago %>">
    <input type = "submit" value = "Enviar" name = "Aceptar"> 
  </form>
 <% tipopago = Request.QueryString("tipo") %>


  <form name = "form" method = "Post" action = "registrarPagos.asp" OnSubmit = "return(validar3(this));">
    Cantidad a pagar <input type = "text" name = "cantidad" maxlength = "10"><br>   
    <input type = "radio" name = "coc" value = "1" checked = "true">Efectivo<br>
    <input type = "radio" name = "coc" value = "2">Cheque<br>
    <input type = "hidden" name = "tipo" value = "<%= tipopago %>">
    <input type = "submit" value = "Enviar" name = "Aceptar"> 
  </form>

                </td>
              </tr>
           </table>
         </div>
     </body>
</html>
