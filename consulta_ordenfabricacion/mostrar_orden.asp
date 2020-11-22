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
      background:url('/imagen/index.png') no-repeat center center fixed;
      -webkit-background-size: cover;
      -moz-background-size: cover;
      -o-background-size: cover;
      background-size: cover;
      }
    </style>
      <body leftmargin="10" topmargin="160">
        <!--#include virtual="/Sistema_Contable/plantilla.asp"-->
         <br><br>
                <p id="titulo">Consultar orden de fabricaci&oacuten </p>
       <br>
       <hr>
       <br>
       <br>
       <br>
    <div id='logo1'>
               <td valign="top" class="content"> 
                   
                     <fieldset id="tablaLoginCom3" style="padding:3">
           <center><h2><font color="black"> Orden De Fabricacion </font></h2></center>
                       <table width="200" cellspacing="20" align="center"> 
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
                        <table  border="1" align="center" >
                 <tr>
                          <th>Total Materia Prima</th>
                                <th>Total Mano de Obra</th>
                                <th>Total GIF</th>
                 </tr>
                 <tr>
                    <td><%=R("MontoMP")%></td>
                                <td><%=R("MontoMObra")%></td>
                                <td><%=R("MontoGif")%></td>
                 </tr>
                         </table>
                         <p>&nbsp</p>
                         <p>&nbsp</p>
                         <table width="300" align="center" bgcolor= "#455356">
                              <tr bgcolor="white">            
                                  <th >Monto Total<br>$ <%=R("Monto")%></th>
                                  <th >Precio Unitario<br>$ <%=R("PrecioU")%></th>
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