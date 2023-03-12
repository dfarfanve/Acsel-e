SELECT X.NUM_POLIZA,X.ID AS OPERACION,TRUNC(X.INITIAL_DATE,'DD') AS FECHA_DESDE,TRUNC(X.ENDING_DATE,'DD') AS FECHA_HASTA, TRUNC(X.TIME_STAMP,'DD') AS FECHA_OPER,user_name as ORIGEN,x.evento
FROM (  SELECT (SELECT COUNT(OPENITEMID) FROM INTERSEGURO.OPENITEM OI WHERE OI.OPERATIONPK = P.OPERATIONPK) AS TOTAL_IO,
               (SELECT NUMEROPOLIZAINPUT FROM INTERSEGURO.PREPOLICY WHERE STATIC = CO.ITEM AND ROWNUM = 1) AS NUM_POLIZA,E2.DESCRIPTION AS EVENTO,
               CO.*
        FROM INTERSEGURO.CONTEXTOPERATION CO
        INNER JOIN INTERSEGURO.POLICYDCO P on CO.ID = P.OPERATIONPK AND CO.STATUS = 2
        INNER JOIN INTERSEGURO.EVENTDCO E on P.IDDCOEVENT = E.IDDCOEVENT
        INNER JOIN INTERSEGURO.EVENTTYPE E2 ON E2.EVENTTYPEID = E.EVENTTYPEID
        WHERE E2.DESCRIPTION in ('GenerarPrima','Emitir')
        AND
        P.AGREGATEDOBJECTID IN (   SELECT AP.AGREGATEDPOLICYID
                                       FROM INTERSEGURO.PRODUCT P
                                                INNER JOIN INTERSEGURO.AGREGATEDPOLICY AP on P.PRODUCTID = AP.PRODUCTID
                                       WHERE P.DESCRIPTION IN ('VidaProtegida',
'EducGarantizadaPlusNew',
'TemporalconDevolucion',
'VidaTotalProtegida',
'EducacionGarantizada',
'Temporal',
'SeguroAccidentes',
'VidaEntera',
'SiempreSeguro',
'EducacionGarantizadaPlus',
'DotalSimple',
'PlanGarantizado')))X
WHERE X.TOTAL_IO = 0 and user_name<>'migration' --and user_name<>'system';