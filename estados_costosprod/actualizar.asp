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

                ganancia = monto * 0.4         

                sql2="INSERT INTO Diario(NumTrans, codigo, abono, fecha) VALUES('"&numero+1&"', '"&c&"', '"&Round (ganancia,2)&"', '"&fecha&"')"
                conn.Execute(sql2)
                sql2="INSERT INTO Diario(NumTrans, codigo, cargo, fecha) VALUES('"&numero+1&"', '1000', '"&Round (ganancia,2)&"', '"&fecha&"')"
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
                <p id="titulo" style="font-size: 55px;">Finalizar orden de fabricaci&oacuten</p>
       <br>
       <hr>
       <br>
       <br>
       <br>
     <div id='logo1'>
               <td valign="top" class="content"> 
                   <fieldset id="tablaLoginCom5" style="padding:8">          
                    <center><p style="font-size: 45px; color: black;"><strong>Orden De Fabricacion Finalizada</strong></p></center>
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
               <td><h3><strong>Producto:</strong></h3><br>
                <p style="color: black; padding-bottom: 5%;">Software</p>
                  <!--<%=L("NombreCuenta")%>-->
               </td>
               <td align="center"><h3><strong>Cantidad:</strong></h3>
                  
                   <%=R("Cantidad")%>
               </td>
             </tr>
      </table>
      <p>&nbsp</p>
      <table  border="1" align="center" style="font-size: 25px;">
       <tr>
                          <th style="background-color: #e4da59;">Total Materia Prima</th>
                          <th style="background-color: #e4da59;">Total Mano de Obra</th>
                          <th style="background-color: #e4da59;">Total GIF</th>
       </tr>
       <tr>
              <td>$<%=R("MontoMP")%></td>
                          <td>$<%=R("MontoMObra")%></td>
                          <td>$<%=R("MontoGif")%></td>
       </tr>
      </table>
      <p>&nbsp</p>
      <p>&nbsp</p>
      <table border="2" width="300" align="center" style="font-size: 25px;">
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
