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
                
                cod=R("codigo")
                c=cod-3
                monto=R("Monto")
               
                sql1="UPDATE ordenes SET codigo='"&c&"' WHERE NumOrden="&orden 
                conn.Execute(sql1)
               
                sql="SELECT * FROM Diario ORDER BY NumTrans"
                set r=conn.Execute(sql)
                While Not (r.EOF)
                    numero = r("NumTrans")
                    r.MoveNext
                Wend
                if numero="" then
                   numero=0
                end if
                
                fecha=DATE()                

                sql2="INSERT INTO Diario(NumTrans, codigo, cargo, fecha) VALUES('"&numero+1&"', '"&c&"', '"&monto&"', '"&fecha&"')"
                conn.Execute(sql2)
                sql2="INSERT INTO Diario(NumTrans, codigo, abono, fecha) VALUES('"&numero+1&"', '"&cod&"', '"&monto&"', '"&fecha&"')"
                conn.Execute(sql2)

                sql="SELECT * FROM ordenes WHERE NumOrden="&orden
                R=conn.Execute(sql)                 
                

                sql4="SELECT NombreCuenta FROM Catalogo WHERE Codigo="&c
                set L=conn.Execute(sql4)
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
                <p id="titulo">Finalizar orden de fabricaci&oacuten</p>
       <br>
       <hr>
       <br>
       <br>
       <br>
     <div id='logo1'>
               <td valign="top" class="content"> 
                   <fieldset id="tablaLoginCom5" style="padding:8">          
                    <center><h2><font color="black"> Orden De Fabricacion Finalizada </font></h2></center>
        <table width="400" cellspacing="20" align="center" border="3 bgcolor="#455356"> 
            <tr>
              <td><h3><strong>Fecha de expedicion:</strong></h3>
                      <%=R("fecha")%>
              </td>
              <td align="center"><h3><strong>No de Orden:</strong></h3>
              
                   <%=R("NumOrden")%>
              </td>
            </tr>
            <tr>
               <td><h3><strong>Producto:</strong></h3>
                  
                  <%=L("NombreCuenta")%>
               </td>
               <td align="center"><h3><strong>Cantidad:</strong></h3>
                  
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
      <table border="1" width="300" align="center">
             <tr>            
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
