select * from interseguro.STPO_POLICYASLOGICAL where pal_policynumber = '500105-8297709-1';

select numero_poliza || '-' || numero_certificado || case when moncom = '01' then '-1' else '-2' end as poliza from interseguro.intermedio_desgravamen where archivo_trama = 'PRIMAS_NSAT_SOL_202211.txt' and ind_cargado='S';

select count(1) from interseguro.intermedio_desgravamen where archivo_trama = 'PRIMAS_NSAT_SOL_202211.txt' and ind_cargado='N';

select * from interseguro.stpo_policyaslogical where palh_filename = 'DesgTarjetasIndividual_Emitir_11-2022_2023-01-17_02_53_21'
and pal_additionalinfo is not null;
SELECT * from interseguro.intermedio_desgravamen where 
archivo_trama = 'PRIMAS_NSAT_SOL_202211.txt' 
AND
NUMERO_POLIZA = '500105' AND NUMERO_CERTIFICADO = '8297709';
SELECT count(id_correlativo) from interseguro.intermedio_desgravamen where 
archivo_trama = 'PRIMAS_NSAT_SOL_202211.txt' 
--AND
--NUMERO_POLIZA = '500105' AND NUMERO_CERTIFICADO = '8297709' 
and id_correlativo not in (
select pal_recordid from interseguro.stpo_policyaslogical);

select * from interseguro.STPO_POLICYASLOGICAL where pal_policynumber in( select opr_policynumber
from interseguro.openitemreference opr
join interseguro.openitem oi on oi.openitemid = opr.openitemid
where opm_masteropenitemid in (4325989158,4325989157));

SELECT * from interseguro.intermedio_desgravamen
where archivo_trama = 'PRIMAS_NSAT_SOL_202211.txt'  AND IND_CARGADO = 'S' and asl_logical_pk is null;

select palh_filename from interseguro.stpo_policyaslogical where pal_recordid in (
SELECT id_correlativo from interseguro.intermedio_desgravamen where 
archivo_trama = 'PRIMAS_NSAT_SOL_202211.txt' AND IND_CARGADO = 'S') group by palh_filename;

DesgTarjetasIndividual_Emitir_11-2022_2023-01-17_02_53_21

select * from interseguro.EXT_LOGDESGRAVAMEN;

select * from interseguro.stpo_policyaslogical;

select count(1) from interseguro.stpo_policyaslogical where pal_pk in (
SELECT asl_logical_pk from interseguro.intermedio_desgravamen where 
archivo_trama = 'PRIMAS_NSAT_SOL_202211.txt' AND IND_CARGADO = 'S');

SELECT  numero_poliza, numero_certificado from interseguro.intermedio_desgravamen where 
archivo_trama = 'PRIMAS_NSAT_SOL_202211.txt' 
and id_correlativo not in (
select pal_recordid from interseguro.stpo_policyaslogical);