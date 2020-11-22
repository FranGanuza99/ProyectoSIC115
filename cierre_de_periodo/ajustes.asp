  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
     <head>
          <title>Sistema Contable</title>
           <META HTTP-EQUIV="EXPIRES" CONTENT="0">
           <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
           <meta name="Sitio Contable" content="Empresa Consultora de Software MICROTECN"/>
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
        background:url('/imagen/wall3.jpg') no-repeat center center fixed;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
        }
      </style>
      
          <!--#include virtual="/Sistema_Contable/plantilla.asp"-->
		  <div id='logo1'>
               <td valign="top" class="content">    
               <%  
                 if Session("PeriodoCerrado") = "si" then
                    Response.redirect"../nueva_transaccion/nueva_transaccion.asp"
                 else
               %>
                 <h1>Debes cerrar el periodo !!</h1>
                 <h1>Para hacer los ajustes</h1>
               <% end if %>
               </td>
             </tr>
          </table>
        </div>
     </body>
</html>