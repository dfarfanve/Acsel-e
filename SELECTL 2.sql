SELECT * FROM PREPOLICY WHERE NUMEROPOLIZAINPUT IN ('500105-0000149');

SELECT COUNT(PRE.STATIC),MONEDAINPUT FROM PREPOLICY PRE
JOIN PolDesgTarjetasInd PDTI ON PRE.PK = PDTI.PK
WHERE NUMEROPOLIZAINPUT IN ('500105-0000149')
GROUP BY PRE.STATIC,PRE.MONEDAINPUT;

select * from PolDesgTarjetasInd

SELECT * FROM intermedio_desgravamen WHERE archivo_trama = 'PRIMAS_NSAT_SOL_202208_TEST02.txt';

update intermedio_desgravamen set tipo_poliza = 'Interbank',ind_cargado =null,id_proceso = null,asl_logical_pk = null  WHERE ID_CORRELATIVO = 7182833692;

update intermedio_desgravamen set ind_cargado = 'P'  WHERE ID_CORRELATIVO = 7182833692;

  SELECT * FROM INT_DESG_PROCESS
      WHERE NUM_ERRORS = 0 --GROUP BY PRODUCTO, EVENTO_APLICAR, PERIODO_BASE
      --ORDER BY PERIODO_BASE, EVENTO_APLICAR, PRODUCTO; -- 
      
      delete from intermedio_desgravamen where id_correlativo = 7182833706;



select * from openitem where openitemid in (select openitemid from openitemreference where policyid in(
131288332)

select * from stca_doctype where dty_description = 'PrimaDevuelta';--dty_id in (7572,7692)
select * from contextoperation where 

4288992659
4288992660