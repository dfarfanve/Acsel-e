-- Consultar polizas por producto
SELECT CO.item, pr.numeropolizainput, co.id operationpk, et.description evento , p.description Producto,
S.CODIGOPLANINPUT codPlan, DESCRIPCIONPLANINPUT planDescription , PR.VIGENCIAINPUT VIGENCIA, MONEDAINPUT MONEDA, CO.ENDING_DATE
FROM POLICYDCO PDCO, AGREGATEDPOLICY AP, CONTEXTOPERATION CO, EVENTDCO EDCO, EVENTTYPE ET  , prepolicy pr , -- cobertura cob, CoverageDCO cdco,
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
AND P.DESCRIPTION IN ('DesgravamenBBVADesempleo') --('DesgravamenBBVATC', 'DesgravamenBANBIFTC','DesgravamenBBVATC','DesgravamenFORUM')
--  AND et.description IN ('Renovacion') 
 AND CO.ENDING_DATE > to_date('01/01/2019','dd/mm/yyyy')
--  AND CO.ENDING_DATE < to_date('20/03/2020','dd/mm/yyyy')
AND CO.STATUS =  2   
and co.id = ap.operationpk
and ROWNUM < 30
order by CO.id desc; 


-- Productos de Desgravamen
select equivalence from APP_VIDA.rimac_equivalencies 
where property ='Producto';
