<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
     <head>
          <title>Sistema Contable</title>
          <META HTTP-EQUIV="EXPIRES" CONTENT="0">
          <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
          <meta name="Sitio Contable" content="Empresa Consultora de Software MICROTECN"/>
  <%
    dim SumaSaldo,SumaAbono
    Set cnn1 = Server.CreateObject("ADODB.Connection")
    cnn1.open "Datos","",""
           
'   sql = "SELECT * FROM mayor ORDER BY codigo;"
          sql = "SELECT Catalogo.NombreCuenta, Mayor.codigo, Mayor.saldo FROM Catalogo, Mayor WHERE Catalogo.Codigo=Mayor.codigo ORDER BY Mayor.codigo" 
    Set rsMbrs = Server.CreateObject("ADODB.Recordset")
    rsMbrs.Open sql, cnn1, 0, 1, &H0001
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
          <br><br>
                <p id="titulo">Balance de comprobaci&oacuten</p>
       <br>
       <hr>
       <br>
       <br>
       <br>

     <div id='logo1'>
        <center><h1 id="titulo"> Empresa Consultora de Software MICROTECN  </h1></center>

               <td valign="top"   class="content">             
                     <% if Session("PeriodoCerrado") <> "no" then %>
         
      
      <br></div>
      <div id='logo1'> <br><br><br><br>
                     <table id="fieldset2"  border-spacing="0" border="2px"> 
                          <tr>
                             <th bgcolor="#5882FA"><center><h2><font color="black"><N>Codigo</N></font></h2></th>
                             <th bgcolor="#5882FA"><center><h2><font color="black"><N>Nombre</N></font></h2></th>
                             <th bgcolor="#5882FA"><center><h2><font color="black"><N>Cargo</N></font></h2></th>
                             <th bgcolor="#5882FA"><center><h2><font color="black"><N>Abono</N></font></h2></th>  
                          </tr>
                     <%
                        Do While Not rsMbrs.EOF
                     %>
                       <tr valign="TOP">
                             <td WIDTH="70" align="center"><%=rsMbrs("Codigo")%>
                             <td WIDTH="400" align="center"><%=rsMbrs("NombreCuenta")%></td>
                             <%if rsMbrs("saldo") > 0 then %>
                                <td WIDTH="400" align="right" ><%=rsMbrs("Saldo")%></td>
                                <td>&nbsp</td>
                             <%else%>
                                <td>&nbsp</td>
                                <td  WIDTH="400" align="right" ><%=abs(rsMbrs("Saldo"))%></td>
                       </tr>
                             <%
                               end if
                               SumaSaldo=0
                               SumaAbono=0
                               rsMbrs.MoveNext
                       loop

                       'calcula la suma del cargo y abono
                       SQL="select Saldo from mayor " 
                       set ql=cnn1.execute(SQL)
                       while not ql.EOF
                    if ql("Saldo") > 0 then
                 for k=0 To ql.fields.count-1
                    SumaSaldo = SumaSaldo + ql("Saldo")
                 next
                 ql.movenext
                    else
                 for k=0 To ql.fields.count-1
                     SumaAbono = SumaAbono + abs(ql("Saldo"))
                 next
                 ql.movenext
                    end if
                       wend

                       rsMbrs.Close
                       Set rsMbrs = Nothing
                       cnn1.Close
                       Set cnn1 = Nothing
                     %>
                    <tr>
                       <td>&nbsp</td>
                       <td>&nbsp</td>        
                       <td>&nbsp</td>
                       <td>&nbsp</td>
                    </tr>     
                    <tr>
                       <td colspan="2" bgcolor="#A9BCF5"> <center><h1><font color="black"><N> TOTAL <N></font></h1></center></td>
                             
                       <td bgcolor="#A9BCF5" align="right"><h1><font color="black"><N> <%=SumaSaldo %> </N></font></h1></td>
                       <td bgcolor="#A9BCF5" align="right"><h1><font color="black"><N> <%=SumaAbono %> </N></font></h1></td>
                    </tr>
               </table>

          <% else %>
             <h1> No has cerrado periodo!! </h1>
          <%  end if%>
               </td>
             </tr>
           </table>
         </div>

     </body>
</html>
