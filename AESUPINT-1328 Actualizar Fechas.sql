/* AESUPINT-1328  Vida- Job de generación de prima
   Poliza: 115506
   Operaciones relacionadas:185398690
   Tabla a modificar: poldotalsimple, Prepolicy 
   Campos a Modificar:  fechaproxgenprimavidainput, FECHAPROXGENPRIMAVIDAVALUE,  FECHAPROXFACTURACIONINPUT, FECHAPROXFACTURACIONVALUE*/
   

UPDATE  interseguro.poldotalsimple POL
set POL.fechaproxgenprimavidainput = '2018-10-01',
    POL.FECHAPROXGENPRIMAVIDAVALUE =  '43372.0'
WHERE POL.PK =1860855215;


UPDATE  interseguro.Prepolicy PRE
set PRE.FECHAPROXFACTURACIONINPUT = '2018-10-01',
    PRE.FECHAPROXFACTURACIONVALUE = '43372.0' 
WHERE PRE.PK = 1860855215;
