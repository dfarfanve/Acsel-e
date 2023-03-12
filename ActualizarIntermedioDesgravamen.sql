
UPDATE interseguro.intermedio_desgravamen SET IND_CARGADO = null, id_proceso= null,asl_logical_pk =null, evento_aplicar=null
where archivo_trama = 'PRIMAS_NSAT_SOL_202208_TEST01.txt';

UPDATE interseguro.intermedio_desgravamen SET IND_CARGADO = null, id_proceso= null,asl_logical_pk =null, evento_aplicar=null
where archivo_trama = 'PRIMAS_NSAT_SOL_202208_TEST02.txt';

COMMIT;