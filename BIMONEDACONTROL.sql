DECLARE
    TYPE ARRAY_OBJECT IS TABLE OF DEBUG_BK%ROWTYPE
        INDEX BY BINARY_INTEGER;
    BK_ROWS   ARRAY_OBJECT;
    CURSOR C IS
        SELECT PDCO.OPERATIONPK,PDCO.AGREGATEDOBJECTID,P.PRODUCTID
		FROM POLICYDCO PDCO
		JOIN CONTEXTOPERATION CO ON PDCO.OPERATIONPK = CO.ID AND CO.STATUS = 2
		JOIN STATE ST ON PDCO.STATEID = ST.STATEID AND ST.DESCRIPTION IN ( 'Emitida')
		JOIN APP_VIDA.LIFECYCLE LC ON LC.LIFECYCLEID = ST.LIFECYCLEID
		JOIN APP_VIDA.AGREGATEDPOLICYTYPE APT ON APT.LIFECYCLEID =LC.LIFECYCLEID
		JOIN PRODUCT P ON P.PRODUCTID = APT.PRODUCTID AND P.DESCRIPTION IN ( 
								'AEProteccionAccidental', 
								'DesgravamenBBVADesempleo',
								'FlexiVida',
								'VIProteccionFamiliar',
								'VIVidaAddOns',
								'VIVidaAsisDentIBK',
								'VIVidaCapitalPrimaUnica',
								'VIVidaIdeal',
								'VidaLey') 
		WHERE PDCO.INITIALDATE >= TO_DATE('2019-01-01', 'YYYY-MM-DD HH24:MI:SS')
        AND NOT EXISTS (SELECT 1 FROM DEBUG_BK WHERE ITEM = PDCO.AGREGATEDOBJECTID);
BEGIN
    OPEN C;
    LOOP
        FETCH C BULK COLLECT INTO BK_ROWS LIMIT 1000;
        BEGIN
            FORALL I IN 1 .. BK_ROWS.LAST SAVE EXCEPTIONS
                INSERT INTO DEBUG_BK
                VALUES BK_ROWS (I);
        EXCEPTION
            WHEN OTHERS
                THEN
                    DBMS_OUTPUT.PUT_LINE (SQLERRM);
        END;
        EXIT WHEN C%NOTFOUND;
        COMMIT;
    END LOOP;
    CLOSE C;
EXCEPTION
    WHEN OTHERS
        THEN
            DBMS_OUTPUT.PUT_LINE (SQLERRM);
END;