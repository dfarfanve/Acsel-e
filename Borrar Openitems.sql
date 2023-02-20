DECLARE

  OpenItem         varchar(12);

  -- Dimencionar le tamaño del array segun el numero de OpenItems a eliminar
  type array_t IS VARRAY(2) OF VARCHAR2(10);
  lista array_t := array_t(	'4122011584','4121990233');


BEGIN

  FOR j IN lista.first .. lista.LAST  LOOP
    OpenItem:= lista(j);


    DELETE FROM INTERSEGURO.STCA_OPENITEMHISTORY T2      WHERE T2.OPM_ID     = OpenItem;
    DELETE FROM INTERSEGURO.OPENITEMREFERENCE T1         WHERE T1.OPENITEMID = OpenItem;
    DELETE FROM INTERSEGURO.OPENITEMWARNINGCOLLECTION W1 WHERE W1.OPENITEMID = OpenItem;
    DELETE FROM INTERSEGURO.UAADETAIL U1                 WHERE U1.OPENITEMID = OpenItem;
    DELETE FROM INTERSEGURO.UAADETAIL U1                 WHERE U1.OPENITEMID   IN(
                                                                                 SELECT OP.OPENITEMID FROM INTERSEGURO.OPENITEM OP WHERE OP.APPLIEDTO  = OpenItem
                                                                                 );
    DELETE FROM INTERSEGURO.MOVEMENTSENT M1              WHERE M1.OPENITEMID = OpenItem;
    DELETE FROM INTERSEGURO.STPR_BATCHPROCESSOPENITEM R1 WHERE R1.OPM_ID     = OpenItem;
    DELETE FROM INTERSEGURO.OPENITEM O1                  WHERE O1.APPLIEDTO  = OpenItem;
    DELETE FROM INTERSEGURO.OPENITEM T                   WHERE T.OPENITEMID  = OpenItem;

    dbms_output.put_line('======================================================');
    dbms_output.put_line('OpenItem: [ ' || OpenItem || ' ]  Eliminado!');
    dbms_output.put_line('======================================================');

  END LOOP;

  COMMIT;