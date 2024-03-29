SELECT 
TRUNC(ct.TIME_STAMP,'DD') TIME_STAMP,
PP.NUMEROPOLIZAINPUT policynumber,
PDCO.AGREGATEDOBJECTID policyid ,
MIN(pdco.operationpk) minOperationPk,
REPLACE(LISTAGG(PDCO.OPERATIONPK, ',') WITHIN GROUP (ORDER BY pdco.operationpk DESC),',' || MIN(pdco.operationpk),'') oper_todel
FROM INTERSEGURO.POLICYDCO PDCO
JOIN INTERSEGURO.PREPOLICY PP ON PDCO.DCOID=PP.PK
join interseguro.contextoperation ct on PDCO.OPERATIONPK=CT.ID and ct.status=2
join INTERSEGURO.EVENTDCO edco on PDCO.IDDCOEVENT=EDCO.IDDCOEVENT
join INTERSEGURO.EVENTTYPE et  on EDCO.EVENTTYPEID=ET.EVENTTYPEID
where ET.DESCRIPTION='Renovar'
group by TRUNC(ct.TIME_STAMP,'DD'),PDCO.AGREGATEDOBJECTID, PP.NUMEROPOLIZAINPUT
having COUNT(*)>1