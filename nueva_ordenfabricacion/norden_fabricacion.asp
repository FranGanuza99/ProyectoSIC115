<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
     <head>
         <title>Sistema Contable</title>
         <META HTTP-EQUIV="EXPIRES" CONTENT="0">
         <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
         <meta name="Sitio Contable" content="Sistema Contable Empresa Consultora de Software MICROTECN"/>
         <script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
          <script language="Javascript" src="forms.js"></script>
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
       <p id="titulo" style="font-size: 55px;">Nueva orden de fabricaci&oacuten</p>
       <br>
       <hr>
       <br>
       <br>
       <br>
		 <div id='Diario'>
               <td valign="top" class="content">                 
                   <form name="orden" method="POST" action="proces_orden.asp" onsubmit="return(validar(this))">
                   <fieldset id="alinearT" style="padding: 5; margin:2; border-style:rige;"><br>
				 
                          <table  width="200" cellspacing="20" align="center"> 
                              <tr>
                                 <td style="font-size: 15px;">  Fecha de expedicion:<br>
                                     <input type="text" name="fecha" value="<%=FormatDateTime(now,2)%>" size="10" maxlength="10">
                                 </td>
                                 <td align="right" style="font-size: 15px;">
	                               No de Orden:<br>
                              <%
                                'Creacion del Objeto para conectarse a la base de datos 
                                Set conn=Server.CreateObject("ADOdb.Connection")

                                'Se abre la conexi�n a la base de datos
                                conn.Open "Datos","","" 
         
                                sql="SELECT NumOrden   FROM  ordenes ORDER BY NumOrden"
                                set r = conn.Execute(sql)
                                 
               
                                while NOT(r.EOF)
                                    num=r("NumOrden")
                                    r.MoveNext
                                wend
                                if num = 0 then
                                   num=0
                                end if
                                num=num+1
                              %>
                                      <input type="text" name="orden" value="<%=num%>" size="10" onfocus="this.blur()">
                                 </td>
                              </tr>
                              <tr>
                                 <td style="font-size: 15px;">
                                       Producto:<br>
                                    <select name="producto">
                                       <option value="0">Seleccione un producto</option>
                              <%
		                sql1="SELECT Catalogo.NombreCuenta,  Catalogo.Codigo FROM Catalogo WHERE Catalogo.Codigo=5000"		
                                Set R = conn.Execute(sql1)		   
		
                                while Not(R.EOF)
                                    cont=cont+1
                                    cod = R("Codigo")
                                    nom = "Software"
			            Response.Write("<option value= '" & cod & "'>"& nom &"</option>")
				    R.MoveNext
                   	         wend
	                       %>   
                                    </select>
                                 </td>
                                 <td align="right" style="font-size: 15px;">
                                      Cantidad:<br>
                                     <input type="text" name="cantidad" size="10" onblur="validar1(this)">
                                 </td>
                               </tr>
                          </table>
                          <p>&nbsp</p>
                          <table border="1" align="center" style="font-size: 12.5px; background-color: #e4da59;">
		               <tr>
                        <th colspan="2">Materia Prima</th>
                        <th colspan="3">Mano de Obra</th>
                        <th colspan="3">CIF</th>
                     </tr>
                     <tr>
                        <th >Material</th>
                        <th >Cantidad</th>
                        <th >No de Desarrolladores</th>
                        <th >CostoxHora</th>
                        <th >No de Horas</th>
                        <th >Costo</th>
                        <th >Monto por hora</th>
                        <th >Horas</th>
                     </tr>
		               <tr>
		                  <td><select name="mat1" disabled>
                              <option value="0" selected >Seleccione una MP</option> 
                        </select></td>
                        <td ><input name="cant1" type="text" disabled></td>
                        <td><select id="obrero1" name="obrero1" onchange="$('#costo1').val($('#obrero1 option:selected').val());">
                              <option value="0" selected >Seleccione un empleado</option> 
                        <%
                           sql="SELECT * FROM Empleados"		
                           Set resul = conn.Execute(sql)		   
                           cont=0
                           while Not(resul.EOF)
                              cont = cont + 1
                              nom = resul("Nombres")
                              apell = resul("Apellidos")
                              salario = resul("Salario")
                              horas = resul("Horas")

                              septimo = salario * 7
                              aguinaldo = (15 * salario)/52
                              vacaciones = ((15 * salario) * 1.3)/52
                              isss = (septimo + Round (vacaciones, 2)) * 0.075
                              afp = (septimo + Round (vacaciones, 2)) * 0.065
                              sueldo = septimo + Round (aguinaldo, 2) + Round (vacaciones, 2) + isss + afp 

                              salario_real_ph = (Round (sueldo, 2) / 5) / horas

                              Response.Write("<option value= '" & Round (salario_real_ph,2) & "'>"& nom & " " & apell & " - $" & Round (salario_real_ph,2) &"/h</option>")
                              resul.MoveNext
                           wend  
                                
                        %>
                        </select></td>
                        <td ><input id="costo1" name="costo1" type="text" onblur="validar1(this)" onfocus="this.blur()"></td>
                        <td ><input id="hora1" name="hora1" type="text" onblur="validar1(this)"></td>
                        <td ><input id="importesd" name="importe2" type="text"></td>
                        <td ><input id="tasa1" name="tasa1" type="text" onblur="validar1(this)"></td>
                        <td ><input id="importe1" name="importe1" type="text" onblur="validar1(this)"></td>
                        
		               </tr>
                     <% if cont>1 then
                           for i=2 to cont
                     %>
                              <tr>
                                 <td>
                                    <select name="mat<%=i%>" disabled>
                                       <option value="0" selected >Seleccione una MP</option> 
                                    </select>
                                 </td>
                                 <td><input name="cant<%=i%>" type="text" disabled></td>
                                 <td><select id="obrero<%=i%>" name="obrero<%=i%>" onchange="$('#costo<%=i%>').val($('#obrero<%=i%> option:selected').val());">
                                    <option value="0" selected>Seleccione un empleado</option> 
                                    <%
                                       resul.MoveFirst
                                       while Not(resul.EOF)
                                         
                                          nom = resul("Nombres")
                                          apell = resul("Apellidos")
                                          salario = resul("Salario")
                                          horas = resul("Horas")

                                          septimo = salario * 7
                                          aguinaldo = (15 * salario)/52
                                          vacaciones = ((15 * salario) * 1.3)/52
                                          isss = (septimo + Round (vacaciones, 2)) * 0.075
                                          afp = (septimo + Round (vacaciones, 2)) * 0.065
                                          sueldo = septimo + Round (aguinaldo, 2) + Round (vacaciones, 2) + isss + afp 

                                          salario_real_ph = (Round (sueldo, 2) / 5) / horas

                                          Response.Write("<option value= '" & Round (salario_real_ph, 2) & "'>"& nom & " " & apell & " - $" & Round (salario_real_ph,2) &"/h</option>")
                                          resul.MoveNext
                                       wend
                                       session("num")=cont
                                    %>
                                 </select></td>
                                 
                                 <td ><input id="costo<%=i%>" name="costo<%=i%>" type="text" onfocus="this.blur()"></td>
                                 <td ><input name="hora<%=i%>" type="text" onblur="validar1(this)"></td>
                                 <td ><input name="importes<%=i%>" type="text"></td>
                                 <td ><input name="tasa<%=i%>" type="text" onblur="validar1(this)" ></td>
                                 <td ><input name="importe<%=i%>" type="text" onblur="validar1(this)" ></td>     
                              </tr>
                     <%                  
                           next    
                        End if
                     %>
                          </table>
                          <input type="hidden" name="cont" value="<%=cont%>">
                          <p>&nbsp</p>
                          <p>&nbsp</p>
                          <table width="300" align="center">
                               <tr>            
                                  <th ><input type = "submit" name = "aceptar" value = "Aceptar"  style="font-size: 28px; border-radius: 15px; border-color: black; border-width: 4px;"></th>
                                  <th ><input type = "reset" name = "clear" value = "Borrar"  style="font-size: 28px; border-radius: 15px; border-color: black; border-width: 4px;"></th>
                               </tr> 
                          </table>  
                          <p>&nbsp</p>                             
                   </fieldset>
                   </form>
                </td>
              </tr>
           </table>
         </div>
     </body>
</html>
