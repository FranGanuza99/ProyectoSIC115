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
          background:url('/imagen/index.png') no-repeat center center fixed;
          -webkit-background-size: cover;
          -moz-background-size: cover;
          -o-background-size: cover;
          background-size: cover;
          }
        </style>

          <!--#include virtual="/Sistema_Contable/plantilla.asp"--><br><br>
		  <p id="titulo">Se ha cerrado el per&iacuteodo</p>
       <br>
       <hr>
       <br>
       <br>
       <br>
               <%
                 dim Suma,SumaIngreso,SumaGasto
                 
                 'conecta a la base de datos
                 Set cnn1 = Server.CreateObject("ADODB.Connection")
                 cnn1.Open "Datos","",""

                 Suma=0
                 SumaIngreso=0
                 SumaGasto=0

                 'calcula la sum 
                 SQL ="SELECT Catalogo.NombreCuenta, Mayor.codigo, Mayor.saldo FROM Catalogo, Mayor WHERE Catalogo.Codigo=Mayor.codigo AND (Catalogo.Tipo=4)"
                 set ql=cnn1.execute(SQL)
                 while not ql.EOF
                   Suma = Suma + abs(ql("Saldo"))
                     session("SumaIngreso")=Suma
               ql.movenext
                 wend
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
                 SumaG=0

                 'calcula la suma del gasto
               SQL1 ="SELECT Catalogo.NombreCuenta, Mayor.codigo, Mayor.saldo FROM Catalogo, Mayor WHERE Catalogo.Codigo=Mayor.codigo AND (Catalogo.Tipo=5 or Catalogo.Tipo=6)"
                 set ql1=cnn1.execute(SQL1)
                 while not ql1.EOF
               SumaG = SumaG + ql1("Saldo")
               session("SumaGasto") = SumaG
               ql1.movenext
                 wend

                 util = Suma - SumaG
                 session("utilidad")=util

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
                 SumaInv=0
                 SumaDesinv=0

                 'calcula la suma de la inversion
                SQL2 ="SELECT Catalogo.NombreCuenta, Mayor.codigo, Mayor.saldo FROM Catalogo, Mayor WHERE Catalogo.Codigo=Mayor.codigo AND (Catalogo.Tipo=8)"
                 set ql=cnn1.execute(SQL2)
                 while not ql.EOF 
               SumaInv = SumaInv + abs(ql("Saldo"))
               ql.movenext
                 wend

                 Tinv = SumaInv + util
                 session("Totalinv")=Tinv
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
                 SDesinv =0
                 'calcula la suma de la desinversion
                  SQL1 ="SELECT Catalogo.NombreCuenta, Mayor.codigo, Mayor.saldo FROM Catalogo, Mayor WHERE Catalogo.Codigo=Mayor.codigo AND (Catalogo.Tipo=7)"

                 set ql1=cnn1.execute(SQL1)
                 while not ql1.EOF
               SDesinv = SDesinv + ql1("saldo")
               session("SumaDesinv")=SDesinv
               ql1.movenext
                 wend

                 capconta = (Tinv-SDesinv)
                 session("kconta")=capconta
                 cnn1.Close
                 Set cnn1 = Nothing
               %>
<!--------------------------------->
                  </td>
              </tr>
           </table>
         </div>
     </body>
</html>
