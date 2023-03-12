
-- UPDATE app_vida.polinversion  set  apipagoinput ='No' , apipagovalue = '0.0' where pk in (
UPDATE app_vida.polinversion  set  apipagoinput ='Si' , apipagovalue = '1.0' where pk in (
SELECT   pi.pk   -- SQ_STPS_BATCHPR.NEXTVAL, co.id, '2015-10-06_MovementToAcselX',0  
FROM POLICYDCO PDCO, AGREGATEDPOLICY AP, PRODUCT P, CONTEXTOPERATION CO, EVENTDCO EDCO, EVENTTYPE ET  , prepolicy pr, -- openitem oi,
app_vida.polinversion pi --  ,  VIDAINVERSION WS  
WHERE PDCO.AGREGATEDOBJECTID=AP.AGREGATEDPOLICYID 
and  pr.pk = pdco.dcoid
AND AP.PRODUCTID=P.PRODUCTID  
AND CO.ID=PDCO.OPERATIONPK  
and pr.pk = pi.pk
-- AND TP.CONCEPT = 'DescuentoPrima'
AND PDCO.OPERATIONPK=EDCO.OPERATIONPK 
AND EDCO.EVENTTYPEID=ET.EVENTTYPEID  
-- and oi.operationpk = CO.id
-- and oi.dty_id = 7332
AND P.DESCRIPTION = 'FlexiVida'
 AND ET.DESCRIPTION  IN ('Aceptar','Endosar',  'Pagar') -- ,'Pagar','Endosar', 'EndosoAut') 
-- AND ET.DESCRIPTION  IN ('Pagar')
-- and co.id = ap.operationpk
-- and pr.frecuenciapagoinput = 'Mensual'
--   and pi.apipagoinput = 'Si'
-- and co.ending_date >= TO_DATE('20-06-2020','dd-mm-yyyy') 
AND CO.STATUS =  2 
and p.pro_isactive = 1 
AND AP.OPERATIONPK = CO.ID 
 -- and pr.numeropolizainput in  ( 
and pr.numeropolizainput  in (
-- '72785705',
'90086716',
'79110986',
'74213506',
'74312384',
'90021713' )
  );




SELECT   pi.pk  , pr.numeropolizainput, ET.DESCRIPTION, apipagoinput  -- SQ_STPS_BATCHPR.NEXTVAL, co.id, '2015-10-06_MovementToAcselX',0  
FROM POLICYDCO PDCO, AGREGATEDPOLICY AP, PRODUCT P, CONTEXTOPERATION CO, EVENTDCO EDCO, EVENTTYPE ET  , prepolicy pr, -- openitem oi,
app_vida.polinversion pi --  ,  VIDAINVERSION WS  
WHERE PDCO.AGREGATEDOBJECTID=AP.AGREGATEDPOLICYID 
and  pr.pk = pdco.dcoid
AND AP.PRODUCTID=P.PRODUCTID  
AND CO.ID=PDCO.OPERATIONPK  
and pr.pk = pi.pk
-- AND TP.CONCEPT = 'DescuentoPrima'
AND PDCO.OPERATIONPK=EDCO.OPERATIONPK 
AND EDCO.EVENTTYPEID=ET.EVENTTYPEID  
-- and oi.operationpk = CO.id
-- and oi.dty_id = 7332
AND P.DESCRIPTION = 'FlexiVida'
 AND ET.DESCRIPTION  IN ('Aceptar','Endosar',  'Pagar') -- ,'Pagar','Endosar', 'EndosoAut') 
-- AND ET.DESCRIPTION  IN ('Pagar')
-- and co.id = ap.operationpk
-- and pr.frecuenciapagoinput = 'Mensual'
--   and pi.apipagoinput = 'Si'
-- and co.ending_date >= TO_DATE('20-06-2020','dd-mm-yyyy') 
AND CO.STATUS =  2 
and p.pro_isactive = 1 
AND AP.OPERATIONPK = CO.ID 
and pr.numeropolizainput  in (
-- '72785705',
'90086716',
'79110986',
'74213506',
'74312384',
'90021713' ) ;
