SELECT  numero_poliza, numero_certificado from interseguro.intermedio_desgravamen where 
archivo_trama = 'PRIMAS_NSAT_SOL_202211.txt' 
and id_correlativo not in (
select pal_recordid from interseguro.stpo_policyaslogical);