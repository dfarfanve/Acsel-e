SET SERVER OUTPUT ON;

exec dbms_output.enable(100000000);

DECLARE
tableName VARCHAR2(20000);
colName VARCHAR2(20000);
lastNumber NUMBER(12,0);
maxID NUMBER(12,0);
column_name VARCHAR2(20000);
script VARCHAR2(20000);

BEGIN
    DBMS_OUTPUT.put_line ('.............');
    FOR sequences IN (SELECT * FROM user_sequences) LOOP
        maxID:=0;
        lastNumber:=0;
        lastNumber := sequences.LAST_NUMBER;
        tableName :=  SUBSTR(sequences.SEQUENCE_NAME,4);
        DBMS_OUTPUT.put_line ('TABLE = ' || tableName);

BEGIN
            script :=  'select  column_name from  user_constraints a, user_cons_columns b where constraint_type=''P''
                             and a.constraint_name=b.constraint_name and a.table_name='''||tableName||'''';
            DBMS_OUTPUT.put_line ('script prueba= ' || script);

            execute immediate script into column_name; script := 'SELECT MAX(' || column_name || ')  FROM ' || tableName; 
            execute immediate script into maxID; 
            DBMS_OUTPUT.put_line ('Nombre de la Columna = ' || column_name);
            DBMS_OUTPUT.put_line ('maxID  = ' || maxID || ' lastNumber  = ' || lastNumber); 
            IF (maxID > lastNumber) THEN 
                DBMS_OUTPUT.put_line ('maxID  = ' || maxID || ' lastNumber  = ' || lastNumber); 
                DBMS_OUTPUT.put_line ('SEQUENCIA DESINCRONIZADA  = ' || tableName); 
            END IF;
            
            ---- 
        EXECUTE IMMEDIATE 'DROP SEQUENCE SQ_'|| tableName;

        EXECUTE IMMEDIATE 'CREATE SEQUENCE SQ_'|| tableName ||' 
        INCREMENT BY 1 
        START WITH '|| (NVL(maxID,0) + 1) ||
        'MAXVALUE 9999999999999999999999999999
        MINVALUE 1
        NOCYCLE
        CACHE 20
        ORDER' ;
      dbms_output.put_line('Secuencia SQ_'|| tableName||' recreada.');

----    
            
            EXCEPTION
            WHEN others THEN null;
         END;   
     
        END LOOP;

        
        
END; 

