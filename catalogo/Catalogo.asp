<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
     <head>
          <title>Sistema Contable</title>
          <META HTTP-EQUIV="EXPIRES" CONTENT="0">
          <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
          <meta name="Sitio Contable" content="Empresa Consultora de Software MICROTECN"/>

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
               <td valign="top" class="content"> 
			  <p id="titulo" style="font-size: 55px;">Catalogo de Cuentas</p>            
                  <% 
                    Dim Conexion,sql, List, cod, nom
                    Set Conexion = Server.CreateObject("ADODB.Connection")
                    Conexion.open "Datos","",""
                    sql="SELECT * FROM catalogo"
                    set l = Conexion.execute(sql)
                    l.MoveNext
                  %>  
                  <table border = "2" align = "center" width ="65%" style="margin-bottom: 5%;">
                      <tr>
                         <th style="background-color: #e4da59;"><h1><strong> CODIGO </strong></h1></th>
                         <th style="background-color: #e4da59;"><h1><strong> NOMBRE </strong></h1></th>
                         <th style="background-color: #e4da59;"><h1><strong> TIPO </strong></h1></th>
                      </tr>
                  <% while NOT(l.EOF)
                         if l("Tipo") =1 then
                             tipo = "ACTIVO"
                         else
                             if l("Tipo") =2   then
                                tipo = "PASIVO"
                             else
                                if l("Tipo")=3  then
                                   tipo = "CAPITAL"
                                else
                                   if l("tipo") =6  then
                                      tipo = "GASTOS"
                                   else
                                    if l("tipo") =7  then
                                      tipo = "DESINVERSIONES"
                                   else
                                   if l("tipo") =8  then
                                      tipo = "INVERSIONES"
                                   else
                                    if l("tipo") =5  then
                                      tipo = "COSTOS"
                                   else
                                   if l("tipo") =4  then
                                      tipo = "INGRESOS"
                                   end if
                                end if
                             end if
                         end if 
                         end if
                         end if
                         end if
                         end if     
                  %>   
                      <tr>
                         <td><font size ="4", color ="black"><strong> <%=l("codigo") %> </strong></td>
                         <td align="center" width="400"><font size ="4", color ="black"><strong> <%=l("NombreCuenta") %> </strong></td>
                         <td><font size ="4", color ="black"><strong> <%= tipo %> </strong></td>
                      </tr>
                  <% l.MoveNext 
                    Wend
                  %>
                  </table>              
                  <% Conexion.close %>
                </td>
              </tr>
           </table>
     </body>
</html>
