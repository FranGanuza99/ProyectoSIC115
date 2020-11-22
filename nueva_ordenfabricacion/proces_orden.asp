<%language="VBScript" %>
  
<%  
  fecha= request.form("fecha")  
  Norden= request.form("orden")
  producto= request.form("producto")
  cantidad= request.form("cantidad") 
  
  j=1
  montoP=0
  
  set con=Server.CreateObject("ADOdb.Connection")
  con.Open "Datos","","" 

  set resul=Server.CreateObject("ADOdb.Recordset")

  sql="SELECT * FROM Diario ORDER BY NumTrans"
  set r=con.Execute(sql)
  While Not (r.EOF)
        numero = r("NumTrans")
        r.MoveNext
  Wend
  if numero="" then
     numero=0
  end if


  for i=1 to j
    mat=request.form("mat"&i)
    cant=request.form("cant"&i)
    if mat<> 0 then
       sql="SELECT Cantidad, PrecioUnitario, Monto FROM inventario where codigo="&mat
       resul=con.Execute(sql)
       m=cant*resul("PrecioUnitario")
       sql="INSERT INTO Diario (NumTrans, codigo, abono, fecha) VALUES ('" & numero+1 & "', '" & mat & "', '" & m & "', '" & fecha & "')"
       con.Execute(sql)
       cant= resul("Cantidad")-cant
       monto= resul("Monto")-m
       sql="UPDATE inventario SET Cantidad="&cant&", Monto="&monto&" WHERE codigo="&mat
       con.Execute(sql)  

       montoP=montoP+m
     end if  
  next
  
  montobra=0
  for i=1 to j
     nobra=request.form("obrero"&i)
     costohora=request.form("costo"&i)
     numhora=request.form("hora"&i)
     if nobra <> "" then
        montobra= montobra+(nobra*costohora*numhora)
     end if
  next
  sql="INSERT INTO Diario (NumTrans, codigo, abono, fecha) VALUES ('" & numero+1 & "', '4019', '" & montobra & "', '" & fecha & "')"
  con.Execute(sql)
 
  montogif=0
  for i=1 to j
     tasa=request.form("tasa"&i)
     importe=request.form("importe"&i)
     if tasa <> "" then
        montogif=montogif+importe
     end if
  next
  sql="INSERT INTO Diario (NumTrans, codigo, abono, fecha) VALUES ('" & numero+1 & "', '5000', '" & montogif & "', '" & fecha & "')"
  con.Execute(sql)
 
  MontoTotal= montoP+montobra+montogif
  precioU=MontoTotal/cantidad
  p=producto+3
  
       
  sql="INSERT INTO ordenes(NumOrden, codigo, fecha,  MontoMP, MontoMObra, MontoGif, Monto, Cantidad, PrecioU) VALUES('"&Norden&"', '"&p&"', #"&fecha&"#, '"&montoP&"', '"&montobra&"', '"&montogif&"', '"&MontoTotal&"', '"&cantidad&"', '"&precioU&"')"
  con.Execute(sql)
  
 


  sql="INSERT INTO Diario (NumTrans, codigo, cargo, fecha) VALUES ('" & numero+1 & "', '" & producto+3 & "', '" & MontoTotal & "', '" & fecha & "')"
  response.write(sql)
  con.Execute(sql)


  r.close
  con.close
  Response.redirect "orden.asp?numorden="&Norden
%>
