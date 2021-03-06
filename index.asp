
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
     <head>
          <title>Sistema Contable</title>
          <META HTTP-EQUIV="EXPIRES" CONTENT="0">
          <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
          <meta name="Sitio Contable" content="Empresa Consultora de Software MICROTECN"/>

          <meta name="viewport" content="width=device-width, initial-scale=1">
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
          
          <style type="text/css">
           @import url("css/formato.css");   

          

		   
            #bg {
            	position: absolute;
            	z-index: -1;
            	top: 160;
            	left: 330;
            	width: 60%;

            <script src="js/jquery.min.js"></script>
            <script type="text/javascript">
            function updateBackground() {
              screenWidth = $(window).width();
              screenHeight = $(window).height();
              bg = $("#bg");
              
              // Proporcion horizontal/vertical
              ratio = 1;
              
              if (screenWidth/screenHeight > ratio) {
                $(bg).height("auto");
                $(bg).width("100%");
              } else {
                $(bg).width("auto");
                $(bg).height("100%");
              }

              if ($(bg).width() > 0) {
                $(bg).css('left', (screenWidth - $(bg).width()) / 2);
              }  
            }
            $(document).ready(function() {
              updateBackground();
              $(window).bind("resize", function() {
                updateBackground();
              });
            });



            </script>
          </style>
     </head>

    <style type="text/css">
      body {
      background:url('/imagen/fondodefault2.jpg') no-repeat center center fixed;
      -webkit-background-size: cover;
      -moz-background-size: cover;
      -o-background-size: cover;
      background-size: cover;
      }
    </style>

     <body leftmargin="0" topmargin="0" background="ichigo.jpg" >

         <div id="header">
             <table width="100%" cellspacing="0" cellpadding="0">
                  <tr><tr><tr>
                     <td width="1000" valign="center">&nbsp;</td>
                </tr></tr></tr>
             </table>
         </div>

         <div>
            <nav class="navbar navbar-inverse">
               <div class="container-fluid">
                 <div class="navbar-header">
                   <a class="navbar-brand">MICROTECN</a>
                 </div>
                 <ul class="nav navbar-nav">
                  <li class="active"><a href="../index.asp">INICIO</a></li> 
                 </ul>
         
                 <ul class="nav navbar-nav">
                  <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" >EMPLEADOS <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                     <li><a href='../nuevo_empleado/nuevo_empleado.asp'><span>Nuevo Empleado</span></a></li>
                     <li><a href='../consultar_datos_de_empleado/consultar_datos_de_empleado.asp'><span>Consultar</span></a></li>
                     <li><a href='../modificar_datos_de_empleado/modificar_datos_de_empleado.asp'><span>Modificar</span></a></li>
                     <li><a href='../eliminar_empleado/eliminar_empleado.asp'><span>Eliminar</span></a></li>
                     <li><a href='../planillas/planillas.asp'><span>Costo Real MOD</span></a></li>
                    </ul>
                  </li>
                </ul>
         
                <ul class="nav navbar-nav">
                  <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" >TRANSACCIONES <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                     <li><a href='../nueva_transaccion/nueva_transaccion.asp'><span>Nueva Transaccion</span></a></li>
                     <li><a href='../libro_diario/librodiario.asp'><span>Mostrar Libro Diario</span></a></li>
                     <li><a href='../cierre_de_periodo/cierre_de_periodo.asp'><span>Cierre de Periodo</span></a></li>
                     <li><a href='../cierre_de_periodo/ajustes.asp'><span>Ajustes</span></a></li>
                    </ul>
                  </li>
                </ul>
         
                <ul class="nav navbar-nav">
                  <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">CATALOGO <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                     <li><a href='../consulta_de_cuenta/consulta_de_cuenta.asp'><span>Consultar Cuenta</span></a></li>
                     <li><a href='../catalogo/catalogo.asp'><span>Listar Catalogo</span></a></li>
                    </ul>
                  </li>
                </ul>
         
                <ul class="nav navbar-nav">
                  <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">CONTABILIDAD GENERAL <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                     <li><a href='../balance_de_comprobacion/balance_de_comprobacion.asp'><span>Balance de Comprobacion</span></a></li>
                     <li><a href='../estado_de_resultados/estado_de_resultados.asp'><span>Estado de Resultado</span></a></li>
                     <li><a href='../estado_de_capital/estado_de_capital.asp'><span>Estado de Capital</span></a></li>
                     <li><a href='../balance_general/balance_general.asp'><span>Balance General</span></a></li>
                    </ul>
                  </li>
                </ul>
         
                <ul class="nav navbar-nav">
                  <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">CONTABILIDAD DE COSTOS <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                     <li><a href='../nueva_ordenfabricacion/norden_fabricacion.asp'><span>Nueva Orden de Fabricacion</span></a></li>
                     <li><a href='../consulta_ordenfabricacion/corden_fabricacion.asp'><span>Consultar Orden de Fabricacion</span></a></li>
                     <li><a href='../estados_costosprod/produventas.asp'><span>Finalizar Orden de Fabricacion</span></a></li>
                    </ul>
                  </li>
                </ul>
               </div>
            </nav>
         </div> 

<!-- Fin del menu -->
<div>
  <br>
<center><h1 style="color: DarkSlateGrey; font-size: 50px;" > Bienvenido al sistema contable "MICROTECN" </h1></center>
<hr>
<center><p id="cajatexto" style="font-size: 40px;">Software dedicado al manejo contable de la empresa "MICROTECN". 
<br>

<table style="margin-top: 100px; font-size: 25px; font-family: 'Century Gothic'; color: #000000;">
   <tr>
      <td>
         <p style="margin-right: 200px; margin-left: 15%;">MISION</p>
         <p style="margin-right: 200px; margin-left: 15%;">Buscar cada dia ser mejores en el desarrollo de software, desarrollando siempre con tecnologia a la vanguardia</p>
      </td>
      <td>
         <p style="padding-left: 200px; margin-right: 10%;">VISION</p>
         <p style="margin-left: 200px; margin-right: 10%;">Ser la mejor empresa en creacion de software y dar los mejores productos y servicios a nuestros clientes manteniendo un sano ambiente laboral</p>
      </td>
   </tr>
</table>
 
 </p></center>
</div>


</body>
</html>