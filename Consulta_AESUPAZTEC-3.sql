SELECT CL.CLAIMNUMBER,                              
       PRP.NUMEROPOLIZAINPUT AS POLICYNUMBER,         
       INFO.NOT_ID,             
	   INFO.NOC_ID,             
	   INFO.NOT_TITLE,          
	   INFO.NOT_BODY,         
	   INFO.NOC_DATE,          
	   INFO.USC_LOGIN,          
	   INFO.USC_LOGINASSIGNED,
	   INFO.NOT_STATUS, 
	   INFO.COR_ID,             
	   INFO.APO_ID,             
	   INFO.NOT_DUEDATE,        
	   INFO.DCO_ID,             
	   INFO.STATE_DCO_ID                                                                          
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
        N.N.NOT_ID,             
		N.NOC_ID,             
		N.NOT_TITLE,          
		N.NOT_BODY,         
		N.NOC_DATE,          
		N.USC_LOGIN,          
		N.USC_LOGINASSIGNED,
		N.NOT_STATUS, 
		N.COR_ID,             
		N.APO_ID,             
		N.NOT_DUEDATE,        
		N.DCO_ID,             
		N.STATE_DCO_ID                                                                            
FROM AZTECA_V138.STNO_NOTIFICATION N                                                              
WHERE N.USC_LOGINASSIGNED = '719954'                                                       
AND N.NOT_STATUS = 0                                                                 
) INFO
WHERE CL.CLAIMID = INFO.CLAIMID
AND CL.CLAIMNUMBER = 'MTAZ-2021-8607' 
ORDER BY INFO.NOC_DATE ASC;


