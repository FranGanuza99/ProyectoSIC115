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
        background:url('/imagen/fondodeault.png') no-repeat center center fixed;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
        }
      </style>
      
          <!--#include virtual="/Sistema_Contable/plantilla.asp"-->
              <br><br>
                <p id="titulo">Eliminar cuenta</p>
       <br>
       <hr>
       <br>
       <br>
       <br>
      
		  <div id='logo1'>
         <fieldset id="tablaLoginCom" style="padding:2">
               <td valign="top" class="content"> 
			  
                  <p>&nbsp</p>
                  <% 
                    cod = Request.QueryString("cuenta")

                    set conn=Server.CreateObject("ADODB.Connection")
                    conn.open "Datos","",""

                    SQL="SELECT COUNT(*) AS total FROM Diario WHERE codigo ="&cod
                    SET Lista = conn.execute(SQL)
                    
                    sql="SELECT NombreCuenta FROM Catalogo WHERE Codigo="&cod
                    SET r= conn.Execute(sql)
                    
                    num = 0
                    nom=r("NombreCuenta")
                    num=Lista("total")
                    if num <> 0 then
                  %>
                       <p>La cuenta <%=nom%> no se puede eliminar<br>
                          debido a que aun esta en uso, solo puede<br>
                          eliminar cuentas que ya no se utilizan
                       </p>
                 <%
                    else
                        if cod >= 2000 then
                             tipo="Pasivo"
                             if cod >= 3000 then
                                  tipo="Capital"
                                  if cod >= 4000 then
                                       tipo="Gastos"
                                       if cod >= 5000 then
                                            tipo="Ingresos"
                                       end if
                                  end if
                             end if
                        else
                             tipo="Activo"
                        end if
                  %>
                 <center><table>
                       <tr> 
                          <th>Nombre de la cuenta </th>
                          <td><%=nom%></td>
                          </tr>

                       <tr> 
                          <th>codigo</th>
                          <td><%=cod%></td>
                       </tr>

                       <tr> 
                          <th>Tipo de cuenta</th>
                          <td><%=tipo%></td>
                       </tr>
                       <tr>
                           <td>&nbsp</td>
                       </tr>
                       <tr>
                          <form name="cuenta" method="post" action="eliminar.asp">
                              <td colspan="2"><input type="submit" name="eliminar" value="Eliminar"></td>
                              <input type="hidden" name="cod" value="<%=cod%>">
                              <input type="hidden" name="nom" value="<%=nom%>">
                          <form>
                       </tr>
                  </table></center
                <%end if%>
                </td>
              </tr>
           </table>
         </div>
     </body>
</html>
