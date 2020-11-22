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
	                    <th ROWSPAN="2"><h2> Salario base </h2></th> 
	                    <th><h2> Otras Remuneraciones </h2></th>
	                    <th ROWSPAN="2"><h2> T. Devengado </h2></th> 
	                    <th COLSPAN="3"><h2> Retenciones </h2></th>
	                    <th ROWSPAN="2"><h2> Liquido a Pagar </h2></th> 
	                 </tr> 
	                 <tr align="center" style=" background:orange;"> 
	                    <td><h2> Apellidos </h2></td>
	                    <td><h2> Nombres </h2></td>
	                    <td><h2> H. extras </h2></td> 
	                    <td><h2> ISSS </h2></td>
	                    <td><h2> AFP </h2></td>
	                    <td><h2> Renta </h2></td>  
	                 </tr>
                    <% 
                      while not spl1.EOF 
                        sueldos= spl1("Salario")+ spl1("Horas")
                        suma= suma+sueldos
                        iss= sueldos*.035
                        isst= isst+iss
                        afp= sueldos*.0625
                        afpt= afpt+afp
                        ren= sueldos*.02
                        rent= rent+ren 
                        sueldo=sueldos-iss-afp-ren
                        sueldot=sueldot+sueldo  
                    %>
                         <TR width="100%" align="center">
                            <td><h2><strong><%=spl1("Apellidos")%></strong></h2></td> 
                            <td><h2><strong><%=spl1("Nombres")%></strong></h2></td>
                            <td><h2><strong><%=spl1("Puesto")%></strong></h2></td>
                            <td><h2><strong>$<%=spl1("Salario")%></strong></h2></td>
                            <td><h2><strong>$<%=spl1("Horas")%></strong></h2></td>
                            <td><h2><strong>$<%=sueldos%></strong></h2></td>
                            <td><h2><strong>$<%=iss %></strong></h2></td>
                            <td><h2><strong>$<%=afp %></strong></h2></td>
                            <td><h2><strong>$<%=ren %></strong></h2></td>
                            <td><h2><strong>$<%=sueldo %></strong></h2></td>  
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
