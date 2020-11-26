  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
     <head>
          <title>Sistema Contable</title>
          <META HTTP-EQUIV="EXPIRES" CONTENT="0">
          <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
          <meta name="Sitio Contable" content="Sistema Contable Empresa Consultora de Software MICROTECN"/>

          <%
            dim SumaIngreso,SumaGasto

            'conecta a la base de datos
            Set cnn1 = Server.CreateObject("ADODB.Connection")
            cnn1.open "Datos","",""

            sql ="SELECT Catalogo.NombreCuenta, Mayor.codigo, Mayor.saldo FROM Catalogo, Mayor WHERE Catalogo.Codigo=Mayor.codigo AND (Catalogo.Tipo=4)"
            Set rsMbrs = Server.CreateObject("ADODB.Recordset")
            rsMbrs.Open sql, cnn1, 0, 1, &H0001
          %>

          <style type="text/css">
		   @import url("../css/formato.css");
           @import url("../css/formato2.css");           
          </style>   
          <style type="text/css">
      body {
      background:url('/imagen/fondodefault2.jpg') no-repeat center center fixed;
      -webkit-background-size: cover;
      -moz-background-size: cover;
      -o-background-size: cover;
      background-size: cover;
      }
    </style>

      </head>
      <body leftmargin="10" topmargin="160">
          <!--#include virtual="/Sistema_Contable/plantilla.asp"-->
		  <div>
               <td valign="top" class="content">      
               <% if Session("PeriodoCerrado") <> "no" then %>
                <br><center><h1><font color="black"><N> Empresa Consultora de Software MICROTECN <N></font></h1></center>
			   <center><h1><font color="black"><N> Estado De Resultados <N></font></h1></center></div>
          <div><br>
          
          <table align="center" border-spacing="0" width="500px">
                       <tr>
                          <th bgcolor="#5882FA"><h2><font color="black"><N>Codigo</N></font></h2></th>
                          <th bgcolor="#5882FA"><h2><font color="black"><N>Nombre</N></font></h2></th>
                          <th colspan="2" bgcolor="#5882FA"><h2><font color="black"><N>Saldo</N></font></h2></th>	
                       </tr></table>
               <table align="center" border-spacing="0" width="500px">
               <center><h5><font color="black"><N> Ingresos<N></font></h5></center>
                  <%Do While Not rsMbrs.EOF%>
                       <tr valign="TOP">
                          <td WIDTH="70" align="left"><%=rsMbrs("Codigo")%>
                          <td WIDTH="400" align="left"><%=rsMbrs("NombreCuenta")%></td>
                       <%if rsMbrs("saldo") > 0 then %>
                          <td WIDTH="100" align="left"><%=rsMbrs("Saldo")%></td>
                          <td>&nbsp</td>
                       <%else%>
                         
                          <td WIDTH="100" align="left"><%=abs(rsMbrs("Saldo"))%></td>
                          <td>&nbsp</td>
                       </tr>
                  <%
                         end if
                         SumaIngreso=0
                         SumaGasto=0
                         rsMbrs.MoveNext
                    loop
                    set ql1=cnn1.execute(sql)
                        while not ql1.EOF
                       SumaIngreso = SumaIngreso + abs(ql1("Saldo"))
                       ql1.movenext
                        wend
                  %>
                       <tr>
                          <td colspan="2" bgcolor="#A9BCF5" align="right"><N> TOTAL <N></td>       
                          <td colspan="2" bgcolor="#A9BCF5" align="right"><N> <%=SumaIngreso%><N> </td>
                       </tr>
<!------------------------------------------------------------------------------------------------------------->
                  <%
                    sql1 ="SELECT Catalogo.NombreCuenta, Mayor.codigo, Mayor.saldo FROM Catalogo, Mayor WHERE Catalogo.Codigo=Mayor.codigo AND (Catalogo.Tipo=5 or Catalogo.Tipo=6)"
                    Set rsMbrs1 = Server.CreateObject("ADODB.Recordset")
                    rsMbrs1.Open sql1, cnn1, 0, 1, &H0001
                  %>
                  <table align="center" border-spacing="0" width="500px">
                    <center><h5><font color="black"><N>Egresos<N></font></h5></center>
                  <%Do While Not rsMbrs1.EOF%>
                        <tr valign="TOP">
                           <td WIDTH="70" align="left"><%=rsMbrs1("Codigo")%>
                           <td WIDTH="400" align="left"><%=rsMbrs1("NombreCuenta")%></td>
                        <%if rsMbrs1("saldo") > 0 then %>
                           <td WIDTH="100" align="left"><%=rsMbrs1("Saldo")%></td>
                           <td>&nbsp</td>
                        <%else%>
                           
                           <td WIDTH="100" align="left"><%=abs(rsMbrs1("Saldo"))
                           %></td>
                           <td>&nbsp</td>
                        </tr>
                  <%      
                          end if
                          rsMbrs1.MoveNext
                    loop
                    set ql2=cnn1.execute(sql1)
                        while not ql2.EOF
                      SumaGasto = SumaGasto + abs(ql2("Saldo"))
                      ql2.movenext
                        wend
                    rsMbrs.Close
                    rsMbrs1.Close
                    Set rsMbrs = Nothing
                    Set rsMbrs1 = Nothing
                    cnn1.Close
                    Set cnn1 = Nothing
                  %>
                        <tr>
                           <td colspan="2" bgcolor="#A9BCF5" align="right"><N> TOTAL </N></td>    
                           <td colspan="2" bgcolor="#A9BCF5" align="right"><N> (<%=SumaGasto%>)</N></td>
                           
                        </tr>
                        
                  </table>
<!--------------------------------->

                  <%if session("utilidad") > 0 then%>
        	    <h1><font color="black"><N>Utilidad = $<% Response.Write(session("utilidad"))%></N></font></h1> 
	           <h1><font color="black"><N> Se Obtuvieron Ganancias </N></font></h1>
                  <%else	%>
	            <h1><font color="red"><N>Utilidad = $(<% Response.Write(abs(session("utilidad")))%>)</N></font></h1>
	            <h1><font color="red"><N> Se Obtuvieron Perdidas </N></font></h1>
                  <%end if
             else %>
                <h1><font color="black"><N> No Has Cerrado Periodo!!  </N></font></h1>
             <%  end if%>
                </td>
              </tr>
           </table>
         </div>
     </body>
</html>
