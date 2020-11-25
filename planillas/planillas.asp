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
     </head>
    <body leftmargin="10" topmargin="160">

        <style type="text/css">
          body {
          background:url('/imagen/fondodefault2.jpg') no-repeat center center fixed;
          -webkit-background-size: cover;
          -moz-background-size: cover;
          -o-background-size: cover;
          background-size: cover;
          }
        </style>

          <!--#include virtual="/Sistema_Contable/plantilla.asp"-->
		   <br><br>
       <p id="titulo">Costo Real de Mano de Obra</p>
       <br>
       <hr>
       <br>
       <br>
       <br>
               <td valign="top" class="content"> 
			      
            <br><br>
                     <%
     		      Set conn= Server.CreateObject("ADODB.Connection")
		      conn.open "Datos","",""	
		      sql="SELECT * FROM Empleados"
		      Set spl1= conn.Execute(sql) 
	            %>
	            <table id="margenInput" width = "100%" align="center" border=1>
	                 <tr align="center" style=" background:orange;"> 
	                    <th COLSPAN="2"><h2> Empleado </h2></th>
	                    <th ROWSPAN="2"><h2> Cargo </h2></th> 
	                    <th ROWSPAN="2"><h2> Salario nominal </h2></th> 
	                    
	                    
	                    <th COLSPAN="5"><h2> Prestaciones </h2></th>
	                    <th ROWSPAN="2"><h2> Salario Real (Sem)</h2></th> 
	                 </tr> 
	                 <tr align="center" style=" background:orange;"> 
	                    <td><h2> Apellidos </h2></td>
	                    <td><h2> Nombres </h2></td>

	                    <td><h2> Septimo </h2></td> 
                      <td><h2> Aguinaldo </h2></td>  
                      <td><h2> Vacaciones </h2></td>  
	                    <td><h2> ISSS (7.5%)</h2></td>
	                    <td><h2> AFP (6.5%)</h2></td>
                      
	                 </tr>
                    <% 
                      while not spl1.EOF 
                        nominal = spl1("Salario")
                        septimo = nominal * 7
                        aguinaldo = (15 * nominal)/52
                        vacaciones = ((15 * nominal) * 1.3)/52
                        isss = (septimo + Round (vacaciones, 2)) * 0.075
                        afp = (septimo + Round (vacaciones, 2)) * 0.065
                        sueldo = septimo + Round (aguinaldo, 2) + Round (vacaciones, 2) + isss + afp 

                    %>
                         <TR width="100%" align="center">
                            <td><h2><strong><%=spl1("Apellidos")%></strong></h2></td> 
                            <td><h2><strong><%=spl1("Nombres")%></strong></h2></td>
                            <td><h2><strong><%=spl1("Puesto")%></strong></h2></td>
                            <td><h2><strong>$<%=spl1("Salario")%></strong></h2></td>
                            
                            <td><h2><strong>$<%=septimo %></strong></h2></td>
                            <td><h2><strong>$<%=Round (aguinaldo, 2) %></strong></h2></td>
                            <td><h2><strong>$<%=Round (vacaciones, 2) %></strong></h2></td>
                            <td><h2><strong>$<%=Round (isss, 2) %></strong></h2></td>
                            <td><h2><strong>$<%=Round (afp, 2) %></strong></h2></td>
                            <td><h2><strong>$<%=Round (sueldo, 2) %></strong></h2></td>  
                         </TR> 
                   <%
                       spl1.Movenext
                     wend
                   %>
                   </table> 
                </td>
              </tr>
           </table>
         </div>
     </body>
</html>
