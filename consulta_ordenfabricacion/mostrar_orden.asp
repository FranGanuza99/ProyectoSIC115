<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
     <head>
          <title>Sistema Contable</title>
          <META HTTP-EQUIV="EXPIRES" CONTENT="0">
          <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
          <meta name="Sitio Contable" content="Sistema Contable Empresa Consultora de Software MICROTECN"/>

          <style type="text/css">
       @import url("../css/formato.css");
           @import url("../css/formato2.css");           
          </style> 
          <%
               'Creacion del Objeto para conectarse a la base de datos 
                Set conn=Server.CreateObject("ADOdb.Connection")

                'Se abre la conexi�n a la base de datos
                conn.Open "Datos","","" 
                 
                orden=Request.form("orden")
               
                sql="SELECT * FROM ordenes WHERE NumOrden="&orden
                set R=conn.Execute(sql)

                sql2="SELECT NombreCuenta FROM Catalogo WHERE Codigo="&R("codigo")
                set L=conn.Execute(sql2)
          %>      

      </head>
      <style type="text/css">
      body {
      background:url('/imagen/fondodefault2.png') no-repeat center center fixed;
      -webkit-background-size: cover;
      -moz-background-size: cover;
      -o-background-size: cover;
      background-size: cover;
      }
    </style>
      <body leftmargin="10" topmargin="160">
        <!--#include virtual="/Sistema_Contable/plantilla.asp"-->
         <br><br>
                <p id="titulo" style="font-size: 55px;">Consultar orden de fabricaci&oacuten </p>
       <br>
       <hr>
       <br>
       <br>
       <br>
    <div id='logo1'>
               <td valign="top" class="content"> 
                   
                     <fieldset id="tablaLoginCom3" style="padding:3">
           <center><p style="color: black; font-size: 45px;"><strong>Orden De Fabricacion</strong></p></center>
                       <table width="200" border="2" cellspacing="20" align="center" style="font-size: 25px;"> 
                             <tr>
                                <td >  Fecha de expedicion:<br>
                                      <%=R("fecha")%>
                                </td>
                                <td align="center" >
                                No de Orden:<br>
                                      <%=R("NumOrden")%>
                                </td>
                             </tr>
                             <tr>
                                 <td >
                                     Producto:<br>
                                     <%=L("NombreCuenta")%>
                                 </td>
                                 <td align="center" >
                                     Cantidad:<br>
                                     <%=R("Cantidad")%>
                                 </td>
                             </tr>
                        </table>
                        <p>&nbsp</p>
                        <table  border="2" align="center" style="font-size: 25px;">
                 <tr>
                                <th style="background-color: #e4da59;">Total Materia Prima</th>
                                <th style="background-color: #e4da59;">Total Mano de Obra</th>
                                <th style="background-color: #e4da59;">Total GIF</th>
                 </tr>
                 <tr>
                    <td><%=R("MontoMP")%></td>
                                <td>$<%=R("MontoMObra")%></td>
                                <td>$<%=R("MontoGif")%></td>
                 </tr>
                         </table>
                         <p>&nbsp</p>
                         <p>&nbsp</p>
                         <table width="300" align="center" border="2" bgcolor= "#455356" style="font-size: 25px;">
                              <tr>            
                                  <th style="background-color: #e4da59;">Monto Total</th>
                                  <th style="background-color: #e4da59;">Margen de beneficio (40%)</th>
                                  <th style="background-color: #e4da59;">Precio Unitario</th>
                              </tr> 
                              <tr>
                                <td>$<%=R("Monto")%></td>
                                <td>$<%=R("Monto")*0.4%></td>
                                <td>$<%=R("PrecioU")*1.4%></td>
                              </tr>
                         </table>  
                         <p>&nbsp</p>                             
                   </fieldset>
                 </td>
              </tr>
           </table>
         </div>
      </body>
</html>
