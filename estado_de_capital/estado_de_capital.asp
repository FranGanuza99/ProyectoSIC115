  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
     <head>
          <title>Sistema Contable</title>
          <META HTTP-EQUIV="EXPIRES" CONTENT="0">
          <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
          <meta name="Sitio Contable" content="Sistema Contable Empresa Solidaria Textil"/>

          <%
            dim SumaInv,SumaDesinv

            set cnn1 = Server.CreateObject("ADODB.Connection")
            cnn1.open "Datos","",""

            sql ="SELECT Catalogo.NombreCuenta, Mayor.codigo, Mayor.saldo FROM Catalogo, Mayor WHERE Catalogo.Codigo=Mayor.codigo AND (Catalogo.Tipo=8)"
            'sql = "SELECT * FROM mayor WHERE codigo >= 3000 AND codigo < 4000 ORDER BY codigo;"
            set rsMbrs = cnn1.execute(sql)
          %>

          <style type="text/css">
		   @import url("../css/formato.css");
           @import url("../css/formato2.css");           
         </style>      
     </head>
      <style type="text/css">
      body {
      background:url('/imagen/fondodefault2.jpg') no-repeat center center fixed;
      -webkit-background-size: cover;
      -moz-background-size: cover;
      -o-background-size: cover;
      background-size: cover;
      }
    </style>
     <body leftmargin="10" topmargin="160">
          <!--#include virtual="/Sistema_Contable/plantilla.asp"-->
		  <div id='logo1'>
               <td valign="top" class="content">   
               <% if Session("PeriodoCerrado") <> "no" then %>
                <center><h1><font color="black"><N> Empresa Solidaria Textil "Invernalia" <N></font></h1></center>
			   <center><h1><font color="black"><N> Estado De Capital <N></font></h1></center>
          <left><h3><font color="black"><N> Inversiones<N></font></h3></left>
      <table align="center" border-spacing="0" width="500px">
                         
                             <th bgcolor="#5882FA"><h2><font color="black"><N>Codigo</N></font></h2></th>
                             <th bgcolor="#5882FA"><h2><font color="black"><N>Nombre</N></font></h2></th>
                             <th colspan="2" bgcolor="#5882FA"><h2><font color="black"><N>Saldo</N></font></h2></th>
                             
                          </tr>
                     <%Do While Not rsMbrs.EOF%>
                          <tr valign="TOP">
                             <td  WIDTH="70" align="left"><%=rsMbrs("Codigo")%>
                             <td WIDTH="400" align="left"><%=rsMbrs("NombreCuenta")%></td>
                          <%if rsMbrs("saldo") > 0 then %>
                             <td WIDTH="100" align="left"><%=rsMbrs("Saldo")%></td>
                             <td>&nbsp</td>
                          <%else%>
                             <td>&nbsp</td>
                             <td WIDTH="100" align="left"><%=abs(rsMbrs("Saldo"))%></td>
                          </tr>
                          <%
                            end if
                            SumaInv=0
                            SumaDesinv=0
                            rsMbrs.MoveNext
                       loop
                     %>
                          <tr valign="TOP">
                             <td WIDTH="70" align="left">3001</td>
                             <td WIDTH="400" align="left">Utilidad</td>
                             <td>&nbsp</td>
                             <td WIDTH="100" align="left"> <%=session("utilidad")%></td>
                          </tr>
                          <tr>
                             <td colspan="2" bgcolor="#A9BCF5" align="right"><N> TOTAL </N></td>       
                             
                             <td colspan="2" bgcolor="#A9BCF5" align="right"><N> <%=session("Totalinv") %> </N></td>
                          </tr>
<!------------------------------------------------------------------------------------------------------------->
                     <%
                       sql1 ="SELECT Catalogo.NombreCuenta, Mayor.codigo, Mayor.saldo FROM Catalogo, Mayor WHERE Catalogo.Codigo=Mayor.codigo AND (Catalogo.Tipo=7)"
                       set rsMbrs1 = cnn1.execute(sql1)

                       if NOT((rsMbrs1.BOF = TRUE) and (rsMbrs1.EOF =TRUE )) then
                     %>
                     <table align="center" border-spacing="0" width="500px">
                      <left><h3><font color="black"><N>Desinversion<N></font></h3></left>
            
                          <%Do While Not rsMbrs1.EOF%>
                          <tr valign="TOP">
                             <td WIDTH="70" align="left"><%=rsMbrs1("Codigo")%>
                             <td WIDTH="400" align="left"><%=rsMbrs1("NombreCuenta")%></td>
                             <%if rsMbrs1("saldo") > 0 then %>
                               <td WIDTH="100" align="left"><%=rsMbrs1("Saldo")%></td>
                               <td>&nbsp</td>
                             <%else%>
                               <td>&nbsp</td>
                               <td WIDTH="100" align="left"><%=abs(rsMbrs1("Saldo"))%></td>
                          </tr>
                     <%         
                               end if
                               rsMbrs1.MoveNext
                            loop
                       end if
                       rsMbrs.Close
                       rsMbrs1.Close
                       Set rsMbrs = Nothing
                       Set rsMbrs1 = Nothing
                       cnn1.Close
                       Set cnn1 = Nothing
                     %>
                         <tr>
                            <td colspan="2" bgcolor="#A9BCF5" align="right"><N> TOTAL </N></td>       
                                 
                            <td colspan="2" bgcolor="#A9BCF5" align="right"><N> (<%=session("SumaDesinv") %>)</N></td>
                            
                         </tr>
                   </table>
                   <p>&nbsp</p>
<!--------------------------------->
                   <%if session("kconta") > 0 then%>
	                <h1><font color="black"><N>Capital Contable = $<% Response.Write(session("kconta"))%></N></font></h1> 
                   <%else%>
	                <h1><font color="black"><N>Capital Contable = $(<% Response.Write(abs(session("kconta")))%>)</N></font></h1>
                   <%end if
              else %>
             <h1><font color="black"><N> No Has Cerrado Periodo!! </N></font></h1>
             <%  end if%>
                </td>
              </tr>
           </table>
         </div>
     </body>
</html>
