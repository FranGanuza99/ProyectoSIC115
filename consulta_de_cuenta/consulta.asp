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
                <p id="titulo">Consultar cuentas</p>
       <br>
       <hr>
       <br>
       <br>
       <br>
       <div id='logo1'>
              
		  
               <td valign="top" class="content"> 
			  
                           <P>&nbsp;</p>
                  <% 
                    Dim codigo, nombre, cargo, abono, saldo
                    codigo = Request.QueryString("cuenta")

                    set conn=Server.CreateObject("ADODB.Connection")
                    conn.open "Datos","",""

                    SQL="SELECT SUM(cargo) AS c, SUM(abono) AS a  FROM  Diario where Diario.codigo="&codigo
                    SET Lista = conn.execute(SQL)

                    sql2="SELECT NombreCuenta FROM Catalogo WHERE Codigo="&codigo
                    SET resul= conn. Execute(sql2)	

                    cargo=Lista("c")
                    abono=Lista("a")
                    saldo=cargo-abono
                    nombre=resul("NombreCuenta")
                  %>
                    <table id="fieldset1" border="2" cellspacing="5" cellpadding="10" align="center">
                          <tr> 
                             <th>Nombre cuenta </th>
                             <td><%=nombre%></td>
                          </tr>
                          <tr> 
                              <th>CARGO</th>
                              <td>$ <%=cargo%></td>
                          </tr>
                          <tr> 
                             <th>ABONO</th>
                             <td>$ <%=abono%></td>
                          </tr>
                          <tr> 
                             <th>SALDO</th>
                          <% if saldo < 0 then%>
                             <td> (<%=abs(saldo)%>)</td>
                          <%else%>
                             <td>$ <%=saldo%></td>  
                          <%end if%>
                          </tr>
                    </table>
                </td>
              </tr>
           </table>
         </div>
     </body>
</html>
