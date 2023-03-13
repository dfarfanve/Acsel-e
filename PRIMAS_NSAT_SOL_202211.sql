update interseguro.intermedio_desgravamen set ind_cargado = null, evento_aplicar = null, id_proceso = null where archivo_trama = 'PRIMAS_NSAT_SOL_202211.txt' and ind_cargado = 'N';
commit;