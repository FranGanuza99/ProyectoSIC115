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
                <p id="titulo">Nueva orden de fabricaci�n</p>
       <br>
       <hr>
       <br>
       <br>
       <br>
		  <div id='logo1'>
               <td valign="top" class="content"> 
                    <fieldset id="tablaLoginCom4" style="padding:12">
                   
				   <center><h1><font color="black"> Orden De Fabricacion Agregada</font></h1></center>
                   <table width="600" cellspacing="10" align="center" border="2"> 
                        <tr>
                           <td><h3><strong>Fecha de expedicion:</strong></h3><br>
                                <strong><%=R("fecha")%></strong>
                           </td>
                           <td align="center"><h3><strong>No de Orden:</strong></h3><br>
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
                   
                   <table  border="5" align="center">
		        <tr>
	                  <th><h2><strong>Total Materia Prima</strong></h2></th>
                    <th><h2><strong>Total Mano de Obra</strong></h2></th>
                    <th><h2><strong>Total GIF</strong></h2></th>
		        </tr>
		        <tr>
		           <td><h2><strong><%=R("MontoMP")%></strong></h2></td>
               <td><h2><strong><%=R("MontoMObra")%></strong></h2></td>
               <td><h2><strong><%=R("MontoGif")%></strong></h2></td>
		        </tr>
                   </table>
                   <p>&nbsp</p>
                   <p>&nbsp</p>
                   <table width="300" align="center">
                        <tr>            
                           <th ><h2><strong>Monto Total<br><%=R("Monto")%></strong></h2></th>
                           <th ><h2><strong>Precio Unitario<br><%=R("PrecioU")%></strong></h2></th>
                        </tr> 
                   </table>  

                   <p>&nbsp</p> 
                   <center><h2><a href="norden_fabricacion.asp">Agregar otra orden</a><h2></center>    

                   </fieldset>
                </td>
              </tr>
           </table>
         </div>
     </body>
</html>
