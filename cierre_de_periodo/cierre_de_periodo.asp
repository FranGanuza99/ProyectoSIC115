<%language="VBScript" %>
  
<%  
   set con=Server.CreateObject("ADOdb.Connection")
   con.Open "Datos","","" 
   cadena="DELETE * FROM Mayor"
   sql="SELECT * FROM Diario ORDER BY codigo"

   con.Execute(cadena)
   set r=con.Execute(sql)

   cuenta=r("codigo")

   while NOT(r.EOF)
     cargo=0
     abono=0
     aux = r("codigo")
    
     while not(r.EOF) AND cuenta = aux
        c = r("cargo")
        a = r("abono")
        cargo=cargo + c
        abono=abono + a
        r.MoveNext
        if not(r.EOF) then
          aux = r("codigo")
        end if
      wend

   sql2="INSERT INTO Mayor(Codigo, Cargo, Abono, Saldo) VALUES('"&cuenta&"', '"&cargo&"', '"&abono&"', '"&(cargo-abono)&"')" 
   con.Execute(sql2)
   if not(r.EOF) then
       cuenta=r("codigo")
   end if

   wend

   Session("PeriodoCerrado") = "si"
   con.close
   Response.redirect"calculo.asp"
%>
