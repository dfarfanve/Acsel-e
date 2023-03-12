begin
  sys.dbms_scheduler.create_job(job_name            => 'INTERSEGURO.JOB_TEST_INI_2022_125',
                                job_type            => 'PLSQL_BLOCK',
                                job_action          => 'DECLARE
  TYPE OPENITEMS_IDS IS TABLE OF OPENITEM.OPENITEMID%TYPE
                INDEX BY PLS_INTEGER; 
      OILIST OPENITEMS_IDS;
    
      CURSOR C IS
    
    SELECT OI.OPENITEMID FROM OPENITEM OI
    JOIN OPENITEMREFERENCE OIR ON OIR.OPENITEMID = OI.OPENITEMID
    WHERE OI.OPM_MASTEROPENITEMID IS NULL AND OI.DTY_ID <> 7612 AND OI.STATUS NOT IN (''deleted'') AND OIR.OPR_PRODUCTPK = 73585;
      
  BEGIN
      OPEN C;
      LOOP
          FETCH C BULK COLLECT INTO OILIST LIMIT 10000;
          BEGIN
              FORALL I IN 1 .. OILIST.LAST SAVE EXCEPTIONS
                  UPDATE OPENITEM SET OPM_MASTEROPENITEMID = 0 WHERE OPENITEMID = OILIST(I) ;
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
  END;',
                                start_date          => to_date('10-11-2022 13:00:00', 'dd-mm-yyyy hh24:mi:ss'),
                                repeat_interval     => '',
                                end_date            => to_date(null),
                                job_class           => '',
                                enabled             => false,
                                auto_drop           => false,
                                comments            => '');
end;
