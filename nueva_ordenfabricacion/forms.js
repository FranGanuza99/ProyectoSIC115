function validar(dat)
{
 
/*if(dat.mat1.value == 0)
 {
  alert("Debe seleccionar al menos una materia prima");
  dat.mat1.focus();
  return false;
 }
 else
 {
  if(dat.cant1.value == "")
  {
   alert("Debe indicar la cantidad de mateia prima");
   dat.cant1.focus();
   return false;
  }
 }*/


 if(dat.producto.value == 0)
 {
  alert("Seleccione un producto!!");
  dat.producto.focus();
  return false;
 }
 
 if(dat.cantidad.value=="")
 {
  alert("Ingrese la cantidad de producto a fabricar");
  dat.cantidad.focus();
  return false;
 }
 

 if(dat.obrero1.value=="")
 {
  alert("Este campo es necesario, por favor llenelo!");
  dat.obrero1.focus();
  return false;
 }

  
  if(dat.costo1.value=="")
 {
  alert("Este campo es necesario, por favor llenelo!");
  dat.costo1.focus();
  return false;
 }


  if(dat.hora1.value=="")
 {
  alert("Este campo es necesario, por favor llenelo!");
  dat.hora1.focus();
  return false;
 }


  if(dat.tasa1.value=="")
 {
  alert("Este campo es necesario, por favor llenelo!");
  dat.tasa1.focus();
  return false;
 }

  if(dat.importe1.value== 0)
 {
  alert("Este campo es necesario, por favor llenelo!");
  dat.importe1.focus();
  return false;
 }
 
 
 

} // Fin de Validar



function validar1(campo)
{
 if (campo.value<0)
 {
   alert("Solo numeros positivos");
   campo.focus();
 }
            
 if(isNaN(campo.value))
 {
  alert("Ingrese solo numeros por favor"); 
  campo.focus();
 }  
}//Fin validar1
