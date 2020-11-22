<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
     <head>
          <title>Sistema Contable</title>
          <META HTTP-EQUIV="EXPIRES" CONTENT="0">
          <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
          <meta name="Sitio Contable" content="Sistema Contable Empresa Consultora de Software MICROTECN"/>

          <script language="Javascript">
                function validar(f){
                    if(f.nombre.value == ""){
                       alert("Debe ingreser el nombre de la cuenta");
                       f.nombre.focus();
                       return false;
                    }
                    if(f.codigo.value == ""){
                       alert("Debe ingreser el codigo de la cuenta");
                       f.codigo.focus();
                       return false;
                    }
                     if(f.sel.value == 0){
                       alert("Debe seleccionar una cuenta");
                       return false;
                    }
                    return true;
                }
          </script> 

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
      
           <!--#include virtual="/Sistema_Contable/plantilla.asp"-->
           <br><br>
                <p id="titulo">Nueva cuenta </p>
       <br>
       <hr>
       <br>
       <br>
       <br>
		   <div id='logo1'>
              
 
				  <fieldset id="tablaLoginCom2" style="padding:2"> 
                  <form name = "f" action="agregar.asp" method="post" onsubmit="return(validar(this))">

                     <table id= fieldset1 width = "40%"  cellspacing=1 cellpadding=0 border=0>
                      <tr style="color:black;font-size:100%">
                     <th>Nombre de la cuenta</th>
                     <td><input type="text" name="nombre" size="25"><br></td>
                     <tr style="color:black;font-size:100%">
                     <th>Codigo de la cuenta:</th>
                     <td><input type="text" name="codigo" size="25"><br></td></tr>
                     <tr style="color:black;font-size:100%">
                     <th>Tipo de cuenta:&nbsp</th>
                     <td><select name = "sel">
                       <option value="0">-Seleccione el tipo-</option>
                       <option value = "1"> Activo </option>
                       <option value = "2"> Pasivo </option>
                       <option value = "3"> Capital </option>
                       <option value = "4"> Ingresos </option>
                       <option value = "6"> Gastos </option>
                       <option value = "7"> Desinversiones </option>
                       <option value = "8"> Inversiones </option>
                     </select></td>
                      
                     <td><input id="nInput3" type="submit" value="Aceptar"></td>
                  </form>   
                </td>
              </tr>
           </table>
         </div>
     </body>
</html>
