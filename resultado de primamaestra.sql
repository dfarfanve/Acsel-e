 SELECT * OPENITEM o  
 /*SET OPM_MASTEROPENITEMID = 4288992639, o.DATEUSERECIPENT = (select case when POL.PERIODOBASEINPUT is null then  o.DATEUSERECIPENT else  CASE WHEN ADD_MONTHS(TRUNC(TO_DATE(POL.PERIODOBASEINPUT,'YYYY-MM-DD'),'MM'),1)-1 > PD.FINISHDATE  THEN PD.FINISHDATE ELSE ADD_MONTHS(TRUNC(TO_DATE(POL.PERIODOBASEINPUT,'YYYY-MM-DD'),'MM'),1)-1 END  end from policydco pd  inner join PolDesgPersonFactIndividual pol on pol.pk = pd.dcoid where PD.OPERATIONPK = o.OPERATIONPK)  
 */
 WHERE EXISTS (SELECT DISTINCT A.OPENITEMID, A.AMOUNT, A.CURRENCYID, b.PGC_CATEGORY, C.AST_ID, B.AGV_ID  FROM OPENITEM a  INNER JOIN CONTEXTOPERATION CTX ON CTX.ID = A.OPERATIONPK AND CTX.STATUS = 2  INNER JOIN OPENITEMREFERENCE b ON A.OPENITEMID = B.OPENITEMID  AND A.STATUS = 'applied'  AND A.OPM_SUBSTATUS = 'notified'  LEFT JOIN STAG_AGREEMENTVERSION c ON B.AGV_ID = C.AGV_ID  LEFT JOIN STPS_AGREEMENTSTATICDAT d ON C.AST_ID = D.AST_ID  WHERE A.OPM_MASTEROPENITEMID IS NULL  AND b.PGC_CATEGORY IS NOT NULL  AND LENGTH (b.PGC_CATEGORY) > 0  AND a.REFERENCETYPE != 10 AND not exists (select 1 from openitem inopm inner join openitemreference inopr on inopr.openitemid = inopm.openitemid where b.policyid = inopr.policyid and inopm.dty_id = 7612 AND inopm.status not in ('deleted'))  AND a.DOCDATE <= TO_DATE ('30-6-2038', 'dd-MM-RRRR') AND b.OPR_PRODUCTPK = 78009 AND a.OPENITEMID = o.OPENITEMID  AND a.CURRENCYID = 2163 AND b.PGC_CATEGORY = '177Nuevo Sol'  AND b.AGV_ID  = 57169  AND c.AST_ID  = 46729 AND b.POLICYID =130669951)
		 
 UPDATE OPENITEM o  SET OPM_MASTEROPENITEMID = 4288979800 WHERE EXISTS (SELECT DISTINCT A.OPENITEMID, A.AMOUNT, A.CURRENCYID, b.PGC_CATEGORY, C.AST_ID, B.AGV_ID  FROM OPENITEM a  INNER JOIN CONTEXTOPERATION CTX ON CTX.ID = A.OPERATIONPK AND CTX.STATUS = 2  INNER JOIN OPENITEMREFERENCE b ON A.OPENITEMID = B.OPENITEMID  AND A.STATUS = 'applied'  AND A.OPM_SUBSTATUS = 'notified'  LEFT JOIN STAG_AGREEMENTVERSION c ON B.AGV_ID = C.AGV_ID  LEFT JOIN STPS_AGREEMENTSTATICDAT d ON C.AST_ID = D.AST_ID  WHERE A.OPM_MASTEROPENITEMID IS NULL  AND b.PGC_CATEGORY IS NOT NULL  AND LENGTH (b.PGC_CATEGORY) > 0  AND a.REFERENCETYPE != 10 AND not exists (select 1 from openitem inopm inner join openitemreference inopr on inopr.openitemid = inopm.openitemid where b.policyid = inopr.policyid and inopm.dty_id = 7612 AND inopm.status not in ('deleted'))  AND a.DOCDATE <= TO_DATE ('30-6-2038', 'dd-MM-RRRR') AND b.OPR_PRODUCTPK = 73585 AND a.OPENITEMID = o.OPENITEMID  AND a.CURRENCYID = 2123 AND b.PGC_CATEGORY = '65US Dolar'  AND b.AGV_ID  = 52844  AND c.AST_ID  = 42404 AND b.POLICYID =130669951)

 UPDATE OPENITEM o  SET OPM_MASTEROPENITEMID = 4288979919 WHERE EXISTS (SELECT DISTINCT A.OPENITEMID, A.AMOUNT, A.CURRENCYID, b.PGC_CATEGORY, C.AST_ID, B.AGV_ID  FROM OPENITEM a  INNER JOIN CONTEXTOPERATION CTX ON CTX.ID = A.OPERATIONPK AND CTX.STATUS = 2  INNER JOIN OPENITEMREFERENCE b ON A.OPENITEMID = B.OPENITEMID  AND A.STATUS = 'applied'  AND A.OPM_SUBSTATUS = 'notified'  LEFT JOIN STAG_AGREEMENTVERSION c ON B.AGV_ID = C.AGV_ID  LEFT JOIN STPS_AGREEMENTSTATICDAT d ON C.AST_ID = D.AST_ID  WHERE A.OPM_MASTEROPENITEMID IS NULL  AND b.PGC_CATEGORY IS NOT NULL  AND LENGTH (b.PGC_CATEGORY) > 0  AND a.REFERENCETYPE != 10 AND not exists (select 1 from openitem inopm inner join openitemreference inopr on inopr.openitemid = inopm.openitemid where b.policyid = inopr.policyid and inopm.dty_id = 7612 AND inopm.status not in ('deleted'))  AND a.DOCDATE <= TO_DATE ('30-6-2038', 'dd-MM-RRRR') AND b.OPR_PRODUCTPK = 73585 AND a.OPENITEMID = o.OPENITEMID  AND a.CURRENCYID = 2163 AND b.PGC_CATEGORY = '65Nuevo Sol'  AND b.AGV_ID  = 52844  AND c.AST_ID  = 42404 AND b.POLICYID = 130664471)

SELECT *
  FROM OPENITEM o
 WHERE EXISTS
           (SELECT DISTINCT A.OPENITEMID,
                            A.AMOUNT,
                            A.CURRENCYID,
                            b.PGC_CATEGORY,
                            C.AST_ID,
                            B.AGV_ID
              FROM OPENITEM  a
                   INNER JOIN CONTEXTOPERATION CTX
                       ON CTX.ID = A.OPERATIONPK AND CTX.STATUS = 2
                   INNER JOIN OPENITEMREFERENCE b
                       ON     A.OPENITEMID = B.OPENITEMID
                          AND A.STATUS = 'applied'
                          AND A.OPM_SUBSTATUS = 'notified'
                   LEFT JOIN STAG_AGREEMENTVERSION c ON B.AGV_ID = C.AGV_ID
                   LEFT JOIN STPS_AGREEMENTSTATICDAT d ON C.AST_ID = D.AST_ID
             WHERE     b.PGC_CATEGORY IS NOT NULL
                   AND LENGTH (b.PGC_CATEGORY) > 0
                   AND a.REFERENCETYPE != 10
                   AND NOT EXISTS
                           (SELECT 1
                              FROM openitem  inopm
                                   INNER JOIN openitemreference inopr
                                       ON inopr.openitemid = inopm.openitemid
                             WHERE     b.policyid = inopr.policyid
                                   AND inopm.dty_id = 7612
                                   AND inopm.status NOT IN ('deleted'))
                   AND a.DOCDATE <= TO_DATE ('30-6-2038', 'dd-MM-RRRR')
                   AND b.OPR_PRODUCTPK = 73585
                   AND a.OPENITEMID = o.OPENITEMID
                   AND a.CURRENCYID = 2123
                   AND b.PGC_CATEGORY = '65US Dolar'
                   AND b.AGV_ID = 52844
                   AND c.AST_ID = 42404
                   AND b.POLICYID IN (130664292, 130663911));

SELECT *
  FROM OPENITEM o
 WHERE EXISTS
           (SELECT DISTINCT A.OPENITEMID,
                            A.AMOUNT,
                            A.CURRENCYID,
                            b.PGC_CATEGORY,
                            C.AST_ID,
                            B.AGV_ID
              FROM OPENITEM  a
                   INNER JOIN CONTEXTOPERATION CTX
                       ON CTX.ID = A.OPERATIONPK AND CTX.STATUS = 2
                   INNER JOIN OPENITEMREFERENCE b
                       ON     A.OPENITEMID = B.OPENITEMID
                          AND A.STATUS = 'applied'
                          AND A.OPM_SUBSTATUS = 'notified'
                   LEFT JOIN STAG_AGREEMENTVERSION c ON B.AGV_ID = C.AGV_ID
                   LEFT JOIN STPS_AGREEMENTSTATICDAT d ON C.AST_ID = D.AST_ID
             WHERE     b.PGC_CATEGORY IS NOT NULL
                   AND LENGTH (b.PGC_CATEGORY) > 0
                   AND a.REFERENCETYPE != 10
                   AND NOT EXISTS
                           (SELECT 1
                              FROM openitem  inopm
                                   INNER JOIN openitemreference inopr
                                       ON inopr.openitemid = inopm.openitemid
                             WHERE     b.policyid = inopr.policyid
                                   AND inopm.dty_id = 7612
                                   AND inopm.status NOT IN ('deleted'))
                   AND a.DOCDATE <= TO_DATE ('30-6-2038', 'dd-MM-RRRR')
                   AND b.OPR_PRODUCTPK = 73585
                   AND a.OPENITEMID = o.OPENITEMID
                   AND a.CURRENCYID = 2163
                   AND b.PGC_CATEGORY = '65Nuevo Sol'
                   AND b.AGV_ID = 52844
                   AND c.AST_ID = 42404
                   AND b.POLICYID IN (130664371, 130664272))
				   
				   130669951
130669952