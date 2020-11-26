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
       <p id="titulo">Libro diario</p>
       <br>
			          <%    
                   Dim Conexion, sql, List
                   Set Conexion = Server.CreateObject("ADODB.Connection")
	           Conexion.open "Datos","",""
                   sql = "SELECT Catalogo.NombreCuenta, Diario.NumTrans, Diario.codigo,Diario.cargo,Diario.abono,Diario.fecha FROM Catalogo, Diario WHERE Catalogo.Codigo=Diario.codigo ORDER BY Diario.NumTrans" 
	           set List = Conexion.execute(sql)
                 %>
		<center><table border = "2" width = "85%">
    		<tr style="font-size:200%">
			  <th><h2><strong><center>Numero de transacci&oacuten </center></strong></h2></th>
			  <th><h2><strong><center> Fecha </center></strong></h2></th>
		      <th><h2><strong><center> Cuenta </center> </strong></h2></th>
		      <th><h2><strong><center> Cargo </center></strong> </h2></th>
		      <th><h2><strong><center> Abono </center></strong> </h2></th>
		</tr>

		    <% 
		     i = 1
		     while not(List.EOF) 
		     if(List("NumTrans") <> i) then %>
		
		    <tr></tr><tr></tr><tr></tr><tr></tr>
		     <%
		      i = i + 1
		      end if 
		     %>
		    <tr style="font-size:200%">
		      <td> <%= List("NumTrans")  %> </td>
		      <td> <%= List("Fecha")  %> </td>
		      <td> <%= List("NombreCuenta")%></td>
		      <td> <%= List("Cargo")  %> </td>
		      <td> <%= List("Abono")  %> </td>
		    </tr>
		    <% 
           		List.MoveNext
     	 		wend 
   		 %>  
  		</table>
 		 <% Conexion.close %> 
                </td>
              </tr>
           </table></center>
         </div>
     </body>
</html>
