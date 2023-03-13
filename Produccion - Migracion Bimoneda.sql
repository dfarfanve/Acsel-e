DECLARE
TYPE ARRAY_OBJECT IS TABLE OF VARCHAR(80) INDEX BY BINARY_INTEGER;
BK_ROWS   ARRAY_OBJECT;
CURSOR CONTROL IS SELECT DISTINCT PRE.NUMEROPOLIZAINPUT FROM INTERSEGURO.PREPOLICY PRE
        JOIN INTERSEGURO.AGREGATEDPOLICY AG ON PRE.STATIC = AG.AGREGATEDPOLICYID
        JOIN INTERSEGURO.PRODUCT PRO ON AG.PRODUCTID = PRO.PRODUCTID
        WHERE PRO.DESCRIPTION IN ('DesgTarjetasIndividual') AND LENGTH(REGEXP_REPLACE(PRE.NUMEROPOLIZAINPUT,'[^-]'))<=1;
BEGIN
	OPEN CONTROL;
    LOOP
		 FETCH CONTROL BULK COLLECT INTO BK_ROWS LIMIT 10000;
         BEGIN
               /* OPENITEMREFERENCE_REDEF */
			FOR I IN 1 .. BK_ROWS.COUNT LOOP
			   UPDATE INTERSEGURO.OPENITEMREFERENCE_REDEF SET OPR_POLICYNUMBER = BK_ROWS(I) || '-1' WHERE OPR_POLICYNUMBER =  BK_ROWS(I);
               END LOOP;
				/* STPO_POLICYASLOGICAL */
               FOR I IN 1 .. BK_ROWS.COUNT LOOP
                   UPDATE INTERSEGURO.STPO_POLICYASLOGICAL SET PAL_POLICYNUMBER = BK_ROWS(I) || '-1' WHERE PAL_POLICYNUMBER =  BK_ROWS(I);
               END LOOP;
			 /* EXT_TCIOPENITEMINFO */
               FOR I IN 1 .. BK_ROWS.COUNT LOOP
                   FOR X IN (SELECT OPENITEMID FROM INTERSEGURO.OPENITEMREFERENCE WHERE OPR_POLICYNUMBER = BK_ROWS(I)) LOOP
                       UPDATE INTERSEGURO.EXT_TCIOPENITEMINFO SET POLICY_NUMBER = BK_ROWS(I) || '-1' WHERE OPENITEMID = X.OPENITEMID;
                   END LOOP;
			END LOOP;
			 /* EXT_INTERFZSAMP */
               FOR I IN 1 .. BK_ROWS.COUNT LOOP
                   FOR X IN (SELECT OPENITEMID FROM INTERSEGURO.OPENITEMREFERENCE WHERE OPR_POLICYNUMBER = BK_ROWS(I)) LOOP
                       UPDATE INTERSEGURO.EXT_INTERFZSAMP SET NUMERO_POLIZA = BK_ROWS(I) || '-1' WHERE OPENITEMID = X.OPENITEMID;
                   END LOOP;
               END LOOP;
			/* OPENITEMREFERENCE */
              FOR I IN 1 .. BK_ROWS.COUNT LOOP
                  UPDATE INTERSEGURO.OPENITEMREFERENCE SET OPR_POLICYNUMBER = BK_ROWS(I) || '-1' WHERE OPR_POLICYNUMBER = BK_ROWS(I);
              END LOOP;
                /* POLIZA */
              FOR I IN 1 .. BK_ROWS.COUNT LOOP
                  UPDATE INTERSEGURO.POLIZA SET NUMEROPOLIZA = BK_ROWS(I) || '-1' WHERE NUMEROPOLIZA = BK_ROWS(I);
              END LOOP;
			
			 /* INTERSEGUROR.POLIZA */
              FOR I IN 1 .. BK_ROWS.COUNT LOOP
                  UPDATE INTERSEGUROR.POLIZA SET NUMEROPOLIZA = BK_ROWS(I) || '-1' WHERE NUMEROPOLIZA = BK_ROWS(I);
             END LOOP;
               /* PREPOLICY */
			FOR I IN 1 .. BK_ROWS.COUNT LOOP
				UPDATE INTERSEGURO.PREPOLICY SET NUMEROPOLIZAINPUT = BK_ROWS(I) || '-1' WHERE NUMEROPOLIZAINPUT = BK_ROWS(I);
			END LOOP;
        END;
        COMMIT;
		EXIT WHEN CONTROL%NOTFOUND;
    END LOOP;
	CLOSE CONTROL;
END;   		