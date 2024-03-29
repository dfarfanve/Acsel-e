DECLARE
    TYPE ARRAY_OBJECT IS TABLE OF NUMBER
        INDEX BY BINARY_INTEGER;
    OPK_ROWS   ARRAY_OBJECT;
    CURSOR C IS
          SELECT ID FROM CONTEXTOPERATION  WHERE ID NOT in (SELECT ID FROM DEBUG_BK)
		  AND STATUS = 2;
BEGIN
    OPEN C;
    LOOP
        FETCH C BULK COLLECT INTO OPK_ROWS LIMIT 10000;
        BEGIN
            FOR I IN 1 .. OPK_ROWS.LAST SAVE EXCEPTIONS
                UPDATE CONTEXTOPERATION SET STATUS = 1 WHERE ID = OPK_ROWS(I);
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