DECLARE
TYPE ARRAY_OBJECT IS TABLE OF VARCHAR(50) INDEX BY BINARY_INTEGER;
BK_ROWS   ARRAY_OBJECT;
CURSOR CONTROL IS SELECT DISTINCT POL.NUMEROPOLIZA FROM INTERSEGUROR.POLIZA POL
	WHERE EXISTS (SELECT PRE.NUMEROPOLIZAINPUT FROM INTERSEGURO.PREPOLICY PRE
        JOIN INTERSEGURO.AGREGATEDPOLICY AG ON PRE.STATIC = AG.AGREGATEDPOLICYID
        JOIN INTERSEGURO.PRODUCT PRO ON AG.PRODUCTID = PRO.PRODUCTID
        WHERE PRO.DESCRIPTION IN ('DesgTarjetasIndividual')) AND LENGTH(REGEXP_REPLACE(POL.numeropoliza,'[^-]'))<=1;
BEGIN
	OPEN CONTROL;
    LOOP
		 FETCH CONTROL BULK COLLECT INTO BK_ROWS LIMIT 1000;
         BEGIN
                /* POLIZA */
				FOR I IN 1 .. BK_ROWS.COUNT LOOP
				   UPDATE INTERSEGUROR.POLIZA SET NUMEROPOLIZA = BK_ROWS(I)|| '-1' WHERE NUMEROPOLIZA =  BK_ROWS(I);
                END LOOP;
                
        END;
        COMMIT;
		EXIT WHEN CONTROL%NOTFOUND;
    END LOOP;
	CLOSE CONTROL;
END;