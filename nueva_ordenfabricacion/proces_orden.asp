<%language="VBScript" %>
  
<%  
  fecha= request.form("fecha")  
  Norden= request.form("orden")
  producto= request.form("producto")
  cantidad= request.form("cantidad") 
  
  j=session("num")
  
  
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

  montoP=0
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
        montobra= montobra+(costohora*numhora)
     end if
  next
  sql="INSERT INTO Diario (NumTrans, codigo, cargo, fecha) VALUES ('" & numero+1 & "', '4019', '" & Round (montobra,2) & "', '" & fecha & "')"
  con.Execute(sql)
 
   montogif=0
   electricidad = 0
   internet = 0
  for i=1 to j
     tasa=request.form("tasa"&i)
     horacif=request.form("horacif"&i)
     if tasa <> "" then
         electricidad = (tasa - 0.0625) * horacif
         internet = 0.0625 * horacif
         montogif = Round (electricidad,2) + Round (internet,2)
     end if
  next
  sql="INSERT INTO Diario (NumTrans, codigo, cargo, fecha) VALUES ('" & numero+1 & "', '4008', '" & Round (electricidad,2) & "', '" & fecha & "')"
  con.Execute(sql)

  sql="INSERT INTO Diario (NumTrans, codigo, cargo, fecha) VALUES ('" & numero+1 & "', '4017', '" & Round (internet,2) & "', '" & fecha & "')"
  con.Execute(sql)
 
  MontoTotal= montoP + Round (montobra,2) + Round (electricidad,2) + Round (internet,2)
  precioU=MontoTotal/cantidad
  p=producto+3
  
       
  sql="INSERT INTO ordenes(NumOrden, codigo, fecha,  MontoMP, MontoMObra, MontoGif, Monto, Cantidad, PrecioU) VALUES('"&Norden&"', '"&p&"', #"&fecha&"#, '"&Round (montoP,2)&"', '"&Round (montobra,2)&"', '"&Round (montogif,2)&"', '"&Round (MontoTotal,2)&"', '"&cantidad&"', '"&Round (precioU,2)&"')"
  con.Execute(sql)
  
 


  sql="INSERT INTO Diario (NumTrans, codigo, abono, fecha) VALUES ('" & numero+1 & "', '" & producto & "', '" & Round (MontoTotal,2) & "', '" & fecha & "')"
  response.write(sql)
  con.Execute(sql)


  r.close
  con.close
  Response.redirect "orden.asp?numorden="&Norden
%>
