<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
     <head>
          <title>Sistema Contable</title>
          <META HTTP-EQUIV="EXPIRES" CONTENT="0">
          <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
          <meta name="Sitio Contable" content="Sistema Contable Empresa Consultora de Software MICROTECN"/>

          <!-- <script language="Javascript">
                function validar(f){
                    if(f.sel.value == 0){
                       alert("Debe seleccionar una cuenta");
                       return false;
                    }
                    return true;
                }
          </script> -->

          <style type="text/css">
		   @import url("../css/formato.css");
           @import url("../css/formato2.css");           
          </style>      
     </head>
     <body leftmargin="10" topmargin="160">

      <style type="text/css">
        body {
        background:url('/imagen/fondodeault.png') no-repeat center center fixed;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
        }
      </style>
      <p id="titulo">Nueva cuenta </p>
          <!-- #include virtual="/Sistema_Contable/plantilla.asp"
            <br><br>
                <p id="titulo">Nueva cuenta </p>
       <br>
       <hr>
       <br>
       <br>
       <br>
		   <div id='logo1'>
               <td valign="top" class="content"> 
			  <fieldset id="tablaLoginCom" style="padding:2">
                  <form name = "f" action="cuenta.asp" method="post" onsubmit="return(validar(this))">
                     <center><select name = "sel">
                       <option value="0">-Seleccione el tipo de cuenta-</option>
                       <option value = "10"> Activo </option>
                       <option value = "20"> Pasivo </option>
                       <option value = "30"> Capital </option>
                       <option value = "40"> Gastos </option>
                       <option value = "50"> Ingresos </option>
                     </select></center><br><br><br><br><br>-->
                     <p id="titulo">Desea Agregar una Nueva cuenta?</p>
                     <form name="f" action="cuenta.asp" method="post" onsubmit="true">
                     <center><input type="submit" value="Aceptar"></center>
                  </form>   
                </td>
              </tr>
           </table>
         </div>
     </body>
</html>
