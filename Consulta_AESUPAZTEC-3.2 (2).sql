SELECT CL.CLAIMNUMBER,                              
       PRP.NUMEROPOLIZAINPUT AS POLICYNUMBER,         
       INFO.*                                                                         
FROM AZTECA_V138.AGREGATEDPOLICY A                                                                
INNER JOIN AZTECA_V138.POLICYDCO P ON A.OPERATIONPK = P.OPERATIONPK                               
INNER JOIN AZTECA_V138.PREPOLICY PRP ON P.DCOID = PRP.PK                 
LEFT JOIN AZTECA_V138.CLAIM CL ON CL.POLICYID = A.AGREGATEDPOLICYID,                              
(SELECT (SELECT CL.CLAIMID                                                            
        FROM AZTECA_V138.CLAIM CL ,AZTECA_V138.PAYMENTORDER PO,AZTECA_V138.CLAIMPAYMENT CP,AZTECA_V138.STNO_PAYMENTNOTIFICATION PN	
                    WHERE CL.CLAIMID = CP.CLAIMID                                     
                    AND PN.NOT_ID = N.NOT_ID                                          
                    AND CP.CLAIMPAYMENTID = PO.CPY_ID                                 
                    AND PO.PAYMENTORDERID = PN.POR_ID) AS CLAIMID,                    
        N.*                                                                           
FROM AZTECA_V138.STNO_NOTIFICATION N                                                              
WHERE N.USC_LOGINASSIGNED = '719954'                                                       
AND N.NOT_STATUS = 0                                                                 
) INFO
WHERE CL.CLAIMID = INFO.CLAIMID
AND CL.CLAIMNUMBER = 'MTAZ-2021-8607' 
ORDER BY INFO.NOC_DATE ASC;