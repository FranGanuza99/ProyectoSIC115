  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
     <head>
          <title>Sistema Contable</title>
          <META HTTP-EQUIV="EXPIRES" CONTENT="0">
          <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
          <meta name="Sitio Contable" content="Sistema Contable Empresa Solidaria Textil"/>

          <script language="JavaScript" src = "forms.js"></script>
          <script language = "javascript" src = "visual.js"></script>

          <link rel="stylesheet" href="estilo.css" type="text/css">
          <link rel="stylesheet" href="estilo1.css" type="text/css">

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
       <p id="titulo">Nueva transacci&oacuten</p>
       <br>
       <hr>
       <br>
       <br>
       <br>
                    <form name = "form1" method = "post" action = "registrarPartida.asp" OnSubmit = "return(validar(this));">


  <table align = "center">
 <center><h1 style="color: #2A2D2E">CREAR PARTIDA</h1></center>
 <br><br><br><br>
   <tr style="font-size:200%">
                
   </tr>
   <tr style="font-size:200%">

    <th colspan = "3">CARGO</th>
    <th colspan = "3">ABONO</th>
   </tr>

   <% 
     Dim Conexion,sql, List, cod, nom
     Set Conexion = Server.CreateObject("ADODB.Connection")
     Conexion.open "Datos","",""
     sql="SELECT * FROM catalogo"

     x = 1
     for i = 1 to 5
   %>

   <tr>
    <td><%if(i>1) then%><input type = "checkbox" name = "w<%=x%>" onclick = "habilitar(this)"><%else%>&nbsp;<%end if%></td>
    
    <td>              

      <select name="cc<%=i%>" <%if(i>1)then%>id = "capa<%=x%>" class = "oculto" <%end if %>>
	<%  
          set List = Conexion.execute(sql)
          While Not (List.EOF)
	    cod = List("Codigo")
	    nom = List("NombreCuenta")
	    Response.Write("<option value= '" & cod &"' >" & nom & "</option>")
	    List.MoveNext
	  Wend
        %> 
      </select>

    <%if(i>1) then %>
      <select name = "desact" id = "capa<%=x+1%>" disabled><option>Selecciona una cuenta <%for o=1 to 20%> &nbsp; <%next%></option></select>     
    <%end if %>

    </td>

    <td>
     <input type = "text" size = "6"  maxlength = "10" name = "mc<%=i%>"<%if(i>1)then%> id = "capa<%=x+2%>" class = "oculto" <%end if %>>
    <%if(i>1) then %>
      <input id="capa<%=x+3%>" type = "text" size = "6"  maxlength = "10" name = "desact" disabled>    
    <%end if %>
    </td>   

    <td><%if(i>1) then%><input type = "checkbox" name = "w<%=x+4%>"  onclick = "habilitar(this)"><%else%>&nbsp;<%end if%></td>
    <td>              
      <select name = "ca<%=i%>"<%if(i>1)then%> id = "capa<%=x+4%>" class = "oculto" <%end if %>>
        <% 
          set List = Conexion.execute(sql) 
          While Not (List.EOF)
	    cod = List("Codigo")
	    nom = List("NombreCuenta")
	    Response.Write("<option value= '" & cod &"' >" & nom & "</option>")
	    List.MoveNext
	  Wend
        %>
    </select> 

    <%if(i>1) then %>
      <select name = "desact" id = "capa<%=x+5%>" disabled><option>Selecciona una cuenta <%for o=1 to 20%> &nbsp; <%next%></option></select>     
    <%end if %>

    </td>

    <td>
     <input type = "text" size = "6" maxlength = "10" name = "ma<%=i%>"<%if(i>1)then%> id = "capa<%=x+6%>" class = "oculto" <%end if %>>
    <%if(i>1) then %>
      <input id="capa<%=x+7%>" type = "text" size = "6"  maxlength = "10" name = "desact" disabled>    
    <%end if %>

    </td> 
   </tr> 
  
   <% 
     if(i>1)then
       x = x + 8
     end if
     next 
     Conexion.close  
   %> 
   
   <tr>            
    <th colspan = "3"><input type = "submit" name = "aceptar" value = "ACEPTAR"></th>
    <th colspan = "3"><input type = "button" name = "cancelar" value = "CANCELAR"OnClick = "window.location = '../index.asp';"></th>
   </tr> 

 </table>  
 </form>
                </td>
              </tr>
           </table>
         </div>
     </body>
</html>
