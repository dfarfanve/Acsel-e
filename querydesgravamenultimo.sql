SELECT CO.item, pr.numeropolizainput, co.id operationpk, et.description evento , p.description Producto,
S.CODIGOPLANINPUT codPlan, DESCRIPCIONPLANINPUT planDescription , PR.VIGENCIAINPUT VIGENCIA, MONEDAINPUT MONEDA, STPO.pal_recordid, STPO.pal_status 
FROM POLICYDCO PDCO, AGREGATEDPOLICY AP, CONTEXTOPERATION CO, EVENTDCO EDCO, EVENTTYPE ET  , prepolicy pr , stpo_policyaslogical STPO,
PLAN PL INNER JOIN PREPLANS S ON S.STATIC = PL.PLANID
INNER JOIN PRODUCT P ON PL.PRODUCTID = P.PRODUCTID  INNER JOIN PREPRODUCT PP ON P.PRODUCTID = PP.STATIC
INNER JOIN INSURANCEOBJECTDCO IODCO ON IODCO.PLANID = PL.PLANID     
WHERE PDCO.AGREGATEDOBJECTID=AP.AGREGATEDPOLICYID 
and  pr.pk = pdco.dcoid
AND AP.PRODUCTID=P.PRODUCTID  
AND CO.ID=PDCO.OPERATIONPK  
AND PDCO.OPERATIONPK=EDCO.OPERATIONPK 
AND EDCO.EVENTTYPEID=ET.EVENTTYPEID  
AND EDCO.POLICYPK = CO.ITEM
and IODCO.OPERATIONPK = CO.id
and pr.numeropolizainput = STPO.pal_policynumber and stpo.pal_status = 1
AND P.DESCRIPTION IN ('DesgravamenBBVADesempleo') --('DesgravamenBBVATC', 'DesgravamenBANBIFTC','DesgravamenBBVATC','DesgravamenFORUM')
 AND et.description IN ('Alta','Consumo') 
 AND S.DESCRIPCIONPLANINPUT = 'Plan Premier'
-- AND pdco.initialdate between to_date('01/01/2022','dd/mm/yyyy') and to_date('01/07/2022','dd/mm/yyyy') 
AND pdco.initialdate >  to_date('10/08/2022','dd/mm/yyyy')
AND CO.STATUS =  2   
and co.id = ap.operationpk
and ROWNUM < 100
order by CO.item desc; 

select * from stpo_policyaslogical where pal_policynumber='00010157040379200' and pal_status = 1;--pal_recordid in (210058011);
310003261 --alta
310023982 --prima

update stpo_policyaslogical set pal_status = 6 where pal_status = 0 ;

update stpo_policyaslogical set pal_status = 0 where pal_recordid in (310023982);
commit;

-- PASO 6: Verificar pal_status = 1 y pal_policynumber = nuevo numero de poliza
select * from stpo_policyaslogical where pal_recordid in (310023982);

-- PASO 7: Se obtiene el PK de la unidad de riesgo a partir del número de póliza para actualizar las propiedades en la plantilla

SELECT RUDESG.PK FROM PREPOLICY PRE
JOIN CONTEXTOPERATION CO ON CO.ITEM = PRE.STATIC
JOIN AGREGATEDRISKUNIT AR ON AR.OPERATIONPK = CO.ID
JOIN RISKUNITDCO RDCO ON RDCO.OPERATIONPK = AR.OPERATIONPK
JOIN PRERISKUNITS PRU ON PRU.PK = DCOID
JOIN RUDESGRAVAMEN RUDESG ON RUDESG.PK = PRU.PK 
WHERE PRE.NUMEROPOLIZAINPUT IN ('00010157040401900');

-- PASO 8: ASIGNAR TIPO DE DEVOLUCION Y SUBPLAN SINO LO TIENE 
--PlanConticasaB = "14.0"
--PlanLibreDisponibilidadB = "15.0"
--PlanMiViviendaB = "16.0"
--PlanVehicularesB = "17.0"  

update rudesgravamen set tipodevolucioninput='Básico', tipodevolucionvalue='1.0', SUBPLANDESGRAVAMENVALUE='14.0',SUBPLANDESGRAVAMENINPUT='PlanConticasaB' where pk = 29744438833;

select * from prethirdparty where nombrepredeterminadoinput like 'KYRA   DREYFFUS %';

select * from policydco where agregatedobjectid = 518781533;
select * from contextoperation where item = 518781533;

update contextoperation set status = 1 where id =1471670119;-- and status = 3;
update contextoperation set loadmode = 2 where id =1471763154;-- and status = 3;

select * from contextoperation where item = 518698602;
select pk from prepolicy where numeropolizainput in ('00010157040353000'); -- static = 518782599;

select * from polbbva where pk in (29744259810,
29744237579,
29744259800);

update polbbva set ventanuevainput= 'Si', ventanuevavalue = '1.0' where pk in (select pk from prepolicy where numeropolizainput in ('00010157040353000'));

select * from rimac_equivalencies where property='DesgSubPlanEq' and equivalence like 'PlanLibreDisponibilidadB%';


INSERT INTO APP_VIDA.RIMAC_EQUIVALENCIES (ID, PROPERTY, SASVALUE, EQUIVALENCE) VALUES (SQ_RIMAC_EQUIVALENCIES.nextval, 'DesgSubPlanEq','149','PlanConsumerFinanceB');
INSERT INTO APP_VIDA.RIMAC_EQUIVALENCIES (ID, PROPERTY, SASVALUE, EQUIVALENCE) VALUES (SQ_RIMAC_EQUIVALENCIES.nextval, 'DesgSubPlanEq','150','PlanConsumerFinanceD');
INSERT INTO APP_VIDA.RIMAC_EQUIVALENCIES (ID, PROPERTY, SASVALUE, EQUIVALENCE) VALUES (SQ_RIMAC_EQUIVALENCIES.nextval, 'DesgSubPlanEq','151','PlanConsumerFinanceO');


policyPK="518783119";
policyNumber="00010157040401800";

 builder.setPolicyPropertyValue("PeriodoDeGracia", "30", true);
 builder.setPolicyPropertyValue("DiasVigencia", "15", true);
 builder.setPolicyPropertyValue("FIni", "2023-08-15", true);
 builder.setPolicyPropertyValue("FFin", "2023-08-30"), true);
                                