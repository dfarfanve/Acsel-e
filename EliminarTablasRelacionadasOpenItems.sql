SELECT * FROM OPENITEM WHERE OPERATIONPK=205514714

DELETE FROM EXT_RESCUEINFO WHERE OPERATIONPK = 205514714;


DECLARE OpenItem         varchar(12);

    -- Dimencionar le tamaño del array segun el numero de OpenItems a eliminar
    type array_t IS VARRAY(15) OF VARCHAR2(10);
    lista array_t := array_t(   '4119731833',
'4119731834');

BEGIN

    FOR j IN lista.first .. lista.LAST  LOOP
        OpenItem:= lista(j);

        DELETE FROM INTERSEGURO.UAADETAIL WHERE OPENITEMID = OpenItem;
        
        DELETE FROM INTERSEGURO.OPENITEMWARNINGCOLLECTION WHERE OPENITEMID = OpenItem;
        
        DELETE FROM INTERSEGURO.MOVEMENTSENT WHERE OPENITEMID = OpenItem;
        
        DELETE FROM INTERSEGURO.STCA_OPENITEMHISTORY T2      WHERE T2.OPM_ID     = OpenItem;
        
        DELETE FROM INTERSEGURO.OPENITEMREFERENCE T1         WHERE T1.OPENITEMID = OpenItem;
        
        DELETE FROM INTERSEGURO.RI_TECHACC_OISROOTS R1 WHERE R1.OPM_PARENTOPENITEMID  = OpenItem;
        
         DELETE FROM INTERSEGURO.OPENITEM O1                  WHERE O1.PARENTOPENITEMID  = OpenItem;
                 
        DELETE FROM INTERSEGURO.OPENITEM O1                  WHERE O1.APPLIEDTO  = OpenItem;
        
        DELETE FROM INTERSEGURO.OPENITEM T                   WHERE T.OPENITEMID  = OpenItem;        
        
   END LOOP;

COMMIT;

END;

