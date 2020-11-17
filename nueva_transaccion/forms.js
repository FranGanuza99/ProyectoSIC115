function validar(dat)
{
 totalc=0.0;
 totala=0.0;
 
 if((dat.cc1.value == 0) || (dat.ca1.value == 0))
 {
  alert("Selecciona la cuenta!!");
  return false;
 }

 if(dat.cc1.value == dat.ca1.value)
 {
  alert("No puedes cargar y abonar la misma cuenta!!");
  return false;
 }
 
 if((dat.mc1.value < 0)||(dat.ma1.value < 0))
 {
  alert("Escribe unicamente positivos");

  if(dat.mc1.value < 0) 
     dat.mc1.focus();
  else
     dat.ma1.focus();

  return false;
 }

  
 if(isNaN(dat.mc1.value) || isNaN(dat.ma1.value))
 {
  alert("Escribe unicamente numeros");
  if(isNaN(dat.mc1.value))
    dat.mc1.focus();
  else
    dat.ma1.focus();
  return false;
 }


 if((dat.mc1.value=="")||(dat.ma1.value==""))
 {
  alert("Faltan Datos!!");

  if(dat.mc1.value == "") 
     dat.mc1.focus();
  else
     dat.ma1.focus();

  return false;
 }

/***************/
/* Checkbox w1 */
/***************/

if(dat.w1.checked == 1)
{
  x = chekar(dat.cc2, dat.mc2, dat, dat.w1)
  if(x == "malo")
    return false;
  totalc = parseFloat(totalc) + parseFloat(dat.mc2.value);
} // Fin de si w1 esta chekado
else
{
 dat.cc2.value = "0";
 dat.mc2.value = "0";
}

/***************/
/* Checkbox w5 */
/***************/

if(dat.w5.checked == 1)
{
  x = chekar(dat.ca2, dat.ma2, dat, dat.w5)
  if(x == "malo")
    return false;
  totala = parseFloat(totala) + parseFloat(dat.ma2.value);
} // Fin de si w5 esta chekado
else
{
 dat.ca2.value = "0";
 dat.ma2.value = "0";
}


/***************/
/* Checkbox w9 */
/***************/

if(dat.w9.checked == 1)
{
  x = chekar(dat.cc3, dat.mc3, dat, dat.w9)
  if(x == "malo")
    return false;
  totalc = parseFloat(totalc) + parseFloat(dat.mc3.value);
} // Fin de si w9 esta chekado
else
{
 dat.cc3.value = "0";
 dat.mc3.value = "0";
}

/****************/
/* Checkbox w13 */
/****************/

if(dat.w13.checked == 1)
{
  x = chekar(dat.ca3, dat.ma3, dat, dat.w13)
  if(x == "malo")
    return false;
  totala = parseFloat(totala) + parseFloat(dat.ma3.value);
} // Fin de si w13 esta chekado
else
{
 dat.ca3.value = "0";
 dat.ma3.value = "0";
}

/****************/
/* Checkbox w17 */
/****************/

if(dat.w17.checked == 1)
{
  x = chekar(dat.cc4, dat.mc4, dat, dat.w17)
  if(x == "malo")
    return false;
  totalc = parseFloat(totalc) + parseFloat(dat.mc4.value);
} // Fin de si w17 esta chekado
else
{
 dat.cc4.value = "0";
 dat.mc4.value = "0";
}

/****************/
/* Checkbox w21 */
/****************/

if(dat.w21.checked == 1)
{
  x = chekar(dat.ca4, dat.ma4, dat, dat.w21)
  if(x == "malo")
    return false;
  totala = parseFloat(totala) + parseFloat(dat.ma4.value);
} // Fin de si w21 esta chekado
else
{
 dat.ca4.value = "0";
 dat.ma4.value = "0";
}

/****************/
/* Checkbox w25 */
/****************/

if(dat.w25.checked == 1)
{
  x = chekar(dat.cc5, dat.mc5, dat, dat.w25)
  if(x == "malo")
    return false;
  totalc = parseFloat(totalc) + parseFloat(dat.mc5.value);
} // Fin de si w25 esta chekado
else
{
 dat.cc5.value = "0";
 dat.mc5.value = "0";
}

/****************/
/* Checkbox w29 */
/****************/

if(dat.w29.checked == 1)
{
  x = chekar(dat.ca5, dat.ma5, dat, dat.w29)
  if(x == "malo")
    return false;
  totala = parseFloat(totala) + parseFloat(dat.ma5.value);
} // Fin de si w29 esta chekado
else
{
 dat.ca5.value = "0";
 dat.ma5.value = "0";
}

totalc = parseFloat(totalc) + parseFloat(dat.mc1.value);
totala = parseFloat(totala) + parseFloat(dat.ma1.value);


if(parseFloat(totalc) != parseFloat(totala))
{
  alert("CARGO:" + totalc + "\nABONO:" + totala + "\nNo cumples la partida doble");
  return false;
}
return true;


} // Fin de Validar







function chekar(cuenta, valor, d, ch)
{


if(cuenta.value == 0)
 {
  alert("Selecciona la cuenta!!");
  return "malo";
 }

 if(valor.value < 0)
 {
  alert("Escribe unicamente positivos");
  valor.focus();
  return "malo";
 }

 if(isNaN(valor.value))
 {
  alert("Escribe unicamente numeros");
  valor.focus();
  return "malo";
 }

 if(valor.value=="")
 {
  alert("Faltan Datos!!");
  valor.focus();
  return "malo";
 }

 if((d.w1.checked == 1)&&(d.w1.name != ch.name))
 {
   if(d.cc2.value == cuenta.value)
   {
    alert("Estas utitilizando 2 veces la misma cuenta");
    return "malo";
   }
 }

 if((d.w5.checked == 1)&&(d.w5.name != ch.name))
 {
   if(d.ca2.value == cuenta.value)
   {
    alert("Estas utitilizando 2 veces la misma cuenta");
    return "malo";
   }
 }

 if((d.w9.checked == 1)&&(d.w9.name != ch.name))
 {
   if(d.cc3.value == cuenta.value)
   {
    alert("Estas utitilizando 2 veces la misma cuenta");
    return "malo";
   }
 }

 if((d.w13.checked == 1)&&(d.w13.name != ch.name))
 {
   if(d.ca3.value == cuenta.value)
   {
    alert("Estas utitilizando 2 veces la misma cuenta");
    return "malo";
   }
 }

 if((d.w17.checked == 1)&&(d.w17.name != ch.name))
 {
   if(d.cc4.value == cuenta.value)
   {
    alert("Estas utitilizando 2 veces la misma cuenta");
    return "malo";
   }
 }

 if((d.w21.checked == 1)&&(d.w21.name != ch.name))
 {
   if(d.ca4.value == cuenta.value)
   {
    alert("Estas utitilizando 2 veces la misma cuenta");
    return "malo";
   }
 }

 if((d.w25.checked == 1)&&(d.w25.name != ch.name))
 {
   if(d.cc5.value == cuenta.value)
   {
    alert("Estas utitilizando 2 veces la misma cuenta");
    return "malo";
   }
 }

 if((d.w29.checked == 1)&&(d.w29.name != ch.name))
 {
   if(d.ca5.value == cuenta.value)
   {
    alert("Estas utitilizando 2 veces la misma cuenta");
    return "malo";
   }
 }

 if(d.cc1.value == cuenta.value)
 {
  alert("Estas utitilizando 2 veces la misma cuenta");
  return "malo";
 }

 if(d.ca1.value == cuenta.value)
 {
  alert("Estas utitilizando 2 veces la misma cuenta");
  return "malo";
 }

 return "bueno"
}







function validar2(dat)
{

 if(dat.mp.value == 0)
 {
  alert("Selecciona la cuenta!!");
  return false;
 }

 if((dat.cantidad.value < 0)||(dat.precio.value < 0))
 {
  alert("Escribe unicamente positivos");

  if(dat.cantidad.value < 0) 
     dat.cantidad.focus();
  else
     dat.precio.focus();

  return false;
 }

 if (isNaN(dat.cantidad.value) || isNaN(dat.precio.value)) 
 {
  alert("Escribe unicamente numeros");
  if(isNaN(dat.cantidad.value))
    dat.cantidad.focus();
  else
    dat.precio.focus();

  return false;
 }

 if((dat.cantidad.value=="")||(dat.precio.value==""))
 {
  alert("Faltan Datos!!");
  if(dat.cantidad.value=="")
    dat.cantidad.focus();
  else
    dat.precio.focus();

  return false;
 }


  return true;
}







function validar3(dat)
{

 if (isNaN(dat.cantidad.value))
 {
  alert("Escribe unicamente numeros");
  dat.cantidad.focus();
  return false;
 }

 if(dat.cantidad.value < 0)
 {
  alert("Escribe unicamente positivos");
  dat.cantidad.focus();

  return false;
 }

 if((dat.cantidad.value==""))
 {
  alert("Faltan Datos!!");
  dat.cantidad.focus();
  return false;
 }

  return true;
}

