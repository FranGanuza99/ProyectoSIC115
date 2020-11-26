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
       <p id="titulo" style="font-size: 55px;">Costo Real de Mano de Obra</p>
       <br>
       <hr>
               <td valign="top" class="content"> 
			      
                     <%
     		      Set conn= Server.CreateObject("ADODB.Connection")
		      conn.open "Datos","",""	
		      sql="SELECT * FROM Empleados"
		      Set spl1= conn.Execute(sql) 
	            %>
	            <table id="margenInput" align="center" border=1 style="margin-bottom: 1%; margin-left: 2px; margin-right: 1px;">
                   <tr style=" background:#e4da59; text-align: center;">
                    <center> 
	                    <th COLSPAN="2"><h2><center>Empleado</center> </h2></th>
	                    <th ROWSPAN="2"><h2><center>Cargo</center> </h2></th> 
	                    <th ROWSPAN="2"><h2><center>Salario nominal</center> </h2></th> 
	                    
	                    
	                    <th COLSPAN="5"><h2><center>Prestaciones</center> </h2></th>
                      <th ROWSPAN="2"><h2><center>Salario Real (Sem)</center></h2></th> 
                    </center> 
	                 </tr> 
                   <tr align="center" style=" background:#e4da59;"> 
                    <center>
	                    <td><h2> Apellidos </h2></td>
	                    <td><h2> Nombres </h2></td>

	                    <td><h2> Septimo </h2></td> 
                      <td><h2> Aguinaldo </h2></td>  
                      <td><h2> Vacaciones </h2></td>  
	                    <td><h2> ISSS (7.5%)</h2></td>
i
<<<<<<< HEAD
	                    <td><h2> AFP (6.5%)</h2></td>
                   </center> 
=======
	                    <td><h2> AFP (7.75%)</h2></td>
                      
>>>>>>> francisco_rama
	                 </tr>
                    <% 
                      while not spl1.EOF 
                        nominal = spl1("Salario")
                        septimo = nominal * 2
                        aguinaldo = (10 * nominal)/52
                        vacaciones = ((10 * nominal) * 1.3)/52
                        isss = ((septimo + nominal * 5) + Round (vacaciones, 2)) * 0.075
                        afp = ((septimo + nominal * 5) + Round (vacaciones, 2)) * 0.0775
                        sueldo = (nominal * 5) + septimo + Round (aguinaldo, 2) + Round (vacaciones, 2) + isss + afp 

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
