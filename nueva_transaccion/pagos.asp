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
                <p id="titulo">Registro de pagos </p>
       <br>
       <hr>
       <br>
       <br>
       <br>
       <div id='logo1'>
		   <fieldset id="tablaLoginCom" style="padding:2">
               <td valign="top" class="content"> 
			  
                   <% tipopago = Request.QueryString("tipo") %>

                   <form name = "form" method = "Post" action = "registrarPagos.asp" OnSubmit = "return(validar3(this));">
                    <table id= fieldset1 width = "40%"  cellspacing=1 cellpadding=0 border=0>
                      <tr style="color:black;font-size:140%">
                       <th>Cantidad a pagar</th>
                         <td><input type = "text" name = "cantidad" maxlength = "10"><br>   </td><br></tr>
                        <th><input type = "radio" name = "coc" value = "1" checked = "true">Efectivo</th>
                        <td><input type = "radio" name = "coc" value = "2">Cheque<br></td>
                        <input type = "hidden" name = "tipo" value = "<%= tipopago %>"><tr>
                        <td><input id="nInput3"  type = "submit" value = "Enviar" name = "Aceptar"> </td></tr>
                   </form>
                 </table>
                   <% tipopago = Request.QueryString("tipo") %>
                </td>
              </tr>
           </table>
         </div>
     </body>
</html>
