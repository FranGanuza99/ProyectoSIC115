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
          background:url('/imagen/index.png') no-repeat center center fixed;
          -webkit-background-size: cover;
          -moz-background-size: cover;
          -o-background-size: cover;
          background-size: cover;
          }
        </style>

         <!--#include virtual="/Sistema_Contable/plantilla.asp"-->
		 <br><br>
       <p id="titulo">Libro diario </p>
       <br>
       <hr>
       <br>
       <br>
       <br>
       

        <center><h1 style="color: #2A2D2E">Clasificaci&oacuten  de transacciones b&aacutesicas de la empresa seg&uacuten su tipo</h1></center><br><br>
                <td valign="top" class="content">  
         <p id="tituloCompras">Compras</p><br><br>
                  <a id="cuentasCompras" href = "compras.asp?tipo=1"><font style="font-size:200%" color="black"><N> Materia Prima </a></font><br>
                  <a id="cuentasCompras" href = "compras.asp?tipo=2"><font style="font-size:200%" color="black"> Articulos de Oficina </a></font><br>
                  <a id="cuentasCompras" href = "compras.asp?tipo=3"><font style="font-size:200%" color="black"> Terreno </a></font><br>
                  <a id="cuentasCompras" href = "compras.asp?tipo=4"><font style="font-size:200%" color="black"> Edificio </a></font><br>
                  <a id="cuentasCompras" href = "compras.asp?tipo=5"><font style="font-size:200%" color="black"> Automovil </a></font><br>
                  <a id="cuentasCompras" href = "compras.asp?tipo=6"><font style="font-size:200%" color="black"> Mobiliario y Equipo </a></font><br>
                  

                <p id="tituloPagos">Pagos</p><br><br>
               
                 <a id="cuentasPagos" href = "pagos.asp?tipo=1"><font style="font-size:200%" color="black">Servicios Prestados </a></font><br>
                 <a id="cuentasPagos" href = "pagos.asp?tipo=2"><font style="font-size:200%" color="black">Alquiler </a></font><br>
                 <a id="cuentasPagos" href = "pagos.asp?tipo=3"><font style="font-size:200%" color="black"> Cuentas x Pagar </a></font><br>
                 <a id="cuentasPagos" href = "pagos.asp?tipo=4"><font style="font-size:200%" color="black"> Documentos x Pagar </a></font><br>
                 <a id="cuentasPagos" href = "pagos.asp?tipo=5"><font style="font-size:200%" color="black"> Hipotecas </a></font><br>
                 <a id="cuentasPagos" href = "pagos.asp?tipo=6"><font style="font-size:200%" color="black"> Salarios </a></font><br>
                 <a id="cuentasPagos" href = "pagos.asp?tipo=7"><font style="font-size:200%" color="black"> Propaganda </a></font><br>

                 <p id="tituloVentas">Ventas</p><br><br>
                 <a  id="cuentasVentas" href = "ventas.asp?tipo=1"><font style="font-size:200%" color="black"> Jeans Damas </a></font><br>
                 <a id="cuentasVentas" href = "ventas.asp?tipo=2"><font style="font-size:200%" color="black"> Vestidos de Ni�a</a></font><br>

                </td>
              </tr>
           </table>
         </div>
     </body>
</html>
