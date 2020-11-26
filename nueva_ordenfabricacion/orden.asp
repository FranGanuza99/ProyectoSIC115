<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
     <head>
          <title>Sistema Contable</title>
          <META HTTP-EQUIV="EXPIRES" CONTENT="0">
          <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
          <meta name="Sitio Contable" content="Sistema Contable Empresa Consultora de Software MICROTECN"/>

          <%
               'Creacion del Objeto para conectarse a la base de datos 
                Set conn=Server.CreateObject("ADOdb.Connection")

                'Se abre la conexi�n a la base de datos
                conn.Open "Datos","","" 
                 
                orden=Request.QueryString("numorden")
               
                sql="SELECT * FROM ordenes WHERE NumOrden="&orden
                set R=conn.Execute(sql)

                sql2="SELECT NombreCuenta FROM Catalogo WHERE Codigo="&R("codigo")
                set L=conn.Execute(sql2)
          %>      

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
                <p id="titulo" style="font-size: 55px;">Nueva orden de fabricacion</p>
       <br>
       <hr>
       <br>
       <br>
       <br>
		  <div id='logo1'>
               <td valign="top" class="content"> 
                    <fieldset id="tablaLoginCom4" style="padding:12px">
                   
                    <strong><h2 style="font-size: 45px; margin-left: 100px; color: black;">Orden De Fabricacion Agregada</h2></strong>
                   <table width="600" cellspacing="10" align="center" border="2" style="font-size: 25px;"> 
                        <tr>
                           <td><strong>Fecha de expedicion:</strong><br>
                                <strong><%=R("fecha")%></strong>
                           </td>
                           <td align="center"><strong>No de Orden:</strong><br>
                                <strong><%=R("NumOrden")%></strong>
                           </td>
                        </tr>
                        <tr>
                           <td><strong>Producto:</strong>
                                <br>
                               <strong><%=L("NombreCuenta")%></strong>
                           </td>
                           <td align="center"><strong>Cantidad:</strong>
                                <br>
                               <strong><%=R("Cantidad")%></strong>
                           </td>
                        </tr>
                   </table>
                   <p>&nbsp</p>
                   
                   <table  border="5" style="margin-left:150px">
		        <tr>
	               <th style="background-color: #e4da59;"><h2><strong>Total Materia Prima</strong></h2></th>
                    <th style="background-color: #e4da59;"><h2><strong>Total Mano de Obra</strong></h2></th>
                    <th style="background-color: #e4da59;"><h2><strong>Total GIF</strong></h2></th>
		        </tr>
		        <tr>
		           <td><h2><strong>$<%=R("MontoMP")%></strong></h2></td>
               <td><h2><strong>$<%=R("MontoMObra")%></strong></h2></td>
               <td><h2><strong>$<%=R("MontoGif")%></strong></h2></td>
		        </tr>
                   </table>
                   <p>&nbsp</p>
                   <p>&nbsp</p>
                   <table width="400" border="5" style="margin-left: 120px;">
                        <tr>            
                           <th style="background-color: #e4da59;"><h2><strong>Monto Total</strong></h2></th>
                           <th style="background-color: #e4da59;"><h2><strong>Margen de beneficio (40%)</strong></h2></th>
                           <th style="background-color: #e4da59;"><h2><strong>Precio Unitario</strong></h2></th>
                        </tr>
                        <tr>
                             <td><h2><strong>$<%=R("Monto")%><strong</h2></td>
                              <td><h2><strong>$<%=R("Monto")*0.4%></strong></h2></td>
                              <td><h2><strong>$<%=R("PrecioU")*1.4%></strong></h2></td>
                        </tr> 
                   </table>  

                   <p>&nbsp</p> 
                    <button style="border-radius: 12px; border-color: black; font-size: 30px; margin-left: 30%;margin-right: 10%; margin-bottom: 5px;"><a href="norden_fabricacion.asp">Agregar otra orden</a></button>
                   </fieldset>
                 
                 </td>
              </tr>
          </table>
         </div>
     </body>
</html>
