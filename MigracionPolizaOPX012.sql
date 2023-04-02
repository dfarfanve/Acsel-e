DECLARE
TYPE ARRAY_OBJECT IS TABLE OF INTERSEGURO.BIMONEDACONTROL%ROWTYPE INDEX BY BINARY_INTEGER;
BK_ROWS   ARRAY_OBJECT;
CURSOR CONTROL IS SELECT DISTINCT POL.NUMEROPOLIZA POLICYNUMBER
			FROM INTERSEGURO.AGREGATEDPOLICY AG
	JOIN INTERSEGURO.PRODUCT PRO ON AG.PRODUCTID = PRO.PRODUCTID
	JOIN INTERSEGURO.PREPOLICY PRE ON PRE.STATIC = AG.AGREGATEDPOLICYID
	JOIN INTERSEGURO.POLIZA POL ON POL.DCOID = PRE.PK
	WHERE PRO.DESCRIPTION IN ('DesgTarjetasIndividual');
BEGIN
	OPEN CONTROL;
    LOOP
		 FETCH CONTROL BULK COLLECT INTO BK_ROWS LIMIT 1000;
         BEGIN
                /* POLIZA */
				FOR I IN 1 .. BK_ROWS.COUNT LOOP
				   UPDATE INTERSEGURO.POLIZA SET NUMEROPOLIZA = BK_ROWS(I).POLICYNUMBER || '-1' WHERE NUMEROPOLIZA =  BK_ROWS(I).POLICYNUMBER;
                END LOOP;
        END;
        COMMIT;
		EXIT WHEN CONTROL%NOTFOUND;
    END LOOP;
	CLOSE CONTROL;
END;