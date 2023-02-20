CREATE OR REPLACE PACKAGE INT_DESG_JOB AS
  /******************************************************************************
     NAME:       INT_DESG_JOB
     PURPOSE:

     REVISIONS:
     Ver        Date        Author           Description
     ---------  ----------  ---------------  ------------------------------------
     1.0        05/10/2017      Julio       1. Creacion del Paquete
     2.0        04/11/2017      Julio       2. Movidas las funciones: GET_DESG_CODE y GET_DESG_NAMEBYCODE desde el paquete INT_UTIL
     3.0        13/11/2017      Julio       3. Creacion del Paquete en la BD 126.26.3.92:5560 - INTERSEGURO
     4.0        22/12/2017      Julio       4. FIX error al INSERTAR EN LA TABLA object_tmp en el procedimiento SET_NUM_ERRORS_DESG_PROCESS
     5.0        22/12/2017      Julio       5. Se modifico el procedimiento GET_SUBPRODUCT_CODE , ahora el valor saldra de la tabla TDSubProducDesgInd.
     6.0        26/12/2017      Julio       6. Se agrego el campo ID_PROCESO a la tabla INTERMEDIO_DESGRAVAMEN , para asociarlo al LOG [tabla EXT_LOGDESGRAVAMEN].
     7.0        14/02/2018      Israel      7. Se agregaron los campos CORRELATIVODPS y CORRELATIVODPS_CY.
     8.0        10/05/2018      Israel      8. Se agrega el campo FECHA_DESEMBOLSO.
     9.0        07/12/2018      Jonathan    9. Se modifica el procedimiento SET_NUM_ERRORS_DESG_PROCESS agregando a la consulta los join con eventDco y eventype, pasando el parametro eventPeriodico
  ******************************************************************************/
  PROCEDURE PROCESS_DESGRAVAMEN_INTERMEDIO(p_parser_name IN VARCHAR2, p_appointmentid IN NUMBER, p_user IN VARCHAR2, o_ids OUT VARCHAR2);
  /***************************************************************************/
  PROCEDURE LLENAR_INT_DESG_PROCESS(p_idproceso IN NUMBER);
  /***************************************************************************/
  PROCEDURE SET_NUM_ERRORS_DESG_PROCESS(p_v_idprocess IN NUMBER);
  /***************************************************************************/
  PROCEDURE GENERAR_HEADER_ASL_DESGRAVAMEN(p_idproceso IN NUMBER, p_product_name IN VARCHAR2, p_event IN VARCHAR2, p_codevento IN NUMBER,
                                           p_periodo IN VARCHAR, p_cuenta IN NUMBER, p_appointmentid IN NUMBER, p_pah OUT STPO_POLICYASLHEADER%ROWTYPE);
  /***************************************************************************/
  PROCEDURE GENERAR_LOGICALASL_DESGRAVAMEN(p_idproceso IN NUMBER, p_parser_name IN VARCHAR2,
                                           p_product_name IN VARCHAR2, p_event IN VARCHAR2, p_codevento IN NUMBER, p_periodo IN DATE, p_pah IN STPO_POLICYASLHEADER%ROWTYPE, p_user IN VARCHAR2);
  /***************************************************************************/
  PROCEDURE LOGS(p_idproceso IN NUMBER, p_header IN NUMBER, p_codproducto IN VARCHAR2, p_codevento IN NUMBER, p_mensaje IN VARCHAR2);
  /***************************************************************************/
  FUNCTION GET_FIRSTPART_NUMPOL(p_product_name IN VARCHAR2, p_numacuerdo IN VARCHAR2, p_subproduct IN VARCHAR2, p_canal IN VARCHAR2) RETURN VARCHAR2 RESULT_CACHE;
  /***************************************************************************/
  FUNCTION IS_COLECTIVO(p_product_name IN VARCHAR2) RETURN BOOLEAN RESULT_CACHE;
  /***************************************************************************/
  FUNCTION EVAL_COLECTIVO(p_product_name IN VARCHAR2) RETURN NUMBER RESULT_CACHE;
  /***************************************************************************/
  FUNCTION GET_PRODUCT_CODE(p_product_name IN VARCHAR2) RETURN VARCHAR2 RESULT_CACHE;
  /***************************************************************************/
  FUNCTION GET_SUBPRODUCT_CODE(p_product_name IN VARCHAR2, p_subproduct IN VARCHAR2) RETURN VARCHAR2 RESULT_CACHE;
  /***************************************************************************/
  FUNCTION GET_CANAL_CODE(p_canal IN VARCHAR2) RETURN VARCHAR2 RESULT_CACHE;
  /***************************************************************************/
  PROCEDURE UPDATE_INTERMEDIO_DESGRAVAMEN(p_idproceso IN NUMBER);
  /***************************************************************************/
  FUNCTION GET_DESG_CODE ( p_product IN VARCHAR2) RETURN VARCHAR2 RESULT_CACHE;
  /***************************************************************************/
  FUNCTION GET_DESG_NAMEBYCODE ( p_code IN VARCHAR2) RETURN VARCHAR2 RESULT_CACHE;
  /***************************************************************************/
  FUNCTION GET_EVENTO_PERIODICO ( p_product IN VARCHAR2) RETURN VARCHAR2 RESULT_CACHE;
  /***************************************************************************/
  PROCEDURE SET_EVENT_COL(p_idproceso IN NUMBER);
  /***************************************************************************/
  FUNCTION GET_LASTPART_NUMPOL(p_product_name IN VARCHAR2,p_moncom IN VARCHAR2) RETURN VARCHAR2 RESULT_CACHE;
END INT_DESG_JOB;
/
CREATE OR REPLACE PACKAGE BODY INT_DESG_JOB AS
  /** PROCESS_DESGRAVAMEN_INTERMEDIO *********************************************/
  PROCEDURE PROCESS_DESGRAVAMEN_INTERMEDIO(p_parser_name IN VARCHAR2, p_appointmentid IN NUMBER, p_user IN VARCHAR2, o_ids OUT VARCHAR2) IS
    CURSOR c_cuenta IS
      SELECT count(*) AS cuenta, PRODUCTO, EVENTO_APLICAR, PERIODO_BASE FROM INT_DESG_PROCESS
      WHERE NUM_ERRORS = 0 GROUP BY PRODUCTO, EVENTO_APLICAR, PERIODO_BASE
      ORDER BY PERIODO_BASE, EVENTO_APLICAR, PRODUCTO; -- Podria agruparlos por al HeaderId
    v_product_name VARCHAR2(100);
    v_event_name VARCHAR2(70);
    v_pah STPO_POLICYASLHEADER%ROWTYPE;
    v_idproceso NUMBER := SQ_HELP.GET_SQ('SEQ_IMP_DESG_PROCESO');  -- con esto proceso unicamente con este numero
    v_eventPeriodico VARCHAR2(15);
    v_codeevent NUMBER;
    BEGIN
      o_ids := NULL;
      LOGS(v_idproceso, NULL, NULL, NULL, 'Inicio procedimiento ...');
      SET_EVENT_COL(v_idproceso);
      LLENAR_INT_DESG_PROCESS(v_idproceso);
      SET_NUM_ERRORS_DESG_PROCESS(v_idproceso);
      -- Procesa cada grupo PRODUCTO/EVENTO/PERIODO_BASE ordenados por PERIODO_BASE/EVENTO/Producto one at a time
      FOR r_cuenta IN c_cuenta LOOP
        BEGIN
          v_product_name := r_cuenta.PRODUCTO;
          v_codeevent := r_cuenta.evento_aplicar;
          v_eventPeriodico  := GET_EVENTO_PERIODICO(r_cuenta.PRODUCTO);
          SELECT DECODE(r_cuenta.evento_aplicar, 0, 'Emitir', 1, v_eventPeriodico, 2, 'Cancelar', NULL) INTO v_event_name FROM DUAL;
          GENERAR_HEADER_ASL_DESGRAVAMEN( v_idproceso, v_product_name, v_event_name, v_codeevent,
                                          TO_CHAR(r_cuenta.PERIODO_BASE, 'MM-YYYY'),r_cuenta.cuenta, p_appointmentid, v_pah );
          GENERAR_LOGICALASL_DESGRAVAMEN( v_idproceso, p_parser_name, v_product_name, v_event_name, v_codeevent,
                                          r_cuenta.PERIODO_BASE, v_pah, p_user );
          IF o_ids IS NULL THEN o_ids := v_pah.PALH_PK; ELSE o_ids := o_ids || ',' ||v_pah.PALH_PK; END IF;
          EXCEPTION
          WHEN OTHERS THEN
          ROLLBACK;
          LOGS(v_idproceso, NULL, GET_DESG_CODE(v_product_name), v_codeevent, 'Error en Iteraccion: ' || SUBSTRB(SQLERRM, 1, 500));
        END;
      END LOOP;
      UPDATE_INTERMEDIO_DESGRAVAMEN(v_idproceso);
      LOGS(v_idproceso, NULL, NULL, NULL, 'Finalizo procedimiento...');
      EXCEPTION
      WHEN OTHERS THEN
      ROLLBACK; -- sera por el Proceso
      LOGS(v_idproceso, NULL, NULL, NULL, 'Error General: ' || SUBSTRB(SQLERRM, 1, 500));
      RAISE;
    END PROCESS_DESGRAVAMEN_INTERMEDIO;
  /* LLENAR_INT_DESG_PROCESS ******************************************************************************************************/
  PROCEDURE LLENAR_INT_DESG_PROCESS(p_idproceso IN NUMBER)
  IS
    v_sql_base VARCHAR2(32767);
    v_count NUMBER;
    BEGIN
      v_sql_base := 'TRUNCATE TABLE INT_DESG_PROCESS';
      LOGS(p_idproceso, NULL, NULL, NULL, 'Inicia Trucate de INT_DESG_PROCESS ....');
      EXECUTE IMMEDIATE v_sql_base;
      LOGS(p_idproceso, NULL, NULL, NULL, 'Inicia LLena a INT_DESG_PROCESS desde INTERMEDIO_DESGRAVAMEN ....');
      INSERT INTO INT_DESG_PROCESS
      (ID_CORRELATIVO, ARCHIVO_TRAMA, EVENTO_APLICAR, PRIMER_NOMBRE, SEGUNDO_NOMBRE, APELLIDO_PATERNO, APELLIDO_MATERNO,
       TIPO_DOCUMENTO, NUMERO_DOCUMENTO, FECHA_NACIMIENTO, DIRECCION, TELEFONO, MONEDA, FECHA_INICIO_VIGENCIA, FECHA_FIN_VIGENCIA,
       NUMERO_CERTIFICADO, NUMERO_POLIZA, PRIMA_ARCHIVO, IMPORTE_CREDITO, TASA_SEGURO, CODIGO_VENDEDOR, SALDO_CREDITO, PRODUCTO,
       SUB_PRODUCTO, CODIGO_UNICO_CLIENTE, NRO_CUOTA, PLAZO, NRO_TARJETA, MOTIVO, TIPO_POLIZA, SUB_PRODUCTO_PLAN, TIPO_ASEGURADO,
       CODDEPARTAMENTO, CODPROVINCIA, CODDISTRITO, INDICADOR_PE, AGENCIA, NUMERO_CERTIFICADO_ANT, CORREO_ELECTRONICO,
       PRIMER_NOMBRE_CY, SEGUNDO_NOMBRE_CY, APELLIDO_PATERNO_CY, APELLIDO_MATERNO_CY, TIPO_DOCUMENTO_CY, NUMERO_DOCUMENTO_CY,
       FECHA_NACIMIENTO_CY, SEXO_CY, PORC_SOBREPRIMA, PORC_SOBREPRIMA_CY, MIL_EXTRAPRIMA, MIL_EXTRAPRIMA_CY, SEXO_TITULAR, FECHA_CANCELACION,
       PERIODO_BASE, NUM_POLIZA, CORRELATIVODPS, CORRELATIVODPS_CY, FECHA_DESEMBOLSO,SALDO_PROMEDIO,SEXO_ASEG,TASA_CREDITO,CUOTAS_PAG,CUOTAS_PEND,NUM_ERRORS)
        SELECT
          A.ID_CORRELATIVO, A.ARCHIVO_TRAMA, A.EVENTO_APLICAR, A.PRIMER_NOMBRE, A.SEGUNDO_NOMBRE, A.APELLIDO_PATERNO, A.APELLIDO_MATERNO, A.TIPO_DOCUMENTO, A.NUMERO_DOCUMENTO, A.FECHA_NACIMIENTO, A.DIRECCION, A.TELEFONO, A.MONEDA, A.FECHA_INICIO_VIGENCIA, A.FECHA_FIN_VIGENCIA, A.NUMERO_CERTIFICADO, A.NUMERO_POLIZA, A.PRIMA_ARCHIVO, A.IMPORTE_CREDITO, A.TASA_SEGURO, A.CODIGO_VENDEDOR, A.SALDO_CREDITO, A.PRODUCTO, A.SUB_PRODUCTO, A.CODIGO_UNICO_CLIENTE, A.NRO_CUOTA, A.PLAZO, A.NRO_TARJETA, A.MOTIVO, A.TIPO_POLIZA, A.SUB_PRODUCTO_PLAN, A.TIPO_ASEGURADO, A.CODDEPARTAMENTO, A.CODPROVINCIA, A.CODDISTRITO,
          DECODE(A.INDICADOR_PE, 'S', 'Si', 'No'), A.AGENCIA, A.NUMERO_CERTIFICADO_ANT, A.CORREO_ELECTRONICO, A.PRIMER_NOMBRE_CY, A.SEGUNDO_NOMBRE_CY, A.APELLIDO_PATERNO_CY, A.APELLIDO_MATERNO_CY, A.TIPO_DOCUMENTO_CY,
          A.NUMERO_DOCUMENTO_CY, A.FECHA_NACIMIENTO_CY, A.SEXO_CY, REPLACE(a.PORC_SOBREPRIMA, '%',''), REPLACE(a.PORC_SOBREPRIMA_CY, '%',''), REPLACE(a.MIL_EXTRAPRIMA, '%',''), REPLACE(a.MIL_EXTRAPRIMA_CY, '%',''), SEXO_TITULAR, FECHA_CANCELACION,
          TO_DATE (A.PERDIODO_BASE, 'MM-YYYY') AS PERIODO_BASE,
          INT_DESG_JOB.GET_FIRSTPART_NUMPOL(PRODUCTO, NUMERO_POLIZA, SUB_PRODUCTO, TIPO_POLIZA) || '-' || a.NUMERO_CERTIFICADO || INT_DESG_JOB.GET_LASTPART_NUMPOL(PRODUCTO,
          A.MONCOM) NUM_POLIZA,
          CORRELATIVODPS, CORRELATIVODPS_CY, FECHA_DESEMBOLSO,SALDO_PROMEDIO, SEXO_ASEG,TASA_CREDITO,CUOTAS_PAG,CUOTAS_PEND,
          CASE WHEN A.EVENTO_APLICAR IS NULL OR A.EVENTO_APLICAR < 0 OR A.EVENTO_APLICAR > 2 THEN 1 ELSE 0 END +  --evento_invalido,
          NVL2(LENGTH(TRIM(A.PRODUCTO)), 0, 1) +              --prod_nulo
          NVL2(LENGTH(TRIM(A.NUMERO_POLIZA)), 0, 1) +         --pol_nulo
          NVL2(LENGTH(TRIM(A.NUMERO_CERTIFICADO)), 0, 1) +    --cert_nulo
          NVL2(LENGTH(TRIM(A.PERDIODO_BASE)), 0, 1) +         --periodoBase_nulo
          CASE WHEN A.EVENTO_APLICAR = 0 THEN
            NVL2(LENGTH(TRIM(A.FECHA_INICIO_VIGENCIA)), 0, 1) + NVL2(LENGTH(TRIM(A.FECHA_FIN_VIGENCIA)), 0, 1)
          WHEN A.EVENTO_APLICAR = 2 THEN
            NVL2(LENGTH(TRIM(A.FECHA_CANCELACION)), 0, 1)
          ELSE
            0
          END + --fecini_nulol O fecfin_nulol [EMISION] O fechaCancelacion_nulo [CANCELACION]
          ((COUNT(1) over (partition by a.NUMERO_POLIZA, a.NUMERO_CERTIFICADO, a.MONCOM, a.PERDIODO_BASE))-1) +                --pol_duplicado
          --((count(1) OVER (PARTITION BY A.CORRELATIVODPS))-1) +
          CASE WHEN INT_DESG_JOB.EVAL_COLECTIVO(A.PRODUCTO) = 1 THEN
            0
          ELSE
            NVL2(LENGTH(TRIM(A.SUB_PRODUCTO)), 0, 1) + NVL2(LENGTH(TRIM(A.TIPO_POLIZA)), 0, 1)
          END -- subProducto_nulo O codigoCanal_nulo
            AS NUM_ERRORS
        FROM INTERMEDIO_DESGRAVAMEN A
        WHERE A.IND_CARGADO IS NULL AND A.ASL_LOGICAL_PK IS NULL;
      LOGS(p_idproceso, NULL, NULL, NULL, 'Total de Registros Insertados a INT_DESG_PROCESS: '|| TO_CHAR(SQL%ROWCOUNT));
      select count(1) into v_count from INT_DESG_PROCESS where NUM_ERRORS > 0;
      LOGS(p_idproceso, NULL, NULL, NULL, 'Total de Registros con ERROR BASICO en INT_DESG_PROCESS: '|| v_count);
    END LLENAR_INT_DESG_PROCESS;
  /* SET_NUM_ERRORS_DESG_PROCESS ******************************************************************************************************/
  PROCEDURE SET_NUM_ERRORS_DESG_PROCESS(p_v_idprocess IN NUMBER)
  IS
    CURSOR c_cuenta IS
      SELECT count(1) AS cuenta, PRODUCTO FROM INT_DESG_PROCESS WHERE NUM_ERRORS = 0 GROUP BY PRODUCTO HAVING count(1) > 0 ORDER BY PRODUCTO;
    v_sql_base VARCHAR2(32767);
    v_nomtabla VARCHAR2(50);
    v_cuenta_dup NUMBER;
    v_eventPeriodico VARCHAR2(15);
    BEGIN
      FOR r_c IN c_cuenta LOOP
        BEGIN
          v_eventPeriodico  := GET_EVENTO_PERIODICO(r_c.PRODUCTO);
          SELECT b.DESCRIPTION INTO v_nomtabla FROM AGREGATEDPOLICYTYPE A INNER JOIN CONFIGURABLEOBJECTTYPE b
              ON A.POLICYTYPEID = b.CONFIGURABLEOBJECTTYPEID AND A.PRODUCTID = INT_UTIL.GET_PRODUCTID_BY_NAME(r_c.PRODUCTO)
                 AND A.APT_HIERARCHYSTATE = 2;

      v_sql_base := 'INSERT INTO object_tmp (objectid, OPERATIONPK) SELECT A.ID_CORRELATIVO, e.id FROM INT_DESG_PROCESS A
                INNER JOIN PREPOLICY b ON A.NUM_POLIZA = b.NUMEROPOLIZAINPUT
                /*INNER JOIN '||v_nomtabla ||' c ON b.PK = c.PK AND TRUNC(a.PERIODO_BASE) = TRUNC(TO_DATE (c.PERIODOBASEINPUT, ''YYYY-MM-DD''))*/
                INNER JOIN POLICYDCO d ON b.PK = d.DCOID
                INNER JOIN EVENTDCO edco on D.OPERATIONPK=EDCO.OPERATIONPK
                INNER JOIN EVENTTYPE g on EDCO.EVENTTYPEID= G.EVENTTYPEID
                INNER JOIN CONTEXTOPERATION e ON d.OPERATIONPK = e.ID AND e.STATUS = 2
                WHERE a.producto = :1 and a.num_errors = 0 and trunc(e.time_stamp,''MM'') = TRUNC(a.PERIODO_BASE,''MM'')
                and g.description=''' || v_eventPeriodico || ''' GROUP BY a.ID_CORRELATIVO, e.ID';

          /*v_sql_base := 'INSERT INTO object_tmp (objectid, OPERATIONPK) SELECT A.ID_CORRELATIVO, e.id FROM INT_DESG_PROCESS A INNER JOIN PREPOLICY b ON A.NUM_POLIZA = b.NUMEROPOLIZAINPUT
                INNER JOIN '||v_nomtabla ||' c ON b.PK = c.PK AND TRUNC(a.PERIODO_BASE) = TRUNC(TO_DATE (c.PERIODOBASEINPUT, ''YYYY-MM-DD''))
                INNER JOIN POLICYDCO d ON c.PK = d.DCOID INNER JOIN EVENTDCO edco on D.IDDCOEVENT=EDCO.IDDCOEVENT INNER JOIN EVENTTYPE g on EDCO.EVENTTYPEID= G.EVENTTYPEID INNER JOIN CONTEXTOPERATION e ON d.OPERATIONPK = e.ID AND e.STATUS = 2
                WHERE a.producto = :1 and a.num_errors = 0 and g.description=''' || v_eventPeriodico || ''' GROUP BY a.ID_CORRELATIVO, e.ID';*/
          EXECUTE IMMEDIATE 'begin ' || v_sql_base || '; :2 := sql%rowcount; end;' using IN r_c.PRODUCTO, OUT v_cuenta_dup;
          LOGS(p_v_idprocess, NULL, GET_DESG_CODE(r_c.PRODUCTO), NULL, 'Sub-Total de Registros con ERROR de OPK Aplicada : '|| v_cuenta_dup);
          EXCEPTION
          WHEN OTHERS THEN
          LOGS(p_v_idprocess, NULL, NULL, NULL, 'ERROR en SET_NUM_ERRORS_DESG_PROCESS: ' || SUBSTRB(SQLERRM, 1, 500));
          RAISE;
        END;
      END LOOP;
      UPDATE INT_DESG_PROCESS A SET A.NUM_ERRORS = 1
      WHERE EXISTS (SELECT 1 FROM object_tmp WHERE objectid = A.ID_CORRELATIVO);
      LOGS(p_v_idprocess, NULL, NULL, NULL, 'Total de Registros actualizados con ERROR de OPK Aplicada en INT_DESG_PROCESS: '|| TO_CHAR(SQL%ROWCOUNT));
      delete object_tmp;
      /***************************************************************************/
      select count(1) INTO v_cuenta_dup from (
        SELECT count(1) AS cuenta FROM INT_DESG_PROCESS b WHERE b.NUM_ERRORS = 0
        GROUP BY b.NUM_POLIZA, b.PERIODO_BASE, b.EVENTO_APLICAR
        HAVING count(1) > 1);
      IF v_cuenta_dup > 0 THEN
        INSERT INTO object_tmp (objectid)
          SELECT a.ID_CORRELATIVO FROM (
                                         SELECT DISTINCT X.ID_CORRELATIVO, COUNT(*) OVER (PARTITION BY X.NUM_POLIZA, X.PERIODO_BASE, X.EVENTO_APLICAR) as cuenta
                                         FROM INT_DESG_PROCESS X
                                       ) a WHERE a.cuenta > 1;
        LOGS(p_v_idprocess, NULL, NULL, NULL, 'Sub-Total de Registros con ERROR de DUPLICADOS en la tabla INT_DESG_PROCESS: '|| TO_CHAR(SQL%ROWCOUNT));
        UPDATE INT_DESG_PROCESS A SET A.NUM_ERRORS = 1 WHERE EXISTS (SELECT 1 FROM object_tmp WHERE objectid = A.ID_CORRELATIVO);
        LOGS(p_v_idprocess, NULL, NULL, NULL, 'Total de Registros actualizados con ERROR de DUPLICADOS en INT_DESG_PROCESS: '|| TO_CHAR(SQL%ROWCOUNT));
      END IF;
      delete object_tmp;
    END SET_NUM_ERRORS_DESG_PROCESS;
  /* GENERAR_HEADER_ASL_DESGRAVAMEN ******************************************************************************************************/
  PROCEDURE GENERAR_HEADER_ASL_DESGRAVAMEN(p_idproceso IN NUMBER, p_product_name IN VARCHAR2, p_event IN VARCHAR2, p_codevento IN NUMBER,
                                           p_periodo IN VARCHAR, p_cuenta IN NUMBER, p_appointmentid IN NUMBER, p_pah OUT STPO_POLICYASLHEADER%ROWTYPE)
  AS
    v_filename VARCHAR2(100); v_sq NUMBER;
    BEGIN
      v_filename := p_product_name ||'_'|| p_event ||'_'|| p_periodo ||'_'|| TO_CHAR(SYSDATE, 'YYYY-mm-dd_HH24_MI_SS');
      v_sq := SQ_HELP.GET_SQ('SQ_STPO_POLICYASLHEADER');
      p_pah.PALH_PK           := v_sq;
      p_pah.PALH_FILENAME     := v_filename;
      p_pah.PALH_RECORDCOUNT  := p_cuenta;
      p_pah.PALH_LOADDATE     := sysdate;
      p_pah.PALH_SEQUENCE     := v_sq+1;
      p_pah.PALH_TOTALAMOUNT  := 0;
      p_pah.PALH_REALRECORDCOUNT := 0;
      p_pah.PALH_STATUS       := 0;
      p_pah.JSA_ID            := p_appointmentid;
      INSERT INTO STPO_POLICYASLHEADER VALUES p_pah;
      INSERT INTO STPO_POLICYASLHEADERHISTORY VALUES (p_pah.PALH_PK, SYSDATE, p_pah.PALH_STATUS, 'system', NULL);
      LOGS(p_idproceso, p_pah.PALH_PK, GET_DESG_CODE(p_product_name), p_codevento, 'Se creo el POLICYASLHEADER ['|| v_filename ||']');
      EXCEPTION
      WHEN OTHERS THEN
      RAISE;
    END GENERAR_HEADER_ASL_DESGRAVAMEN;
  /*GENERAR_LOGICALASL_DESGRAVAMEN ****************************************************************/
  PROCEDURE GENERAR_LOGICALASL_DESGRAVAMEN(p_idproceso IN NUMBER, p_parser_name IN VARCHAR2,
                                           p_product_name IN VARCHAR2, p_event IN VARCHAR2, p_codevento IN NUMBER, p_periodo IN DATE, p_pah IN STPO_POLICYASLHEADER%ROWTYPE, p_user IN VARCHAR2)
  AS
    BEGIN
      INSERT INTO STPO_POLICYASLOGICAL ( PAL_PK, PALH_PK, PAL_LOADDATE, PAL_PROCESSDATE, PAL_RECORDTYPE, PAL_STATUS, PALH_FILENAME, PAL_PRODCODE, PAL_POLICYNUMBER, PAL_EVENT, OPK, PAL_RECORDID)
        SELECT  SQ_HELP.GET_SQ('SQ_STPO_POLICYASLOGICAL'),
          I.*
        FROM(SELECT
               p_pah.PALH_PK AS v_pah_PALH_PK,
               p_pah.PALH_LOADDATE AS v_pah_PALH_LOADDATE,
               p_pah.PALH_LOADDATE AS v_pah_PAL_PROCESSDATE,
               p_parser_name AS RECORD_TYPE,
               0 AS v_pah_ESTADO,
               p_pah.PALH_FILENAME AS v_pah_PALH_FILENAME,
               p_product_name AS PRODUCTO_NOMBRE,
               A.NUM_POLIZA, -- Interseguro Garantizan que vienen estos dos valores
               p_event AS evento,
               0 AS v_pah_opk,
               A.ID_CORRELATIVO AS v_PAL_RECORDID
             FROM INT_DESG_PROCESS A
             WHERE A.NUM_ERRORS = 0
                   AND A.PRODUCTO = p_product_name
                   AND A.EVENTO_APLICAR = p_codevento
                   AND A.PERIODO_BASE = p_periodo
             ORDER BY A.ID_CORRELATIVO) I
        ORDER BY I.v_PAL_RECORDID;
      LOGS(p_idproceso, p_pah.PALH_PK, GET_DESG_CODE(p_product_name), p_codevento, 'Se Insertaron '|| TO_CHAR(SQL%ROWCOUNT) || ' registros en STPO_POLICYASLOGICAL ['|| p_pah.PALH_FILENAME ||']');

      INSERT INTO STPO_POLICYASLHISTORY (PAL_PK, PAH_DATE, PAH_STATUS, PAH_USER)
        SELECT A.PAL_PK, SYSDATE, 0, p_user FROM STPO_POLICYASLOGICAL A WHERE A.PALH_PK = p_pah.PALH_PK;

      MERGE INTO INT_DESG_PROCESS t1
      USING (
              SELECT PAL_RECORDID, PAL_PK FROM STPO_POLICYASLOGICAL WHERE PALH_PK = p_pah.PALH_PK
            )t2
      ON(t1.ID_CORRELATIVO = t2.PAL_RECORDID) WHEN MATCHED THEN UPDATE SET
        t1.ASL_LOGICAL_PK = t2.PAL_PK;
      LOGS(p_idproceso, p_pah.PALH_PK, GET_DESG_CODE(p_product_name), p_codevento, 'Se Actualizaron '|| TO_CHAR(SQL%ROWCOUNT) || ' registros en INT_DESG_PROCESS ['|| p_pah.PALH_FILENAME ||'] en el campo ASL_LOGICAL_PK');
      EXCEPTION
      WHEN OTHERS THEN
      RAISE;
    END GENERAR_LOGICALASL_DESGRAVAMEN;
  /* LOGS ******************************************************************************************************/
  PROCEDURE LOGS(p_idproceso IN NUMBER, p_header IN NUMBER, p_codproducto IN VARCHAR2, p_codevento IN NUMBER, p_mensaje IN VARCHAR2 )
  IS
  PRAGMA AUTONOMOUS_TRANSACTION;
    BEGIN
      INSERT INTO EXT_LOGDESGRAVAMEN (ID_PROCESO, PALH_PK, COD_IND_PRODUCTO, NUM_EVENTO, MENSAJE) VALUES ( p_idproceso, p_header, p_codproducto, p_codevento, p_mensaje);
      COMMIT;
    END LOGS;
  /* GET_FIRSTPART_NUMPOL ****************************************************************************/
  FUNCTION GET_FIRSTPART_NUMPOL(p_product_name IN VARCHAR2, p_numacuerdo IN VARCHAR2, p_subproduct IN VARCHAR2, p_canal IN VARCHAR2)
    RETURN VARCHAR2 RESULT_CACHE
  IS
    v_valor VARCHAR2(30);
    BEGIN
      IF IS_COLECTIVO(p_product_name) THEN
        v_valor := p_numacuerdo;
      ELSE
        v_valor := GET_PRODUCT_CODE(p_product_name) || GET_SUBPRODUCT_CODE(p_product_name, p_subproduct) || GET_CANAL_CODE(p_canal);
      END IF;
      RETURN v_valor;
      EXCEPTION
      WHEN OTHERS THEN
      RETURN NULL;
    END GET_FIRSTPART_NUMPOL;
  /* IS_COLECTIVO ****************************************************************************/
  FUNCTION IS_COLECTIVO(p_product_name IN VARCHAR2)
    RETURN BOOLEAN RESULT_CACHE RELIES_ON(TDJobDesgravamenParam)
  IS
    v_valor BOOLEAN := FALSE;
    v_temp VARCHAR2(60);
    BEGIN
      SELECT TIPODESGINPUT INTO v_temp FROM TDJOBDESGRAVAMENPARAM
      WHERE PRODUCTOSINPUT = p_product_name;
      IF v_temp = 'Colectivo' THEN
        v_valor := TRUE;
      END IF;
      RETURN v_valor;
      EXCEPTION
      WHEN OTHERS THEN
      RAISE;
    END IS_COLECTIVO;
  /* EVAL_COLECTIVO ****************************************************************************/
  FUNCTION EVAL_COLECTIVO(p_product_name IN VARCHAR2)
    RETURN NUMBER RESULT_CACHE
  IS
    v_valor NUMBER := 0;
    v_temp VARCHAR2(60);
    BEGIN
      IF IS_COLECTIVO(p_product_name) THEN
        v_valor := 1;
      END IF;
      RETURN v_valor;
      EXCEPTION
      WHEN OTHERS THEN
      RETURN NULL;
    END EVAL_COLECTIVO;
  /* GET_PRODUCT_CODE ****************************************************************************/
  FUNCTION GET_PRODUCT_CODE(p_product_name IN VARCHAR2) RETURN VARCHAR2 RESULT_CACHE
  IS
    v_valor VARCHAR2(4);
    BEGIN
      SELECT LPAD (A.CODIGOPRODUCTOINPUT, 3, '0') as formato_out INTO v_valor
      FROM   PREPRODUCT A
      WHERE  A.STATIC = INT_UTIL.GET_PRODUCTID_BY_NAME (p_product_name);
      RETURN v_valor;
      EXCEPTION
      WHEN OTHERS THEN
      RETURN 'XXX';
    END GET_PRODUCT_CODE;
  /* GET_SUBPRODUCT_CODE ****************************************************************************/
  FUNCTION GET_SUBPRODUCT_CODE(p_product_name IN VARCHAR2, p_subproduct IN VARCHAR2) RETURN VARCHAR2 RESULT_CACHE RELIES_ON(TDSubProducDesgInd)
  IS
    v_valor VARCHAR2(3);
    BEGIN
      SELECT LPAD (a.CODIGOSUBPRODUCTOINPUT, 2, '0') AS formato_out INTO v_valor
      FROM   TDSubProducDesgInd a
      WHERE  UPPER(a.SUBPRODUCTODESGINPUT) = UPPER(p_subproduct)
             AND UPPER(a.PRODDESGRAVAMENINPUT) = UPPER(p_product_name);
--      SELECT LPAD (a.TRVAL, 2, '0') AS formato_out INTO v_valor
--      FROM   VIEW_PROPIEDAD_VALORES a
--      WHERE  a.SIMBOLO = 'SubProductoDesg'
--             AND UPPER(a.TRDESC) = UPPER(p_subproduct);
      RETURN v_valor;
      EXCEPTION
      WHEN OTHERS THEN
      RETURN 'XX';
    END GET_SUBPRODUCT_CODE;
  /* GET_CANAL_CODE ****************************************************************************/
  FUNCTION GET_CANAL_CODE(p_canal IN VARCHAR2) RETURN VARCHAR2 RESULT_CACHE
  IS
    v_valor VARCHAR2(3);
    BEGIN
      SELECT LPAD (a.TRVAL, 2, '0')AS formato_out into v_valor
      FROM   VIEW_PROPIEDAD_VALORES a
      WHERE  a.SIMBOLO = 'CanalVenta'
             AND UPPER(a.TRDESC) = UPPER(p_canal);
      RETURN v_valor;
      EXCEPTION
      WHEN OTHERS THEN
      RETURN 'XX';
    END GET_CANAL_CODE;
  /* UPDATE_INTERMEDIO_DESGRAVAMEN ****************************************************************************/
  PROCEDURE UPDATE_INTERMEDIO_DESGRAVAMEN(p_idproceso IN NUMBER)
  IS
    BEGIN
      LOGS(p_idproceso, NULL, NULL, NULL, 'Inicio Actualizar a INTERMEDIO_DESGRAVAMEN ...');
      UPDATE INTERMEDIO_DESGRAVAMEN A SET A.IND_CARGADO = 'N', A.ID_PROCESO = p_idproceso
      WHERE EXISTS (SELECT 1 FROM INT_DESG_PROCESS x WHERE x.ID_CORRELATIVO = A.ID_CORRELATIVO AND x.NUM_ERRORS > 0);
      LOGS(p_idproceso, NULL, NULL, NULL, 'Total de Registros actualizado A ERROR en INTERMEDIO_DESGRAVAMEN: '|| TO_CHAR(SQL%ROWCOUNT));
      MERGE INTO INTERMEDIO_DESGRAVAMEN t1
      USING (
              SELECT ID_CORRELATIVO, ASL_LOGICAL_PK FROM INT_DESG_PROCESS WHERE NUM_ERRORS = 0
            )t2
      ON(t1.ID_CORRELATIVO = t2.ID_CORRELATIVO) WHEN MATCHED THEN UPDATE SET
        t1.IND_CARGADO = 'S',
        t1.ASL_LOGICAL_PK = t2.ASL_LOGICAL_PK,
        t1.ID_PROCESO = p_idproceso;
      LOGS(p_idproceso, NULL, NULL, NULL, 'Total de Registros actualizado A OK en INTERMEDIO_DESGRAVAMEN: '|| TO_CHAR(SQL%ROWCOUNT));
      DELETE INT_DESG_PROCESS x WHERE x.NUM_ERRORS > 0;
      LOGS(p_idproceso, NULL, NULL, NULL, 'Total de Registros eliminados que no se procesaran en INT_DESG_PROCESS: '|| TO_CHAR(SQL%ROWCOUNT));
      LOGS(p_idproceso, NULL, NULL, NULL, 'Finalizado la actualizacion de INTERMEDIO_DESGRAVAMEN ...');
    END UPDATE_INTERMEDIO_DESGRAVAMEN;
  /*  GET_DESG_CODE ***************************************************************************/
  FUNCTION GET_DESG_CODE ( p_product IN VARCHAR2)  RETURN VARCHAR2 RESULT_CACHE RELIES_ON(TDJobDesgravamenParam)
  IS
    v_valor VARCHAR2(10);
    BEGIN
      SELECT A.CODEINDCARGADOINPUT INTO v_valor
      FROM TDJobDesgravamenParam A WHERE  A.PRODUCTOSINPUT = p_product;
      RETURN v_valor;
      EXCEPTION
      WHEN NO_DATA_FOUND THEN
      RETURN 'X';
      WHEN OTHERS THEN
      RAISE;
    END GET_DESG_CODE;
  /*  GET_DESG_NAMEBYCODE ***************************************************************************/
  FUNCTION GET_DESG_NAMEBYCODE ( p_code IN VARCHAR2) RETURN VARCHAR2 RESULT_CACHE RELIES_ON(TDJobDesgravamenParam)
  IS
    v_valor VARCHAR2(100);
    BEGIN
      SELECT A.PRODUCTOSINPUT INTO v_valor
      FROM TDJobDesgravamenParam A WHERE  A.CODEINDCARGADOINPUT = p_code;
      RETURN v_valor;
      EXCEPTION
      WHEN NO_DATA_FOUND THEN
      RETURN NULL;
      WHEN OTHERS THEN
      RAISE;
    END GET_DESG_NAMEBYCODE;
  /*  GET_EVENTO_PERIODICO ***************************************************************************/
  FUNCTION GET_EVENTO_PERIODICO ( p_product IN VARCHAR2) RETURN VARCHAR2 RESULT_CACHE
  IS
    v_valor VARCHAR2(100);
    BEGIN
      IF IS_COLECTIVO(p_product) THEN v_valor  := 'PrimaPeriodica'; ELSE v_valor := 'GenerarPrima'; END IF;
      return v_valor;
      EXCEPTION
      WHEN OTHERS THEN
      RETURN '';
    END GET_EVENTO_PERIODICO;

    PROCEDURE SET_EVENT_COL(p_idproceso IN NUMBER)
    IS
    BEGIN
        LOGS(p_idproceso, NULL, NULL, NULL, 'Inicio Actualizar evento de productos colectivos en INTERMEDIO_DESGRAVAMEN ...');
        EXECUTE IMMEDIATE 'TRUNCATE TABLE OBJECT_TMP';

        INSERT INTO OBJECT_TMP (OBJECTID,OPERATIONPK)
            SELECT A.ID_CORRELATIVO, (SELECT COUNT(*)  FROM CONTEXTOPERATION CTX
                    INNER JOIN POLICYDCO PD ON PD.OPERATIONPK = CTX.ID
                    INNER JOIN PREPOLICY PP ON PP.PK = PD.DCOID
                    WHERE CTX.STATUS = 2 AND PP.NUMEROPOLIZAINPUT = A.NUMERO_POLIZA||'-'||A.NUMERO_CERTIFICADO || INT_DESG_JOB.GET_LASTPART_NUMPOL(A.PRODUCTO,
          A.MONCOM))+
                    (RANK() OVER (PARTITION BY A.NUMERO_POLIZA||'-'||A.NUMERO_CERTIFICADO || INT_DESG_JOB.GET_LASTPART_NUMPOL(A.PRODUCTO,
          A.MONCOM)  ORDER BY A.ID_CORRELATIVO)) COUNT
            FROM INTERSEGURO.INTERMEDIO_DESGRAVAMEN A
            WHERE A.PRODUCTO IN ('DesgravamenVehicular','DesgravamenPersonal','DesgravamenTarjetas','DesgravamenHipotecario','DesgTarjetasIndividual','DesgPersonalFactIndividual')
                AND A.IND_CARGADO IS NULL AND A.ASL_LOGICAL_PK IS NULL;

        MERGE INTO INTERMEDIO_DESGRAVAMEN OT
        USING (SELECT OBJECTID, CASE WHEN OPERATIONPK = 1 THEN 0 ELSE  1 END EVENTO FROM OBJECT_TMP) IT
            ON (IT.OBJECTID = OT.ID_CORRELATIVO)
        WHEN MATCHED THEN UPDATE SET OT.EVENTO_APLICAR = IT.EVENTO;

        EXECUTE IMMEDIATE 'TRUNCATE TABLE OBJECT_TMP';

        LOGS(p_idproceso, NULL, NULL, NULL, 'Finalizado la actualizacion de evento de productos colectivos en INTERMEDIO_DESGRAVAMEN ...');
    END SET_EVENT_COL;
    /* GET_PRODUCT_BICURRENCY BEHAVIOUR ****************************************************************************/
    FUNCTION GET_LASTPART_NUMPOL(p_product_name IN VARCHAR2,p_moncom IN VARCHAR2) RETURN VARCHAR2 RESULT_CACHE
    IS
    v_valor VARCHAR2(4);
    BEGIN
      SELECT CASE WHEN A.BIMONEDAINPUT = 'Si' THEN 
       CASE WHEN p_moncom ='01' THEN '-1' WHEN p_moncom = '02' THEN '-2' END ELSE '' END as formato_out INTO v_valor
      FROM   PREPRODUCT A
      WHERE  A.STATIC = INT_UTIL.GET_PRODUCTID_BY_NAME (p_product_name);
      RETURN v_valor;
      EXCEPTION
      WHEN OTHERS THEN
      RETURN v_valor;
    END GET_LASTPART_NUMPOL;
END INT_DESG_JOB;
/