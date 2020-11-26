  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
     <head>
          <title>Sistema Contable</title>
          <META HTTP-EQUIV="EXPIRES" CONTENT="0">
          <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
          <meta name="Sitio Contable" content="Empresa Consultora de Software MICROTECN"/>
          <%
            dim SumaActivo,SumaPasivo,SumaCapital
           
            set cnn1 = Server.CreateObject("ADODB.Connection")
            cnn1.open "Datos","",""
            sql ="SELECT Catalogo.NombreCuenta, Mayor.codigo, Mayor.saldo FROM Catalogo, Mayor WHERE Catalogo.Codigo=Mayor.codigo AND (Catalogo.Tipo = 1) ORDER BY Mayor.codigo"
            'sql = "SELECT * FROM mayor WHERE codigo >= 1000 AND codigo < 2000 ORDER BY codigo;"
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
		 <div>
               <td valign="top" class="content"> 
               <% if Session("PeriodoCerrado") <> "no" then %>
                <center><h1><font color="black"><N> Empresa Consultora de Software MICROTECN <N></font></h1></center>
			   <center><h1><font color="black"><N> Balance General </N></font></h1></center></div>
           <div id="logo1">
           <br><br><br>
                       <table align="center" border-spacing="0" width="500px">
                          <tr>
                             <th bgcolor="#5882FA"><h2><font color="black"><N>Codigo</N></font></h2></th>
                             <th bgcolor="#5882FA"><h2><font color="black"><N>Nombre</N></font></h2></th>
                             <th bgcolor="#5882FA"><h2><font color="black"><N>Saldo</N></font></h2></th>
                          </tr><table>
                    <table align="center" border-spacing="0" width="500px">
                    <left><h5><font color="black"><N>Activos</N></font></h5></left>
                     <%Do While Not rsMbrs.EOF%>
                          <tr valign="TOP">
                              <td WIDTH="70" align="left"><%=rsMbrs("Codigo")%>
                              <td WIDTH="400" align="center"><%=rsMbrs("NombreCuenta")%></td>
                              <td WIDTH="100" align="right"><%=abs(rsMbrs("Saldo"))%></td>
                          </tr>
                     <%
                          SumaActivo=0
                          SumaPasivo=0
                          SumaCapital=0
                          rsMbrs.MoveNext
                       loop
                          
                       'calcula la suma de los activos
                                  
                       set ql=cnn1.execute(sql)
                       while not ql.EOF
	                   SumaActivo = SumaActivo + abs(ql("Saldo"))
	                   ql.movenext
                       wend
                     %>
                          <tr>
                              <td colspan="2" bgcolor="#A9BCF5" align="right"><N> TOTAL </N></td>      
                             <td bgcolor="#A9BCF5" align="right"><N> <%=SumaActivo %></N></td>
                          </tr>

<!------------------------------------------------------------------------------------------------------------->
                     <%

                       sql2 ="SELECT Catalogo.NombreCuenta, Mayor.codigo, Mayor.saldo FROM Catalogo, Mayor WHERE Catalogo.Codigo=Mayor.codigo AND (Catalogo.Tipo=2)"
                       set rsMbrs2 = cnn1.execute(sql2)

                      %>
                      <table align="center" border-spacing="0" width="500px">
                         <left><h5><font color="black"><N>Pasivos</N></font></h5></left>
          
      
                      <%Do While Not rsMbrs2.EOF%>
                            <tr valign="TOP">
                               <td WIDTH="70" align="left"><%=rsMbrs2("Codigo")%>
                               <td WIDTH="400" align="center"><%=rsMbrs2("NombreCuenta")%></td>
                               <td WIDTH="100" align="right"><%=abs(rsMbrs2("Saldo"))%></td>
                            </tr>
                      <%
                            rsMbrs2.MoveNext
                        loop
                        'calcula la suma de los pasivos
                        set ql2=cnn1.execute(sql2)
                        while not ql2.EOF
	                    SumaPasivo = SumaPasivo + abs(ql2("Saldo"))
	                    ql2.movenext
                        wend
                      %>
                            <tr>
                                <td colspan="2" bgcolor="#A9BCF5" align="right"><N>TOTAL PASIVOS</N></td>      
                                 <td bgcolor="#A9BCF5" align="right"><N><%=SumaPasivo %></N></td>
                            </tr>
<!------------------------------------------------------------------------------------------------------------->
                      <%
                        SumaInv = 0
                        SumaDesinv = 0

                        sql3 ="SELECT Catalogo.NombreCuenta, Mayor.codigo, Mayor.saldo FROM Catalogo, Mayor WHERE Catalogo.Codigo=Mayor.codigo AND Catalogo.codigo >= 3000 AND Catalogo.codigo < 4000"
                        set rsMbrs1 = cnn1.execute(sql3)

                        'calcula la suma del capital
                        while not rsMbrs1.EOF
                          SumaInv = SumaInv + abs(rsMbrs1("Saldo"))
                          rsMbrs1.movenext
                        wend

                        sql3 ="SELECT Catalogo.NombreCuenta, Mayor.codigo, Mayor.saldo FROM Catalogo, Mayor WHERE Catalogo.Codigo=Mayor.codigo AND (Catalogo.Tipo=7)"
                        set rsMbrs6 = cnn1.execute(sql3)

                        'calcula la suma del capital
                        while not rsMbrs6.EOF
                          SumaDesinv = SumaDesinv + abs(rsMbrs6("Saldo"))
                          rsMbrs6.movenext
                        wend

                        capital = SumaInv - SumaDesinv + session("utilidad")

                      %>
                      <table align="center" border-spacing="0" width="500px">
                              <left><h5><font color="black"><N>Capital<N></font></h5></left>

                             <tr valign="TOP">
                                <td WIDTH="70" align="left">3006</td>
                                <td WIDTH="400" align="center">Capital contable</td>
                                <td WIDTH="100" align="right"><%=capital%></td>
                             </tr>
                      <% 
                        TotalKconta = capital
                        TotalPart = SumaPasivo + TotalKconta
                        rsMbrs.Close
                        rsMbrs1.Close
                        rsMbrs2.Close
			rsMbrs6.Close
                        Set rsMbrs = Nothing
                        Set rsMbrs1 = Nothing
                        Set rsMbrs2 = Nothing
			Set rsMbrs6 = Nothing
                        cnn1.Close
                        Set cnn1 = Nothing
                      %>
                             <tr>
                                <td colspan="2" bgcolor="#A9BCF5" align="right"><N>TOTAL CAPITAL</N></td>       
                                 <td bgcolor="#A9BCF5" align="right"><N><%=capital%></N></td>
                             </tr>
                      </table>
                      <p>&nbsp;<p>
                      <h1><font color="black"><N> Total De Activos = $ <%=SumaActivo %> <N></font></h1>
                      <h1><font color="black"><N> Total De Participaciones = $ <% =TotalPart%> <N></font></h1>
              <% else %>
                     <h1><font color="black"><N> No Has Cerrado Periodo!!<N></font></h1>
              <%  end if%>
                </td>
              </tr>
           </table>
         </div>
     </body>
</html>
