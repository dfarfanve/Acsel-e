SELECT CO.item, pr.numeropolizainput, co.id operationpk, et.description evento , p.description Producto,
S.CODIGOPLANINPUT codPlan, DESCRIPCIONPLANINPUT planDescription , PR.VIGENCIAINPUT VIGENCIA, MONEDAINPUT MONEDA,  pdco.initialdate
FROM POLICYDCO PDCO, AGREGATEDPOLICY AP, CONTEXTOPERATION CO, EVENTDCO EDCO, EVENTTYPE ET  , prepolicy pr , -- cobertura cob, CoverageDCO cdco,
PLAN PL INNER JOIN PREPLANS S ON S.STATIC = PL.PLANID
              INNER JOIN PRODUCT P ON PL.PRODUCTID = P.PRODUCTID  INNER JOIN PREPRODUCT PP ON P.PRODUCTID = PP.STATIC
            INNER JOIN INSURANCEOBJECTDCO IODCO ON IODCO.PLANID = PL.PLANID     
            --INNER JOIN stpo_policyaslogical STPO ON pr.numeropolizainput = STPO.pal_policynumber 
WHERE PDCO.AGREGATEDOBJECTID=AP.AGREGATEDPOLICYID 
and  pr.pk = pdco.dcoid
AND AP.PRODUCTID=P.PRODUCTID  
AND CO.ID=PDCO.OPERATIONPK  
AND PDCO.OPERATIONPK=EDCO.OPERATIONPK 
AND EDCO.EVENTTYPEID=ET.EVENTTYPEID  
AND EDCO.POLICYPK = CO.ITEM
and IODCO.OPERATIONPK = CO.id
AND P.DESCRIPTION IN ('DesgTarjetasIndividual') --('DesgravamenBBVATC', 'DesgravamenBANBIFTC','DesgravamenBBVATC','DesgravamenFORUM')
AND CO.STATUS =  2   
and pr.numeropolizainput = '500105-0000149-02'
and co.id = pdco.operationpk
order by CO.id desc; 

select *  from intermedio_desgravamen where numero_poliza = '500105' and numero_certificado = '0000149' and ind_cargado = 'S' and tipo_poliza = 'Interbank' and evento_aplicar = 0;

update intermedio_desgravamen set ind_Cargado = null, palwhere id_correlativo = 7132961304;

SET DEFINE OFF;
--SQL Statement which produced this data:
--
--  select *  from intermedio_desgravamen where numero_poliza = '500105' and numero_certificado = '0000149' and ind_cargado = 'S' and evento_aplicar = 0;
--


select * from INTERMEDIO_DESGRAVAMEN WHERE ID_CORRELATIVO IN (6788588578,7132961304);

select * from preproduct where static = (select productid from product where description ='DesgTarjetasIndividual');

select * from TDTarifaDesgTarj ;

select tf.description,tf.value
from transformadorFila tf,
     property p
where p.propertyid = tf.propertyid
  and p.simbolo in ('SubProductoPlanTD');

select * from TDSUBPRODUCDESGIND;

SELECT distinct table_name from all_tab_columns where table_name LIKE '%TDSU%'; AND OWNER = 'INTERSEGURO';

SELECT * 