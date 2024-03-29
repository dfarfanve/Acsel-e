-- SI LAS TRAMAS NO SON DE DESGRAVAMEN NO VAN PARA INTERMEDIO_DESGRAVAMEN

select ASL_LOGICAL_PK
from INTERSEGURO.INTERMEDIO_DESGRAVAMEN
  WHERE ASL_LOGICAL_PK= 152265482;

UPDATE INTERSEGURO.INTERMEDIO_DESGRAVAMEN SET IND_CARGADO = 'N' , ASL_LOGICAL_PK = null WHERE archivo_trama IN (
  'AON-ProtBlindajeIndividualPlus-BAJAS-2512201801CONSOL3112AL2701.txt')
  
  select FECHA_CARGA, PRODUCTO, ARCHIVO_TRAMA, COUNT(1)
from INTERSEGURO.INTERMEDIO_DESGRAVAMEN where
  (IND_CARGADO is null and ASL_LOGICAL_PK is null)
  or archivo_trama='AON-ProtBlindajeIndividualPlus-BAJAS-2512201801CONSOL3112AL2701.txt'
group by fecha_carga, producto, archivo_trama;