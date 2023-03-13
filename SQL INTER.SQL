SELECT 'SELECT count(*) into VALOR FROM ' || table_name || ' WHERE ' || column_name || ' = ''500105-0000149''; # dbms_output.put_line(''rows in ' ||  table_name || ' ='' || VALOR);'  from all_tab_columns where column_name LIKE '%POLICYNUMBER%' AND OWNER ='INTERSEGURO'
--------------------------------------------------------------------------------
select * from all_tab_columns WHERE OWNER ='INTERSEGURO'
--------------------------------------------------------------------------------
select * from all_tab_columns
--------------------------------------------------------------------------------
SELECT 'SELECT count(*) into VALOR FROM ' || table_name || ' WHERE ' || column_name || ' = ''500105-0000149''; # dbms_output.put_line(''rows in ' ||  table_name || ' ='' || VALOR);'  from all_tab_columns where column_name LIKE '%POLICYNUMBER%' AND OWNWER = 'INTERSEGURO';
--------------------------------------------------------------------------------
SELECT 'SELECT count(*) into VALOR FROM ' || table_name || ' WHERE ' || column_name || ' = ''500105-0000149''; # dbms_output.put_line(''rows in ' ||  table_name || ' ='' VALOR);'  from all_tab_columns where column_name LIKE '%POLICYNUMBER%'
--------------------------------------------------------------------------------
SELECT 'SELECT count(*) into VALOR FROM ' || table_name || ' WHERE ' || column_name || ' = ''500105-0000149''; # dbms_output.put_line(''rows in || ''' ||  table_name || '|| = VALOR);'  from all_tab_columns where column_name LIKE '%POLICYNUMBER%'
--------------------------------------------------------------------------------
SELECT 'SELECT count(*) into VALOR FROM ' || table_name || ' WHERE ' || column_name || ' = ''500105-0000149''; # dbms_output.put_line(''rows in ''' ||  table_name || '= VALOR);'  from all_tab_columns where column_name LIKE '%POLICYNUMBER%'
---------------------------------------
SELECT 'SELECT count(*) into VALOR FROM ' || table_name || ' WHERE ' || column_name || ' = ''500105-0000149''; # dbms_output.put_line(''rows in '''|| table_name || '= || VALOR);'  from all_tab_columns where column_name LIKE '%POLICYNUMBER%'
--------------------------------------------------------------------------------
SELECT 'SELECT * FROM ' || table_name || ' \n WHERE ' || column_name || ' = ''500105-0000149'''  from all_tab_columns where column_name LIKE '%POLICYNUMBER%'
--------------------------------------------------------------------------------
DECLARE
VALOR NUMBER;
BEGIN
SELECT COUNT(*) INTO VALOR FROM PREPOLICY WHERE NUMEROPOLIZAINPUT = '500105-0000149';
dbms_output.put_line('rows in PREPOLICY = '|| VALOR);
END;
--------------------------------------------------------------------------------
SELECT COUNT(1)  FROM PREPOLICY WHERE NUMEROPOLIZAINPUT = '500105-0000149'
--------------------------------------------------------------------------------
SELECT 'SELECT * FROM ' || table_name || ' WHERE ' || column_name || ' = ''500105-0000149'''  from all_tab_columns where column_name LIKE '%POLICYNUMBER%'
--------------------------------------------------------------------------------
SELECT * FROM OPENITEMREFERENCE
--------------------------------------------------------------------------------
SELECT * FROM PREPOLICY WHERE NUMEROPOLIZAINPUT = '500105-0000149'
--------------------------------------------------------------------------------
SELECT COUNT(1) FROM PolDesgTarjetasInd
--------------------------------------------------------------------------------
SELECT * FROM PolDesgTarjetasInd
--------------------------------------------------------------------------------
SELECT * FROM POLDESGTARJETAS
--------------------------------------------------------------------------------
SELECT * FROM EXT_INTERFZSAMP
--------------------------------------------------------------------------------
SELECT 'SELECT * FROM ' || table_name || ' WHERE ' || column_name || ' = ''500105-0000149'''  from all_tab_columns where column_name LIKE '%NUMEROPOLIZA%'
--------------------------------------------------------------------------------
SELECT 'SELECT * FROM ' || table_name || ' WHERE ' || column_name || ' = ''500105-0000149'''  from all_tab_columns where column_name LIKE '%POL%'
--------------------------------------------------------------------------------
SELECT 'SELECT * FROM ' || table_name,' WHERE ' || column_name || ' = ''500105-0000149'''  from all_tab_columns where column_name LIKE '%POL%'
--------------------------------------------------------------------------------
SELECT table_name,column_name from all_tab_columns where column_name LIKE '%POL%'
--------------------------------------------------------------------------------
SELECT table_name from all_tab_columns where column_name LIKE '%POL%'
--------------------------------------------------------------------------------
SELECT table_name from all_tab_columns where column_name LIKE '%NUM%POL'
--------------------------------------------------------------------------------
select * from prepolicy where numeropolizainput in ('500105-0000666')
--------------------------------------------------------------------------------
select * from prepolicy where numeropolizainput in ('500105-0000150')
--------------------------------------------------------------------------------
select *  from intermedio_desgravamen WHERE --IND_CARGADO IS NULL
archivo_trama = 'PRIMAS_NSAT_SOL_202208_TEST02.txt'
--------------------------------------------------------------------------------
SELECT
          A.IND_CARGADO, A.ASL_LOGICAL_PK,A.ID_CORRELATIVO, A.ARCHIVO_TRAMA, A.EVENTO_APLICAR, A.PRIMER_NOMBRE, A.SEGUNDO_NOMBRE, A.APELLIDO_PATERNO, A.APELLIDO_MATERNO, A.TIPO_DOCUMENTO, A.NUMERO_DOCUMENTO, A.FECHA_NACIMIENTO, A.DIRECCION, A.TELEFONO, A.MONEDA, A.FECHA_INICIO_VIGENCIA, A.FECHA_FIN_VIGENCIA, A.NUMERO_CERTIFICADO, A.NUMERO_POLIZA, A.PRIMA_ARCHIVO, A.IMPORTE_CREDITO, A.TASA_SEGURO, A.CODIGO_VENDEDOR, A.SALDO_CREDITO, A.PRODUCTO, A.SUB_PRODUCTO, A.CODIGO_UNICO_CLIENTE, A.NRO_CUOTA, A.PLAZO, A.NRO_TARJETA, A.MOTIVO, A.TIPO_POLIZA, A.SUB_PRODUCTO_PLAN, A.TIPO_ASEGURADO, A.CODDEPARTAMENTO, A.CODPROVINCIA, A.CODDISTRITO,
          DECODE(A.INDICADOR_PE, 'S', 'Si', 'No'), A.AGENCIA, A.NUMERO_CERTIFICADO_ANT, A.CORREO_ELECTRONICO, A.PRIMER_NOMBRE_CY, A.SEGUNDO_NOMBRE_CY, A.APELLIDO_PATERNO_CY, A.APELLIDO_MATERNO_CY, A.TIPO_DOCUMENTO_CY,
          A.NUMERO_DOCUMENTO_CY, A.FECHA_NACIMIENTO_CY, A.SEXO_CY, REPLACE(a.PORC_SOBREPRIMA, '%',''), REPLACE(a.PORC_SOBREPRIMA_CY, '%',''), REPLACE(a.MIL_EXTRAPRIMA, '%',''), REPLACE(a.MIL_EXTRAPRIMA_CY, '%',''), SEXO_TITULAR, FECHA_CANCELACION,
          TO_DATE (A.PERDIODO_BASE, 'MM-YYYY') AS PERIODO_BASE,
          INT_DESG_JOB.GET_FIRSTPART_NUMPOL(PRODUCTO, NUMERO_POLIZA, SUB_PRODUCTO, TIPO_POLIZA) || '-' || a.NUMERO_CERTIFICADO || INT_DESG_JOB.GET_LASTPART_NUMPOL(PRODUCTO,
          A.MONCOM) NUM_POLIZA,
          CORRELATIVODPS, CORRELATIVODPS_CY, FECHA_DESEMBOLSO,
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
          ((COUNT(1) over (partition by a.NUMERO_POLIZA, a.NUMERO_CERTIFICADO, a.PERDIODO_BASE, a.EVENTO_APLICAR))-1) +                --pol_duplicado
          --((count(1) OVER (PARTITION BY A.CORRELATIVODPS))-1) +
          CASE WHEN INT_DESG_JOB.EVAL_COLECTIVO(A.PRODUCTO) = 1 THEN
            0
          ELSE
            NVL2(LENGTH(TRIM(A.SUB_PRODUCTO)), 0, 1) + NVL2(LENGTH(TRIM(A.TIPO_POLIZA)), 0, 1)
          END -- subProducto_nulo O codigoCanal_nulo
            AS NUM_ERRORS
        FROM INTERMEDIO_DESGRAVAMEN A
        WHERE archivo_trama = 'PRIMAS_NSAT_SOL_202208_TEST02.txt' --A.IND_CARGADO IS NULL AND A.ASL_LOGICAL_PK IS NULL;
--------------------------------------------------------------------------------
select * from prepolicy where numeropolizainput in ('500105-0000149',
'500105-0000346',
'500105-0000523',
'500105-0000552',
'500105-0000725',
'500105-0001277',
'500105-0001423')
--------------------------------------------------------------------------------
SELECT
          A.IND_CARGADO, A.ASL_LOGICAL_PK,A.ID_CORRELATIVO, A.ARCHIVO_TRAMA, A.EVENTO_APLICAR, A.PRIMER_NOMBRE, A.SEGUNDO_NOMBRE, A.APELLIDO_PATERNO, A.APELLIDO_MATERNO, A.TIPO_DOCUMENTO, A.NUMERO_DOCUMENTO, A.FECHA_NACIMIENTO, A.DIRECCION, A.TELEFONO, A.MONEDA, A.FECHA_INICIO_VIGENCIA, A.FECHA_FIN_VIGENCIA, A.NUMERO_CERTIFICADO, A.NUMERO_POLIZA, A.PRIMA_ARCHIVO, A.IMPORTE_CREDITO, A.TASA_SEGURO, A.CODIGO_VENDEDOR, A.SALDO_CREDITO, A.PRODUCTO, A.SUB_PRODUCTO, A.CODIGO_UNICO_CLIENTE, A.NRO_CUOTA, A.PLAZO, A.NRO_TARJETA, A.MOTIVO, A.TIPO_POLIZA, A.SUB_PRODUCTO_PLAN, A.TIPO_ASEGURADO, A.CODDEPARTAMENTO, A.CODPROVINCIA, A.CODDISTRITO,
          DECODE(A.INDICADOR_PE, 'S', 'Si', 'No'), A.AGENCIA, A.NUMERO_CERTIFICADO_ANT, A.CORREO_ELECTRONICO, A.PRIMER_NOMBRE_CY, A.SEGUNDO_NOMBRE_CY, A.APELLIDO_PATERNO_CY, A.APELLIDO_MATERNO_CY, A.TIPO_DOCUMENTO_CY,
          A.NUMERO_DOCUMENTO_CY, A.FECHA_NACIMIENTO_CY, A.SEXO_CY, REPLACE(a.PORC_SOBREPRIMA, '%',''), REPLACE(a.PORC_SOBREPRIMA_CY, '%',''), REPLACE(a.MIL_EXTRAPRIMA, '%',''), REPLACE(a.MIL_EXTRAPRIMA_CY, '%',''), SEXO_TITULAR, FECHA_CANCELACION,
          TO_DATE (A.PERDIODO_BASE, 'MM-YYYY') AS PERIODO_BASE,
          INT_DESG_JOB.GET_FIRSTPART_NUMPOL(PRODUCTO, NUMERO_POLIZA, SUB_PRODUCTO, TIPO_POLIZA) || '-' || a.NUMERO_CERTIFICADO || INT_DESG_JOB.GET_LASTPART_NUMPOL(PRODUCTO,
          A.MONCOM) NUM_POLIZA,
          CORRELATIVODPS, CORRELATIVODPS_CY, FECHA_DESEMBOLSO,
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
          ((COUNT(1) over (partition by a.NUMERO_POLIZA, a.NUMERO_CERTIFICADO, a.PERDIODO_BASE, a.EVENTO_APLICAR))-1) +                --pol_duplicado
          --((count(1) OVER (PARTITION BY A.CORRELATIVODPS))-1) +
          CASE WHEN INT_DESG_JOB.EVAL_COLECTIVO(A.PRODUCTO) = 1 THEN
            0
          ELSE
            NVL2(LENGTH(TRIM(A.SUB_PRODUCTO)), 0, 1) + NVL2(LENGTH(TRIM(A.TIPO_POLIZA)), 0, 1)
          END -- subProducto_nulo O codigoCanal_nulo
            AS NUM_ERRORS
        FROM INTERMEDIO_DESGRAVAMEN A
        WHERE A.IND_CARGADO IS NULL AND A.ASL_LOGICAL_PK IS NULL
--------------------------------------------------------------------------------
select * from contextoperation where item = 97458568
--------------------------------------------------------------------------------
select * from prepolicy where numeropolizainput = '500105-0000149'
--------------------------------------------------------------------------------
SELECT  * FROM STPO_POLICYASLOGICAL where pal_policynumber = '500105-0000149-01'
--------------------------------------------------------------------------------
select * from INT_DESG_PROCESS
--------------------------------------------------------------------------------
SELECT  * FROM STPO_POLICYASLOGICAL
--------------------------------------------------------------------------------
select *  from intermedio_desgravamen WHERE --IND_CARGADO IS NULL ;
archivo_trama = 'PRIMAS_NSAT_SOL_202208_TEST02.txt'
--------------------------------------------------------------------------------
SELECT * FROM EXT_LOGDESGRAVAMEN WHERE PALH_PK = 4288874
--------------------------------------------------------------------------------
SELECT * FROM EXT_LOGDESGRAVAMEN WHERE PALH_PK = 226324022
--------------------------------------------------------------------------------
SELECT * FROM EXT_LOGDESGRAVAMEN
--------------------------------------------------------------------------------
DELETE FROM STPO_POLICYASLOGICAL WHERE PAL_PK = 226324022
--------------------------------------------------------------------------------
DELETE FROM  STPO_POLICYASLHISTORY WHERE PAL_PK = 226324022
--------------------------------------------------------------------------------
SELECT * FROM STPO_POLICYASLOGICAL WHERE PAL_PK = 226324022
--------------------------------------------------------------------------------
select * FROM INT_DESG_PROCESS
--------------------------------------------------------------------------------
SELECT * FROM PREPOLICY WHERE NUMEROPOLIZAINPUT = '500105-0000149-01'
--------------------------------------------------------------------------------
update intermedio_desgravamen set ind_cargado = NULL  WHERE id_correlativo in (7182833691,7182833692)
--------------------------------------------------------------------------------
SELECT * FROM  STPO_POLICYASLHEADERHISTORY WHERE PALH_PK = 4288874
--------------------------------------------------------------------------------
SELECT * FROM  STPO_POLICYASLHEADERHISTORY
--------------------------------------------------------------------------------
SELECT * FROM STPO_POLICYASLHEADER ORDER BY PALH_PK DESC
--------------------------------------------------------------------------------
SELECT * FROM STPO_POLICYASLHEADER
--------------------------------------------------------------------------------
SELECT * FROM STPO_POLICYASLOGICAL
--------------------------------------------------------------------------------
SELECT * FROM STPO_POLICYASLOGICAL WHERE PAL_POLICYNUMBER ='500105-0000149'
--------------------------------------------------------------------------------
update intermedio_desgravamen set ind_cargado = NULL  WHERE id_correlativo in (7182833692)
--------------------------------------------------------------------------------
select *  from intermedio_desgravamen WHERE IND_CARGADO IS NULL
--archivo_trama = 'PRIMAS_NSAT_SOL_202208_TEST02.txt';
--------------------------------------------------------------------------------
update intermedio_desgravamen set ind_cargado = 'E'  WHERE IND_CARGADO IS NULL
--------------------------------------------------------------------------------
select *  from intermedio_desgravamen WHERE IND_CARGADO IS NULL
--------------------------------------------------------------------------------
select *  from intermedio_desgravamen WHERE IND_CARGADO IS NULL --archivo_trama = 'PRIMAS_NSAT_SOL_202208_TEST02.txt';
--------------------------------------------------------------------------------
select *  from intermedio_desgravamen WHERE archivo_trama = 'PRIMAS_NSAT_SOL_202208_TEST02.txt'
--------------------------------------------------------------------------------
select *  from intermedio_desgravamen WHERE MON_COMIS is not null
--------------------------------------------------------------------------------
select *  from intermedio_desgravamen WHERE ID_CORRELATIVO = 6794646962
--------------------------------------------------------------------------------
select * from TDJobDesgravamenParam
--------------------------------------------------------------------------------
SELECT  * FROM PolDesgTarjetasInd
--------------------------------------------------------------------------------
select * from prepolicy where pk = 2054100037
--------------------------------------------------------------------------------
SELECT count(*) AS cuenta, PRODUCTO, EVENTO_APLICAR, PERIODO_BASE FROM INT_DESG_PROCESS
      WHERE NUM_ERRORS = 0 GROUP BY PRODUCTO, EVENTO_APLICAR, PERIODO_BASE
      ORDER BY PERIODO_BASE, EVENTO_APLICAR, PRODUCTO
--------------------------------------------------------------------------------
SELECT * FROM INT_DESG_PROCESS
--------------------------------------------------------------------------------
SELECT
          A.IND_CARGADO, A.ASL_LOGICAL_PK,A.ID_CORRELATIVO, A.ARCHIVO_TRAMA, A.EVENTO_APLICAR, A.PRIMER_NOMBRE, A.SEGUNDO_NOMBRE, A.APELLIDO_PATERNO, A.APELLIDO_MATERNO, A.TIPO_DOCUMENTO, A.NUMERO_DOCUMENTO, A.FECHA_NACIMIENTO, A.DIRECCION, A.TELEFONO, A.MONEDA, A.FECHA_INICIO_VIGENCIA, A.FECHA_FIN_VIGENCIA, A.NUMERO_CERTIFICADO, A.NUMERO_POLIZA, A.PRIMA_ARCHIVO, A.IMPORTE_CREDITO, A.TASA_SEGURO, A.CODIGO_VENDEDOR, A.SALDO_CREDITO, A.PRODUCTO, A.SUB_PRODUCTO, A.CODIGO_UNICO_CLIENTE, A.NRO_CUOTA, A.PLAZO, A.NRO_TARJETA, A.MOTIVO, A.TIPO_POLIZA, A.SUB_PRODUCTO_PLAN, A.TIPO_ASEGURADO, A.CODDEPARTAMENTO, A.CODPROVINCIA, A.CODDISTRITO,
          DECODE(A.INDICADOR_PE, 'S', 'Si', 'No'), A.AGENCIA, A.NUMERO_CERTIFICADO_ANT, A.CORREO_ELECTRONICO, A.PRIMER_NOMBRE_CY, A.SEGUNDO_NOMBRE_CY, A.APELLIDO_PATERNO_CY, A.APELLIDO_MATERNO_CY, A.TIPO_DOCUMENTO_CY,
          A.NUMERO_DOCUMENTO_CY, A.FECHA_NACIMIENTO_CY, A.SEXO_CY, REPLACE(a.PORC_SOBREPRIMA, '%',''), REPLACE(a.PORC_SOBREPRIMA_CY, '%',''), REPLACE(a.MIL_EXTRAPRIMA, '%',''), REPLACE(a.MIL_EXTRAPRIMA_CY, '%',''), SEXO_TITULAR, FECHA_CANCELACION,
          TO_DATE (A.PERDIODO_BASE, 'MM-YYYY') AS PERIODO_BASE,
          INT_DESG_JOB.GET_FIRSTPART_NUMPOL(PRODUCTO, NUMERO_POLIZA, SUB_PRODUCTO, TIPO_POLIZA) || '-' || a.NUMERO_CERTIFICADO || INT_DESG_JOB.GET_LASTPART_NUMPOL(PRODUCTO,
          A.MONCOM) NUM_POLIZA,
          CORRELATIVODPS, CORRELATIVODPS_CY, FECHA_DESEMBOLSO,
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
          ((COUNT(1) over (partition by a.NUMERO_POLIZA, a.NUMERO_CERTIFICADO, a.PERDIODO_BASE, a.EVENTO_APLICAR))-1) +                --pol_duplicado
          --((count(1) OVER (PARTITION BY A.CORRELATIVODPS))-1) +
          CASE WHEN INT_DESG_JOB.EVAL_COLECTIVO(A.PRODUCTO) = 1 THEN
            0
          ELSE
            NVL2(LENGTH(TRIM(A.SUB_PRODUCTO)), 0, 1) + NVL2(LENGTH(TRIM(A.TIPO_POLIZA)), 0, 1)
          END -- subProducto_nulo O codigoCanal_nulo
            AS NUM_ERRORS
        FROM INTERMEDIO_DESGRAVAMEN A
        WHERE archivo_trama in ('PRIMAS_NSAT_SOL_202208_TEST02.txt') OR ID_CORRELATIVO = 6794646962
--------------------------------------------------------------------------------
SELECT
          A.IND_CARGADO, A.ASL_LOGICAL_PK,A.ID_CORRELATIVO, A.ARCHIVO_TRAMA, A.EVENTO_APLICAR, A.PRIMER_NOMBRE, A.SEGUNDO_NOMBRE, A.APELLIDO_PATERNO, A.APELLIDO_MATERNO, A.TIPO_DOCUMENTO, A.NUMERO_DOCUMENTO, A.FECHA_NACIMIENTO, A.DIRECCION, A.TELEFONO, A.MONEDA, A.FECHA_INICIO_VIGENCIA, A.FECHA_FIN_VIGENCIA, A.NUMERO_CERTIFICADO, A.NUMERO_POLIZA, A.PRIMA_ARCHIVO, A.IMPORTE_CREDITO, A.TASA_SEGURO, A.CODIGO_VENDEDOR, A.SALDO_CREDITO, A.PRODUCTO, A.SUB_PRODUCTO, A.CODIGO_UNICO_CLIENTE, A.NRO_CUOTA, A.PLAZO, A.NRO_TARJETA, A.MOTIVO, A.TIPO_POLIZA, A.SUB_PRODUCTO_PLAN, A.TIPO_ASEGURADO, A.CODDEPARTAMENTO, A.CODPROVINCIA, A.CODDISTRITO,
          DECODE(A.INDICADOR_PE, 'S', 'Si', 'No'), A.AGENCIA, A.NUMERO_CERTIFICADO_ANT, A.CORREO_ELECTRONICO, A.PRIMER_NOMBRE_CY, A.SEGUNDO_NOMBRE_CY, A.APELLIDO_PATERNO_CY, A.APELLIDO_MATERNO_CY, A.TIPO_DOCUMENTO_CY,
          A.NUMERO_DOCUMENTO_CY, A.FECHA_NACIMIENTO_CY, A.SEXO_CY, REPLACE(a.PORC_SOBREPRIMA, '%',''), REPLACE(a.PORC_SOBREPRIMA_CY, '%',''), REPLACE(a.MIL_EXTRAPRIMA, '%',''), REPLACE(a.MIL_EXTRAPRIMA_CY, '%',''), SEXO_TITULAR, FECHA_CANCELACION,
          TO_DATE (A.PERDIODO_BASE, 'MM-YYYY') AS PERIODO_BASE,
          CASE WHEN INT_DESG_JOB.GET_BICURRENCY(PRODUCTO) = 'Y' THEN
                INT_DESG_JOB.GET_FIRSTPART_NUMPOL(PRODUCTO, NUMERO_POLIZA, SUB_PRODUCTO, TIPO_POLIZA) || '-' || a.NUMERO_CERTIFICADO || '-' || A.MONCOM
          ELSE
                INT_DESG_JOB.GET_FIRSTPART_NUMPOL(PRODUCTO, NUMERO_POLIZA, SUB_PRODUCTO, TIPO_POLIZA) || '-' || a.NUMERO_CERTIFICADO
          END NUM_POLIZA,
          --INT_DESG_JOB.GET_FIRSTPART_NUMPOL(PRODUCTO, NUMERO_POLIZA, SUB_PRODUCTO, TIPO_POLIZA) || '-' || a.NUMERO_CERTIFICADO || DECODE(A.MONCOM, '01', '-01', '02','-02','','01')  NUM_POLIZA,
          CORRELATIVODPS, CORRELATIVODPS_CY, FECHA_DESEMBOLSO,
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
          ((COUNT(1) over (partition by a.NUMERO_POLIZA, a.NUMERO_CERTIFICADO, a.PERDIODO_BASE, a.EVENTO_APLICAR))-1) +                --pol_duplicado
          --((count(1) OVER (PARTITION BY A.CORRELATIVODPS))-1) +
          CASE WHEN INT_DESG_JOB.EVAL_COLECTIVO(A.PRODUCTO) = 1 THEN
            0
          ELSE
            NVL2(LENGTH(TRIM(A.SUB_PRODUCTO)), 0, 1) + NVL2(LENGTH(TRIM(A.TIPO_POLIZA)), 0, 1)
          END -- subProducto_nulo O codigoCanal_nulo
            AS NUM_ERRORS
        FROM INTERMEDIO_DESGRAVAMEN A
        WHERE archivo_trama in ('PRIMAS_NSAT_SOL_202208_TEST02.txt') OR ID_CORRELATIVO = 6794646962---A.IND_CARGADO ='P' AND A.ASL_LOGICAL_PK IS NULL;
--------------------------------------------------------------------------------
SELECT
          A.IND_CARGADO, A.ASL_LOGICAL_PK,A.ID_CORRELATIVO, A.ARCHIVO_TRAMA, A.EVENTO_APLICAR, A.PRIMER_NOMBRE, A.SEGUNDO_NOMBRE, A.APELLIDO_PATERNO, A.APELLIDO_MATERNO, A.TIPO_DOCUMENTO, A.NUMERO_DOCUMENTO, A.FECHA_NACIMIENTO, A.DIRECCION, A.TELEFONO, A.MONEDA, A.FECHA_INICIO_VIGENCIA, A.FECHA_FIN_VIGENCIA, A.NUMERO_CERTIFICADO, A.NUMERO_POLIZA, A.PRIMA_ARCHIVO, A.IMPORTE_CREDITO, A.TASA_SEGURO, A.CODIGO_VENDEDOR, A.SALDO_CREDITO, A.PRODUCTO, A.SUB_PRODUCTO, A.CODIGO_UNICO_CLIENTE, A.NRO_CUOTA, A.PLAZO, A.NRO_TARJETA, A.MOTIVO, A.TIPO_POLIZA, A.SUB_PRODUCTO_PLAN, A.TIPO_ASEGURADO, A.CODDEPARTAMENTO, A.CODPROVINCIA, A.CODDISTRITO,
          DECODE(A.INDICADOR_PE, 'S', 'Si', 'No'), A.AGENCIA, A.NUMERO_CERTIFICADO_ANT, A.CORREO_ELECTRONICO, A.PRIMER_NOMBRE_CY, A.SEGUNDO_NOMBRE_CY, A.APELLIDO_PATERNO_CY, A.APELLIDO_MATERNO_CY, A.TIPO_DOCUMENTO_CY,
          A.NUMERO_DOCUMENTO_CY, A.FECHA_NACIMIENTO_CY, A.SEXO_CY, REPLACE(a.PORC_SOBREPRIMA, '%',''), REPLACE(a.PORC_SOBREPRIMA_CY, '%',''), REPLACE(a.MIL_EXTRAPRIMA, '%',''), REPLACE(a.MIL_EXTRAPRIMA_CY, '%',''), SEXO_TITULAR, FECHA_CANCELACION,
          TO_DATE (A.PERDIODO_BASE, 'MM-YYYY') AS PERIODO_BASE,
          CASE WHEN INT_DESG_JOB.GET_BICURRENCY(PRODUCTO) = 'Y' THEN
                INT_DESG_JOB.GET_FIRSTPART_NUMPOL(PRODUCTO, NUMERO_POLIZA, SUB_PRODUCTO, TIPO_POLIZA) || '-' || a.NUMERO_CERTIFICADO || '-' || A.MONCOM
          ELSE
                INT_DESG_JOB.GET_FIRSTPART_NUMPOL(PRODUCTO, NUMERO_POLIZA, SUB_PRODUCTO, TIPO_POLIZA) || '-' || a.NUMERO_CERTIFICADO
          END NUM_POLIZA,
          --INT_DESG_JOB.GET_FIRSTPART_NUMPOL(PRODUCTO, NUMERO_POLIZA, SUB_PRODUCTO, TIPO_POLIZA) || '-' || a.NUMERO_CERTIFICADO || DECODE(A.MONCOM, '01', '-01', '02','-02','','01')  NUM_POLIZA,
          CORRELATIVODPS, CORRELATIVODPS_CY, FECHA_DESEMBOLSO,
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
          ((COUNT(1) over (partition by a.NUMERO_POLIZA, a.NUMERO_CERTIFICADO, a.PERDIODO_BASE, a.EVENTO_APLICAR))-1) +                --pol_duplicado
          --((count(1) OVER (PARTITION BY A.CORRELATIVODPS))-1) +
          CASE WHEN INT_DESG_JOB.EVAL_COLECTIVO(A.PRODUCTO) = 1 THEN
            0
          ELSE
            NVL2(LENGTH(TRIM(A.SUB_PRODUCTO)), 0, 1) + NVL2(LENGTH(TRIM(A.TIPO_POLIZA)), 0, 1)
          END -- subProducto_nulo O codigoCanal_nulo
            AS NUM_ERRORS
        FROM INTERMEDIO_DESGRAVAMEN A
        WHERE archivo_trama in ('PRIMAS_NSAT_SOL_202208_TEST02.txt','CONVENIOS_FEBRERO_2018_001.xlsx')---A.IND_CARGADO ='P' AND A.ASL_LOGICAL_PK IS NULL;
--------------------------------------------------------------------------------
select *  from intermedio_desgravamen
--------------------------------------------------------------------------------
SELECT
          A.IND_CARGADO, A.ASL_LOGICAL_PK,A.ID_CORRELATIVO, A.ARCHIVO_TRAMA, A.EVENTO_APLICAR, A.PRIMER_NOMBRE, A.SEGUNDO_NOMBRE, A.APELLIDO_PATERNO, A.APELLIDO_MATERNO, A.TIPO_DOCUMENTO, A.NUMERO_DOCUMENTO, A.FECHA_NACIMIENTO, A.DIRECCION, A.TELEFONO, A.MONEDA, A.FECHA_INICIO_VIGENCIA, A.FECHA_FIN_VIGENCIA, A.NUMERO_CERTIFICADO, A.NUMERO_POLIZA, A.PRIMA_ARCHIVO, A.IMPORTE_CREDITO, A.TASA_SEGURO, A.CODIGO_VENDEDOR, A.SALDO_CREDITO, A.PRODUCTO, A.SUB_PRODUCTO, A.CODIGO_UNICO_CLIENTE, A.NRO_CUOTA, A.PLAZO, A.NRO_TARJETA, A.MOTIVO, A.TIPO_POLIZA, A.SUB_PRODUCTO_PLAN, A.TIPO_ASEGURADO, A.CODDEPARTAMENTO, A.CODPROVINCIA, A.CODDISTRITO,
          DECODE(A.INDICADOR_PE, 'S', 'Si', 'No'), A.AGENCIA, A.NUMERO_CERTIFICADO_ANT, A.CORREO_ELECTRONICO, A.PRIMER_NOMBRE_CY, A.SEGUNDO_NOMBRE_CY, A.APELLIDO_PATERNO_CY, A.APELLIDO_MATERNO_CY, A.TIPO_DOCUMENTO_CY,
          A.NUMERO_DOCUMENTO_CY, A.FECHA_NACIMIENTO_CY, A.SEXO_CY, REPLACE(a.PORC_SOBREPRIMA, '%',''), REPLACE(a.PORC_SOBREPRIMA_CY, '%',''), REPLACE(a.MIL_EXTRAPRIMA, '%',''), REPLACE(a.MIL_EXTRAPRIMA_CY, '%',''), SEXO_TITULAR, FECHA_CANCELACION,
          TO_DATE (A.PERDIODO_BASE, 'MM-YYYY') AS PERIODO_BASE,
          CASE WHEN INT_DESG_JOB.GET_BICURRENCY(PRODUCTO) = 'Y' THEN
                INT_DESG_JOB.GET_FIRSTPART_NUMPOL(PRODUCTO, NUMERO_POLIZA, SUB_PRODUCTO, TIPO_POLIZA) || '-' || a.NUMERO_CERTIFICADO || '-' || A.MONCOM
          ELSE
                INT_DESG_JOB.GET_FIRSTPART_NUMPOL(PRODUCTO, NUMERO_POLIZA, SUB_PRODUCTO, TIPO_POLIZA) || '-' || a.NUMERO_CERTIFICADO
          END NUM_POLIZA,
          --INT_DESG_JOB.GET_FIRSTPART_NUMPOL(PRODUCTO, NUMERO_POLIZA, SUB_PRODUCTO, TIPO_POLIZA) || '-' || a.NUMERO_CERTIFICADO || DECODE(A.MONCOM, '01', '-01', '02','-02','','01')  NUM_POLIZA,
          CORRELATIVODPS, CORRELATIVODPS_CY, FECHA_DESEMBOLSO,
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
          ((COUNT(1) over (partition by a.NUMERO_POLIZA, a.NUMERO_CERTIFICADO, a.PERDIODO_BASE, a.EVENTO_APLICAR))-1) +                --pol_duplicado
          --((count(1) OVER (PARTITION BY A.CORRELATIVODPS))-1) +
          CASE WHEN INT_DESG_JOB.EVAL_COLECTIVO(A.PRODUCTO) = 1 THEN
            0
          ELSE
            NVL2(LENGTH(TRIM(A.SUB_PRODUCTO)), 0, 1) + NVL2(LENGTH(TRIM(A.TIPO_POLIZA)), 0, 1)
          END -- subProducto_nulo O codigoCanal_nulo
            AS NUM_ERRORS
        FROM INTERMEDIO_DESGRAVAMEN A
        WHERE archivo_trama = 'PRIMAS_NSAT_SOL_202208_TEST02.txt'---A.IND_CARGADO ='P' AND A.ASL_LOGICAL_PK IS NULL;
--------------------------------------------------------------------------------
SELECT CASE WHEN INT_DESG_JOB.GET_BICURRENCY('DesgTarjetasIndividual') ='Y' THEN
        'HOLA'
    ELSE
        'CHAO'
        END AS SALUDO FROM DUAL
--------------------------------------------------------------------------------
SELECT CASE WHEN INT_DESG_JOB.GET_BICURRENCY('DesgTarjetasIndividual') ='Si' THEN
        'HOLA'
    ELSE
        'CHAO'
        END AS SALUDO FROM DUAL
--------------------------------------------------------------------------------
SELECT * FROM PREPRODUCT WHERE  STATIC = INT_UTIL.GET_PRODUCTID_BY_NAME ('DesgTarjetasIndividual')
--------------------------------------------------------------------------------
UPDATE PREPRODUCT SET BIMONEDAINPUT = 'Si', BIMONEDAVALUE = 'No' WHERE  STATIC = INT_UTIL.GET_PRODUCTID_BY_NAME ('DesgTarjetasIndividual')
--------------------------------------------------------------------------------
SELECT
          A.IND_CARGADO, A.ASL_LOGICAL_PK,A.ID_CORRELATIVO, A.ARCHIVO_TRAMA, A.EVENTO_APLICAR, A.PRIMER_NOMBRE, A.SEGUNDO_NOMBRE, A.APELLIDO_PATERNO, A.APELLIDO_MATERNO, A.TIPO_DOCUMENTO, A.NUMERO_DOCUMENTO, A.FECHA_NACIMIENTO, A.DIRECCION, A.TELEFONO, A.MONEDA, A.FECHA_INICIO_VIGENCIA, A.FECHA_FIN_VIGENCIA, A.NUMERO_CERTIFICADO, A.NUMERO_POLIZA, A.PRIMA_ARCHIVO, A.IMPORTE_CREDITO, A.TASA_SEGURO, A.CODIGO_VENDEDOR, A.SALDO_CREDITO, A.PRODUCTO, A.SUB_PRODUCTO, A.CODIGO_UNICO_CLIENTE, A.NRO_CUOTA, A.PLAZO, A.NRO_TARJETA, A.MOTIVO, A.TIPO_POLIZA, A.SUB_PRODUCTO_PLAN, A.TIPO_ASEGURADO, A.CODDEPARTAMENTO, A.CODPROVINCIA, A.CODDISTRITO,
          DECODE(A.INDICADOR_PE, 'S', 'Si', 'No'), A.AGENCIA, A.NUMERO_CERTIFICADO_ANT, A.CORREO_ELECTRONICO, A.PRIMER_NOMBRE_CY, A.SEGUNDO_NOMBRE_CY, A.APELLIDO_PATERNO_CY, A.APELLIDO_MATERNO_CY, A.TIPO_DOCUMENTO_CY,
          A.NUMERO_DOCUMENTO_CY, A.FECHA_NACIMIENTO_CY, A.SEXO_CY, REPLACE(a.PORC_SOBREPRIMA, '%',''), REPLACE(a.PORC_SOBREPRIMA_CY, '%',''), REPLACE(a.MIL_EXTRAPRIMA, '%',''), REPLACE(a.MIL_EXTRAPRIMA_CY, '%',''), SEXO_TITULAR, FECHA_CANCELACION,
          TO_DATE (A.PERDIODO_BASE, 'MM-YYYY') AS PERIODO_BASE,
          INT_DESG_JOB.GET_FIRSTPART_NUMPOL(PRODUCTO, NUMERO_POLIZA, SUB_PRODUCTO, TIPO_POLIZA) || '-' || a.NUMERO_CERTIFICADO || DECODE(A.MONCOM, '01', '-1', '02','-2','','01')  NUM_POLIZA,
          CORRELATIVODPS, CORRELATIVODPS_CY, FECHA_DESEMBOLSO,
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
          ((COUNT(1) over (partition by a.NUMERO_POLIZA, a.NUMERO_CERTIFICADO, a.PERDIODO_BASE, a.EVENTO_APLICAR))-1) +                --pol_duplicado
          --((count(1) OVER (PARTITION BY A.CORRELATIVODPS))-1) +
          CASE WHEN INT_DESG_JOB.EVAL_COLECTIVO(A.PRODUCTO) = 1 THEN
            0
          ELSE
            NVL2(LENGTH(TRIM(A.SUB_PRODUCTO)), 0, 1) + NVL2(LENGTH(TRIM(A.TIPO_POLIZA)), 0, 1)
          END -- subProducto_nulo O codigoCanal_nulo
            AS NUM_ERRORS
        FROM INTERMEDIO_DESGRAVAMEN A
        WHERE archivo_trama = 'PRIMAS_NSAT_SOL_202208_TEST02.txt'---A.IND_CARGADO ='P' AND A.ASL_LOGICAL_PK IS NULL;
--------------------------------------------------------------------------------
update intermedio_desgravamen set ind_cargado = 'P'  WHERE archivo_trama = 'PRIMAS_NSAT_SOL_202208_TEST02.txt'
--------------------------------------------------------------------------------
select *  from intermedio_desgravamen WHERE id_correlativo = 7182833699
--------------------------------------------------------------------------------
select *  from intermedio_desgravamen WHERE MONCOM IS NOT NULL
--------------------------------------------------------------------------------
select *  from intermedio_desgravamen WHERE ARCHIVO_TRAMA = 'PRIMAS%'
--------------------------------------------------------------------------------
select *  from intermedio_desgravamen WHERE ARCHIVO_TRAMA = 'PRIMAS_NSAT%'
--------------------------------------------------------------------------------
select MONCOM  from intermedio_desgravamen
--------------------------------------------------------------------------------
select MONCTA  from intermedio_desgravamen
--------------------------------------------------------------------------------
SELECT * FROM PREPRODUCT
--------------------------------------------------------------------------------
SELECT DECODE(A.INDGENERARECIBOSINPUT, 'Si', 'Y', 'No','N') as formato_out
      FROM   PREPRODUCT A
      WHERE  A.STATIC = INT_UTIL.GET_PRODUCTID_BY_NAME ('DesgTarjetasIndividual')
--------------------------------------------------------------------------------
SELECT LPAD (A.INDGENERARECIBOSINPUT, 3, '0') as formato_out
      FROM   PREPRODUCT A
      WHERE  A.STATIC = INT_UTIL.GET_PRODUCTID_BY_NAME ('DesgTarjetasIndividual')
--------------------------------------------------------------------------------
select distinct producto from intermedio_desgravamen
--------------------------------------------------------------------------------
select moneda from intermedio_desgravamen
--------------------------------------------------------------------------------
select * from intermedio_desgravamen where IND_CARGADO <> 'S'
--------------------------------------------------------------------------------
select * from intermedio_desgravamen where IND_CARGADO <> 'S'
--------------------------------------------------------------------------------
select * from intermedio_desgravamen des where des.mon_comis is not null
--------------------------------------------------------------------------------
select des.mon_comis from intermedio_desgravamen des
--------------------------------------------------------------------------------
select * from intermedio_desgravamen
--------------------------------------------------------------------------------
SELECT
          A.IND_CARGADO, A.ASL_LOGICAL_PK,A.ID_CORRELATIVO, A.ARCHIVO_TRAMA, A.EVENTO_APLICAR, A.PRIMER_NOMBRE, A.SEGUNDO_NOMBRE, A.APELLIDO_PATERNO, A.APELLIDO_MATERNO, A.TIPO_DOCUMENTO, A.NUMERO_DOCUMENTO, A.FECHA_NACIMIENTO, A.DIRECCION, A.TELEFONO, A.MONEDA, A.FECHA_INICIO_VIGENCIA, A.FECHA_FIN_VIGENCIA, A.NUMERO_CERTIFICADO, A.NUMERO_POLIZA, A.PRIMA_ARCHIVO, A.IMPORTE_CREDITO, A.TASA_SEGURO, A.CODIGO_VENDEDOR, A.SALDO_CREDITO, A.PRODUCTO, A.SUB_PRODUCTO, A.CODIGO_UNICO_CLIENTE, A.NRO_CUOTA, A.PLAZO, A.NRO_TARJETA, A.MOTIVO, A.TIPO_POLIZA, A.SUB_PRODUCTO_PLAN, A.TIPO_ASEGURADO, A.CODDEPARTAMENTO, A.CODPROVINCIA, A.CODDISTRITO,
          DECODE(A.INDICADOR_PE, 'S', 'Si', 'No'), A.AGENCIA, A.NUMERO_CERTIFICADO_ANT, A.CORREO_ELECTRONICO, A.PRIMER_NOMBRE_CY, A.SEGUNDO_NOMBRE_CY, A.APELLIDO_PATERNO_CY, A.APELLIDO_MATERNO_CY, A.TIPO_DOCUMENTO_CY,
          A.NUMERO_DOCUMENTO_CY, A.FECHA_NACIMIENTO_CY, A.SEXO_CY, REPLACE(a.PORC_SOBREPRIMA, '%',''), REPLACE(a.PORC_SOBREPRIMA_CY, '%',''), REPLACE(a.MIL_EXTRAPRIMA, '%',''), REPLACE(a.MIL_EXTRAPRIMA_CY, '%',''), SEXO_TITULAR, FECHA_CANCELACION,
          TO_DATE (A.PERDIODO_BASE, 'MM-YYYY') AS PERIODO_BASE,
          INT_DESG_JOB.GET_FIRSTPART_NUMPOL(PRODUCTO, NUMERO_POLIZA, SUB_PRODUCTO, TIPO_POLIZA) || '-' || a.NUMERO_CERTIFICADO || DECODE(A.MONEDA, 'SOL', '-1', 'USD','-2','')  NUM_POLIZA,
          CORRELATIVODPS, CORRELATIVODPS_CY, FECHA_DESEMBOLSO,
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
          ((COUNT(1) over (partition by a.NUMERO_POLIZA, a.NUMERO_CERTIFICADO, a.PERDIODO_BASE, a.EVENTO_APLICAR))-1) +                --pol_duplicado
          --((count(1) OVER (PARTITION BY A.CORRELATIVODPS))-1) +
          CASE WHEN INT_DESG_JOB.EVAL_COLECTIVO(A.PRODUCTO) = 1 THEN
            0
          ELSE
            NVL2(LENGTH(TRIM(A.SUB_PRODUCTO)), 0, 1) + NVL2(LENGTH(TRIM(A.TIPO_POLIZA)), 0, 1)
          END -- subProducto_nulo O codigoCanal_nulo
            AS NUM_ERRORS
        FROM INTERMEDIO_DESGRAVAMEN A
        WHERE rownum <=20--A.IND_CARGADO IS NULL AND A.ASL_LOGICAL_PK IS NULL;
--------------------------------------------------------------------------------
SELECT
          A.IND_CARGADO, A.ASL_LOGICAL_PK,A.ID_CORRELATIVO, A.ARCHIVO_TRAMA, A.EVENTO_APLICAR, A.PRIMER_NOMBRE, A.SEGUNDO_NOMBRE, A.APELLIDO_PATERNO, A.APELLIDO_MATERNO, A.TIPO_DOCUMENTO, A.NUMERO_DOCUMENTO, A.FECHA_NACIMIENTO, A.DIRECCION, A.TELEFONO, A.MONEDA, A.FECHA_INICIO_VIGENCIA, A.FECHA_FIN_VIGENCIA, A.NUMERO_CERTIFICADO, A.NUMERO_POLIZA, A.PRIMA_ARCHIVO, A.IMPORTE_CREDITO, A.TASA_SEGURO, A.CODIGO_VENDEDOR, A.SALDO_CREDITO, A.PRODUCTO, A.SUB_PRODUCTO, A.CODIGO_UNICO_CLIENTE, A.NRO_CUOTA, A.PLAZO, A.NRO_TARJETA, A.MOTIVO, A.TIPO_POLIZA, A.SUB_PRODUCTO_PLAN, A.TIPO_ASEGURADO, A.CODDEPARTAMENTO, A.CODPROVINCIA, A.CODDISTRITO,
          DECODE(A.INDICADOR_PE, 'S', 'Si', 'No'), A.AGENCIA, A.NUMERO_CERTIFICADO_ANT, A.CORREO_ELECTRONICO, A.PRIMER_NOMBRE_CY, A.SEGUNDO_NOMBRE_CY, A.APELLIDO_PATERNO_CY, A.APELLIDO_MATERNO_CY, A.TIPO_DOCUMENTO_CY,
          A.NUMERO_DOCUMENTO_CY, A.FECHA_NACIMIENTO_CY, A.SEXO_CY, REPLACE(a.PORC_SOBREPRIMA, '%',''), REPLACE(a.PORC_SOBREPRIMA_CY, '%',''), REPLACE(a.MIL_EXTRAPRIMA, '%',''), REPLACE(a.MIL_EXTRAPRIMA_CY, '%',''), SEXO_TITULAR, FECHA_CANCELACION,
          TO_DATE (A.PERDIODO_BASE, 'MM-YYYY') AS PERIODO_BASE,
          INT_DESG_JOB.GET_FIRSTPART_NUMPOL(PRODUCTO, NUMERO_POLIZA, SUB_PRODUCTO, TIPO_POLIZA) || '-' || a.NUMERO_CERTIFICADO || DECODE(A.MONEDA, 'SOL', '-1', 'USD','-2','')  NUM_POLIZA,
          CORRELATIVODPS, CORRELATIVODPS_CY, FECHA_DESEMBOLSO,
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
          ((COUNT(1) over (partition by a.NUMERO_POLIZA, a.NUMERO_CERTIFICADO, a.PERDIODO_BASE, a.EVENTO_APLICAR))-1) +                --pol_duplicado
          --((count(1) OVER (PARTITION BY A.CORRELATIVODPS))-1) +
          CASE WHEN INT_DESG_JOB.EVAL_COLECTIVO(A.PRODUCTO) = 1 THEN
            0
          ELSE
            NVL2(LENGTH(TRIM(A.SUB_PRODUCTO)), 0, 1) + NVL2(LENGTH(TRIM(A.TIPO_POLIZA)), 0, 1)
          END -- subProducto_nulo O codigoCanal_nulo
            AS NUM_ERRORS
        FROM INTERMEDIO_DESGRAVAMEN A
        WHERE rownum <=1--A.IND_CARGADO IS NULL AND A.ASL_LOGICAL_PK IS NULL;
--------------------------------------------------------------------------------
SELECT * FROM INT_DESG_PROCESS WHERE MONEDA <> 'SOL'
--------------------------------------------------------------------------------
SELECT * FROM INTERMEDIO_DESGRAVAMEN WHERE NUMERO_CERTIFICADO = '500105-4552188'
--------------------------------------------------------------------------------
select * from prepolicy where numeropolizainput = '500105-500030'
--------------------------------------------------------------------------------
SELECT * FROM INTERMEDIO_DESGRAVAMEN WHERE NUMERO_CERTIFICADO = '500105'
--------------------------------------------------------------------------------
SELECT '123456' || DECODE('1', '1', '-1', '2','-2') FROM DUAL
--------------------------------------------------------------------------------
SELECT '123456' || DECODE('0', '1', '-1', '2','-2') FROM DUAL
--------------------------------------------------------------------------------
SELECT
          A.IND_CARGADO, A.ASL_LOGICAL_PK,A.ID_CORRELATIVO, A.ARCHIVO_TRAMA, A.EVENTO_APLICAR, A.PRIMER_NOMBRE, A.SEGUNDO_NOMBRE, A.APELLIDO_PATERNO, A.APELLIDO_MATERNO, A.TIPO_DOCUMENTO, A.NUMERO_DOCUMENTO, A.FECHA_NACIMIENTO, A.DIRECCION, A.TELEFONO, A.MONEDA, A.FECHA_INICIO_VIGENCIA, A.FECHA_FIN_VIGENCIA, A.NUMERO_CERTIFICADO, A.NUMERO_POLIZA, A.PRIMA_ARCHIVO, A.IMPORTE_CREDITO, A.TASA_SEGURO, A.CODIGO_VENDEDOR, A.SALDO_CREDITO, A.PRODUCTO, A.SUB_PRODUCTO, A.CODIGO_UNICO_CLIENTE, A.NRO_CUOTA, A.PLAZO, A.NRO_TARJETA, A.MOTIVO, A.TIPO_POLIZA, A.SUB_PRODUCTO_PLAN, A.TIPO_ASEGURADO, A.CODDEPARTAMENTO, A.CODPROVINCIA, A.CODDISTRITO,
          DECODE(A.INDICADOR_PE, 'S', 'Si', 'No'), A.AGENCIA, A.NUMERO_CERTIFICADO_ANT, A.CORREO_ELECTRONICO, A.PRIMER_NOMBRE_CY, A.SEGUNDO_NOMBRE_CY, A.APELLIDO_PATERNO_CY, A.APELLIDO_MATERNO_CY, A.TIPO_DOCUMENTO_CY,
          A.NUMERO_DOCUMENTO_CY, A.FECHA_NACIMIENTO_CY, A.SEXO_CY, REPLACE(a.PORC_SOBREPRIMA, '%',''), REPLACE(a.PORC_SOBREPRIMA_CY, '%',''), REPLACE(a.MIL_EXTRAPRIMA, '%',''), REPLACE(a.MIL_EXTRAPRIMA_CY, '%',''), SEXO_TITULAR, FECHA_CANCELACION,
          TO_DATE (A.PERDIODO_BASE, 'MM-YYYY') AS PERIODO_BASE,
          INT_DESG_JOB.GET_FIRSTPART_NUMPOL(PRODUCTO, NUMERO_POLIZA, SUB_PRODUCTO, TIPO_POLIZA) || '-' || a.NUMERO_CERTIFICADO as NUM_POLIZA,
          CORRELATIVODPS, CORRELATIVODPS_CY, FECHA_DESEMBOLSO,
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
          ((COUNT(1) over (partition by a.NUMERO_POLIZA, a.NUMERO_CERTIFICADO, a.PERDIODO_BASE, a.EVENTO_APLICAR))-1) +                --pol_duplicado
          --((count(1) OVER (PARTITION BY A.CORRELATIVODPS))-1) +
          CASE WHEN INT_DESG_JOB.EVAL_COLECTIVO(A.PRODUCTO) = 1 THEN
            0
          ELSE
            NVL2(LENGTH(TRIM(A.SUB_PRODUCTO)), 0, 1) + NVL2(LENGTH(TRIM(A.TIPO_POLIZA)), 0, 1)
          END -- subProducto_nulo O codigoCanal_nulo
            AS NUM_ERRORS
        FROM INTERMEDIO_DESGRAVAMEN A
        WHERE rownum <=20--A.IND_CARGADO IS NULL AND A.ASL_LOGICAL_PK IS NULL;
--------------------------------------------------------------------------------
SELECT DECODE('ALO', '1', 'SOL', '2','USD','VACIO') FROM DUAL
--------------------------------------------------------------------------------
SELECT DECODE('2', '1', 'SOL', '2','USD','SOL') FROM DUAL
--------------------------------------------------------------------------------
SELECT DECODE('1', '1', 'SOL', '2','USD','SOL') FROM DUAL
--------------------------------------------------------------------------------
SELECT DECODE('0', '1', 'SOL', '2','USD','SOL') FROM DUAL
--------------------------------------------------------------------------------
SELECT DECODE('S', 'S', 'Si', 'No') FROM DUAL
--------------------------------------------------------------------------------
SELECT DECODE('Si', 'S', 'Si', 'No') FROM DUAL
--------------------------------------------------------------------------------
select* from STPO_POLICYASLOGICAL
--------------------------------------------------------------------------------
select* from STPO_POLICYASLHEADER
--------------------------------------------------------------------------------
SELECT * FROM INTERMEDIO_DESGRAVAMEN
--------------------------------------------------------------------------------
select * from prepolicy where numeropolizainput = '500105-4552188'
--------------------------------------------------------------------------------
SELECT
          A.ID_CORRELATIVO, A.ARCHIVO_TRAMA, A.EVENTO_APLICAR, A.PRIMER_NOMBRE, A.SEGUNDO_NOMBRE, A.APELLIDO_PATERNO, A.APELLIDO_MATERNO, A.TIPO_DOCUMENTO, A.NUMERO_DOCUMENTO, A.FECHA_NACIMIENTO, A.DIRECCION, A.TELEFONO, A.MONEDA, A.FECHA_INICIO_VIGENCIA, A.FECHA_FIN_VIGENCIA, A.NUMERO_CERTIFICADO, A.NUMERO_POLIZA, A.PRIMA_ARCHIVO, A.IMPORTE_CREDITO, A.TASA_SEGURO, A.CODIGO_VENDEDOR, A.SALDO_CREDITO, A.PRODUCTO, A.SUB_PRODUCTO, A.CODIGO_UNICO_CLIENTE, A.NRO_CUOTA, A.PLAZO, A.NRO_TARJETA, A.MOTIVO, A.TIPO_POLIZA, A.SUB_PRODUCTO_PLAN, A.TIPO_ASEGURADO, A.CODDEPARTAMENTO, A.CODPROVINCIA, A.CODDISTRITO,
          DECODE(A.INDICADOR_PE, 'S', 'Si', 'No'), A.AGENCIA, A.NUMERO_CERTIFICADO_ANT, A.CORREO_ELECTRONICO, A.PRIMER_NOMBRE_CY, A.SEGUNDO_NOMBRE_CY, A.APELLIDO_PATERNO_CY, A.APELLIDO_MATERNO_CY, A.TIPO_DOCUMENTO_CY,
          A.NUMERO_DOCUMENTO_CY, A.FECHA_NACIMIENTO_CY, A.SEXO_CY, REPLACE(a.PORC_SOBREPRIMA, '%',''), REPLACE(a.PORC_SOBREPRIMA_CY, '%',''), REPLACE(a.MIL_EXTRAPRIMA, '%',''), REPLACE(a.MIL_EXTRAPRIMA_CY, '%',''), SEXO_TITULAR, FECHA_CANCELACION,
          TO_DATE (A.PERDIODO_BASE, 'MM-YYYY') AS PERIODO_BASE,
          INT_DESG_JOB.GET_FIRSTPART_NUMPOL(PRODUCTO, NUMERO_POLIZA, SUB_PRODUCTO, TIPO_POLIZA) || '-' || a.NUMERO_CERTIFICADO as NUM_POLIZA,
          CORRELATIVODPS, CORRELATIVODPS_CY, FECHA_DESEMBOLSO,
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
          ((COUNT(1) over (partition by a.NUMERO_POLIZA, a.NUMERO_CERTIFICADO, a.PERDIODO_BASE, a.EVENTO_APLICAR))-1) +                --pol_duplicado
          --((count(1) OVER (PARTITION BY A.CORRELATIVODPS))-1) +
          CASE WHEN INT_DESG_JOB.EVAL_COLECTIVO(A.PRODUCTO) = 1 THEN
            0
          ELSE
            NVL2(LENGTH(TRIM(A.SUB_PRODUCTO)), 0, 1) + NVL2(LENGTH(TRIM(A.TIPO_POLIZA)), 0, 1)
          END -- subProducto_nulo O codigoCanal_nulo
            AS NUM_ERRORS
        FROM INTERMEDIO_DESGRAVAMEN A
        WHERE rownum <=20--A.IND_CARGADO IS NULL AND A.ASL_LOGICAL_PK IS NULL;
--------------------------------------------------------------------------------
SELECT
          A.ID_CORRELATIVO, A.ARCHIVO_TRAMA, A.EVENTO_APLICAR, A.PRIMER_NOMBRE, A.SEGUNDO_NOMBRE, A.APELLIDO_PATERNO, A.APELLIDO_MATERNO, A.TIPO_DOCUMENTO, A.NUMERO_DOCUMENTO, A.FECHA_NACIMIENTO, A.DIRECCION, A.TELEFONO, A.MONEDA, A.FECHA_INICIO_VIGENCIA, A.FECHA_FIN_VIGENCIA, A.NUMERO_CERTIFICADO, A.NUMERO_POLIZA, A.PRIMA_ARCHIVO, A.IMPORTE_CREDITO, A.TASA_SEGURO, A.CODIGO_VENDEDOR, A.SALDO_CREDITO, A.PRODUCTO, A.SUB_PRODUCTO, A.CODIGO_UNICO_CLIENTE, A.NRO_CUOTA, A.PLAZO, A.NRO_TARJETA, A.MOTIVO, A.TIPO_POLIZA, A.SUB_PRODUCTO_PLAN, A.TIPO_ASEGURADO, A.CODDEPARTAMENTO, A.CODPROVINCIA, A.CODDISTRITO,
          DECODE(A.INDICADOR_PE, 'S', 'Si', 'No'), A.AGENCIA, A.NUMERO_CERTIFICADO_ANT, A.CORREO_ELECTRONICO, A.PRIMER_NOMBRE_CY, A.SEGUNDO_NOMBRE_CY, A.APELLIDO_PATERNO_CY, A.APELLIDO_MATERNO_CY, A.TIPO_DOCUMENTO_CY,
          A.NUMERO_DOCUMENTO_CY, A.FECHA_NACIMIENTO_CY, A.SEXO_CY, REPLACE(a.PORC_SOBREPRIMA, '%',''), REPLACE(a.PORC_SOBREPRIMA_CY, '%',''), REPLACE(a.MIL_EXTRAPRIMA, '%',''), REPLACE(a.MIL_EXTRAPRIMA_CY, '%',''), SEXO_TITULAR, FECHA_CANCELACION,
          TO_DATE (A.PERDIODO_BASE, 'MM-YYYY') AS PERIODO_BASE,
          INT_DESG_JOB.GET_FIRSTPART_NUMPOL(PRODUCTO, NUMERO_POLIZA, SUB_PRODUCTO, TIPO_POLIZA) || '-' || a.NUMERO_CERTIFICADO as NUM_POLIZA,
          CORRELATIVODPS, CORRELATIVODPS_CY, FECHA_DESEMBOLSO,
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
          ((COUNT(1) over (partition by a.NUMERO_POLIZA, a.NUMERO_CERTIFICADO, a.PERDIODO_BASE, a.EVENTO_APLICAR))-1) +                --pol_duplicado
          --((count(1) OVER (PARTITION BY A.CORRELATIVODPS))-1) +
          CASE WHEN INT_DESG_JOB.EVAL_COLECTIVO(A.PRODUCTO) = 1 THEN
            0
          ELSE
            NVL2(LENGTH(TRIM(A.SUB_PRODUCTO)), 0, 1) + NVL2(LENGTH(TRIM(A.TIPO_POLIZA)), 0, 1)
          END -- subProducto_nulo O codigoCanal_nulo
            AS NUM_ERRORS
        FROM INTERMEDIO_DESGRAVAMEN A
        WHERE A.IND_CARGADO IS NULL AND A.ASL_LOGICAL_PK IS NULL
--------------------------------------------------------------------------------
SELECT * FROM INT_DESG_PROCESS
--------------------------------------------------------------------------------
SELECT * FROM INTERMEDIO_DESGRAVAMEN
--------------------------------------------------------------------------------
SELECT CO.item, pr.numeropolizainput, co.id operationpk, et.description evento , p.description Producto,
S.CODIGOPLANINPUT codPlan, DESCRIPCIONPLANINPUT planDescription , PR.VIGENCIAINPUT VIGENCIA, MONEDAINPUT MONEDA, STPO.pal_recordid, STPO.pal_status
FROM POLICYDCO PDCO, AGREGATEDPOLICY AP, CONTEXTOPERATION CO, EVENTDCO EDCO, EVENTTYPE ET  , prepolicy pr , stpo_policyaslogical STPO,
PLAN PL INNER JOIN PREPLANS S ON S.STATIC = PL.PLANID
INNER JOIN PRODUCT P ON PL.PRODUCTID = P.PRODUCTID  INNER JOIN PREPRODUCT PP ON P.PRODUCTID = PP.STATIC
INNER JOIN INSURANCEOBJECTDCO IODCO ON IODCO.PLANID = PL.PLANID
WHERE PDCO.AGREGATEDOBJECTID=AP.AGREGATEDPOLICYID
and  pr.pk = pdco.dcoid
AND AP.PRODUCTID=P.PRODUCTID
AND CO.ID=PDCO.OPERATIONPK
AND PDCO.OPERATIONPK=EDCO.OPERATIONPK
AND EDCO.EVENTTYPEID=ET.EVENTTYPEID
AND EDCO.POLICYPK = CO.ITEM
and IODCO.OPERATIONPK = CO.id
and pr.numeropolizainput = STPO.pal_policynumber and stpo.pal_status = 1
AND P.DESCRIPTION IN ('DesgravamenBBVADesempleo') --('DesgravamenBBVATC', 'DesgravamenBANBIFTC','DesgravamenBBVATC','DesgravamenFORUM')
 AND et.description IN ('Consumo')
 AND S.DESCRIPCIONPLANINPUT = 'Plan Premier'
-- AND pdco.initialdate between to_date('01/01/2022','dd/mm/yyyy') and to_date('01/07/2022','dd/mm/yyyy') 
AND pdco.initialdate >  to_date('10/08/2022','dd/mm/yyyy')
AND CO.STATUS =  2
and co.id = ap.operationpk
and ROWNUM < 100
order by CO.id desc
--------------------------------------------------------------------------------
SELECT CO.item, pr.numeropolizainput, co.id operationpk, et.description evento , p.description Producto,
S.CODIGOPLANINPUT codPlan, DESCRIPCIONPLANINPUT planDescription , PR.VIGENCIAINPUT VIGENCIA, MONEDAINPUT MONEDA, STPO.pal_recordid, STPO.pal_status
FROM POLICYDCO PDCO, AGREGATEDPOLICY AP, CONTEXTOPERATION CO, EVENTDCO EDCO, EVENTTYPE ET  , prepolicy pr , stpo_policyaslogical STPO,
PLAN PL INNER JOIN PREPLANS S ON S.STATIC = PL.PLANID
INNER JOIN PRODUCT P ON PL.PRODUCTID = P.PRODUCTID  INNER JOIN PREPRODUCT PP ON P.PRODUCTID = PP.STATIC
INNER JOIN INSURANCEOBJECTDCO IODCO ON IODCO.PLANID = PL.PLANID
WHERE PDCO.AGREGATEDOBJECTID=AP.AGREGATEDPOLICYID
and  pr.pk = pdco.dcoid
AND AP.PRODUCTID=P.PRODUCTID
AND CO.ID=PDCO.OPERATIONPK
AND PDCO.OPERATIONPK=EDCO.OPERATIONPK
AND EDCO.EVENTTYPEID=ET.EVENTTYPEID
AND EDCO.POLICYPK = CO.ITEM
and IODCO.OPERATIONPK = CO.id
and pr.numeropolizainput = STPO.pal_policynumber
AND P.DESCRIPTION IN ('DesgravamenBBVADesempleo') --('DesgravamenBBVATC', 'DesgravamenBANBIFTC','DesgravamenBBVATC','DesgravamenFORUM')
 AND et.description IN ('Consumo')
 AND S.DESCRIPCIONPLANINPUT = 'Plan Premier'
-- AND pdco.initialdate between to_date('01/01/2022','dd/mm/yyyy') and to_date('01/07/2022','dd/mm/yyyy') 
AND pdco.initialdate >  to_date('10/08/2022','dd/mm/yyyy')
AND CO.STATUS =  2
and co.id = ap.operationpk
and ROWNUM < 100
order by CO.id desc
--------------------------------------------------------------------------------
SELECT CO.item, pr.numeropolizainput, co.id operationpk, et.description evento , p.description Producto,
S.CODIGOPLANINPUT codPlan, DESCRIPCIONPLANINPUT planDescription , PR.VIGENCIAINPUT VIGENCIA, MONEDAINPUT MONEDA,  pdco.initialdate
FROM POLICYDCO PDCO, AGREGATEDPOLICY AP, CONTEXTOPERATION CO, EVENTDCO EDCO, EVENTTYPE ET  , prepolicy pr , -- cobertura cob, CoverageDCO cdco,
PLAN PL INNER JOIN PREPLANS S ON S.STATIC = PL.PLANID
              INNER JOIN PRODUCT P ON PL.PRODUCTID = P.PRODUCTID  INNER JOIN PREPRODUCT PP ON P.PRODUCTID = PP.STATIC
            INNER JOIN INSURANCEOBJECTDCO IODCO ON IODCO.PLANID = PL.PLANID
            --INNER JOIN stpo_policyaslogical STPO ON pr.numeropolizainput = STPO.pal_policynumber 
WHERE PDCO.AGREGATEDOBJECTID=AP.AGREGATEDPOLICYID
and  pr.pk = pdco.dcoid
AND AP.PRODUCTID=P.PRODUCTID
AND CO.ID=PDCO.OPERATIONPK
AND PDCO.OPERATIONPK=EDCO.OPERATIONPK
AND EDCO.EVENTTYPEID=ET.EVENTTYPEID
AND EDCO.POLICYPK = CO.ITEM
and IODCO.OPERATIONPK = CO.id
AND P.DESCRIPTION IN ('DesgravamenBBVADesempleo') --('DesgravamenBBVATC', 'DesgravamenBANBIFTC','DesgravamenBBVATC','DesgravamenFORUM')
 AND et.description IN ('Consumo')
 AND S.DESCRIPCIONPLANINPUT = 'Plan Premier'
-- AND pdco.initialdate between to_date('01/01/2022','dd/mm/yyyy') and to_date('01/07/2022','dd/mm/yyyy') 
AND pdco.initialdate >  to_date('10/08/2022','dd/mm/yyyy')
AND CO.STATUS =  2
and co.id = ap.operationpk
and ROWNUM < 100
order by CO.id desc
--------------------------------------------------------------------------------
SELECT RUDESG.* FROM PREPOLICY PRE
JOIN CONTEXTOPERATION CO ON CO.ITEM = PRE.STATIC
JOIN AGREGATEDRISKUNIT AR ON AR.OPERATIONPK = CO.ID
JOIN RISKUNITDCO RDCO ON RDCO.OPERATIONPK = AR.OPERATIONPK
JOIN PRERISKUNITS PRU ON PRU.PK = DCOID
JOIN RUDESGRAVAMEN RUDESG ON RUDESG.PK = PRU.PK
WHERE PRE.NUMEROPOLIZAINPUT IN ('00010157040352000')
--------------------------------------------------------------------------------
SELECT * FROM PREPOLICY WHERE NUMEROPOLIZAINPUT ='500105-4552188'
--------------------------------------------------------------------------------
SELECT COUNT(1) FROM AGREGATEDPOLICY WHERE PRODUCTID = 73585
--------------------------------------------------------------------------------
SELECT * FROM AGREGATEDPOLICY WHERE PRODUCTID = 73585
--------------------------------------------------------------------------------
SELECT * FROM PRODUCT WHERE DESCRIPTION = 'DesgTarjetasIndividual'
--------------------------------------------------------------------------------
SELECT * FROM PREPOLICY
--------------------------------------------------------------------------------
select * from product where description like '%Individual%'
--------------------------------------------------------------------------------
select * from product
--------------------------------------------------------------------------------
SELECT * FROM OPENITEM
--------------------------------------------------------------------------------
update stpo_policyaslogical set pal_status = 0 where pal_recordid in (210001043,
210000832,
210058548,
210058546,
210058317,
210059234,
310003271)
--------------------------------------------------------------------------------
update stpo_policyaslogical set pal_status = 6 where pal_status = 0
--------------------------------------------------------------------------------
select pal_prodcode, palh_filename, pal_recordid, pal_policynumber, pal_status
from
STPO_POLICYASLOGICAL where  pal_recordid in (
select acd.idetrans
from int_acuerdo ac, int_acuerdo_det acd
where ac.idelotegrp = acd.idelotegrp
and acd.tipope = 1  -- ESto significa:  decode(tipope,1,'Alta',2,'Baja',4,'Pago',6,'Anulacion','') Operacion
)
--and  pal_status = 1
AND pal_policynumber IN ('00010157040352000',
'00010157040380900',
'00010157034460100',
'00010157034458300',
'00010157040355300',
'00010157040353000',
'00010157040355800',
'00010157040376600',
'00010157040376100')
--------------------------------------------------------------------------------
select pal_prodcode, palh_filename, pal_recordid, pal_policynumber, pal_status
from
STPO_POLICYASLOGICAL where  pal_recordid in (
select acd.idetrans
from int_acuerdo ac, int_acuerdo_det acd
where ac.idelotegrp = acd.idelotegrp
and acd.tipope = 1  -- ESto significa:  decode(tipope,1,'Alta',2,'Baja',4,'Pago',6,'Anulacion','') Operacion
)
--and  pal_status = 1
AND pal_policynumber IN ('00010157040352000',
'00010157040380900',
'00010157034460100',
'00010157034458300',
'00010157040355300',
'00010157040353000',
'00010157040355800',
'00010157040353600',
'00010157040376600',
'00010157040376100')
--------------------------------------------------------------------------------
SELECT CO.item, pr.numeropolizainput, co.id operationpk, et.description evento , p.description Producto,
S.CODIGOPLANINPUT codPlan, DESCRIPCIONPLANINPUT planDescription , PR.VIGENCIAINPUT VIGENCIA, MONEDAINPUT MONEDA, CO.ENDING_DATE
FROM POLICYDCO PDCO, AGREGATEDPOLICY AP, CONTEXTOPERATION CO, EVENTDCO EDCO, EVENTTYPE ET  , prepolicy pr , -- cobertura cob, CoverageDCO cdco,
PLAN PL INNER JOIN PREPLANS S ON S.STATIC = PL.PLANID
              INNER JOIN PRODUCT P ON PL.PRODUCTID = P.PRODUCTID  INNER JOIN PREPRODUCT PP ON P.PRODUCTID = PP.STATIC
            INNER JOIN INSURANCEOBJECTDCO IODCO ON IODCO.PLANID = PL.PLANID
WHERE PDCO.AGREGATEDOBJECTID=AP.AGREGATEDPOLICYID
and  pr.pk = pdco.dcoid
AND AP.PRODUCTID=P.PRODUCTID
AND CO.ID=PDCO.OPERATIONPK
AND PDCO.OPERATIONPK=EDCO.OPERATIONPK
AND EDCO.EVENTTYPEID=ET.EVENTTYPEID
AND EDCO.POLICYPK = CO.ITEM
and IODCO.OPERATIONPK = CO.id
AND P.DESCRIPTION IN ('DesgravamenBBVADesempleo')
 AND PDCO.INITIALDATE < to_date('10/08/2022','dd/mm/yyyy')
AND CO.STATUS =  2
AND S.DESCRIPCIONPLANINPUT = 'Plan Premier'
and co.id = ap.operationpk
and ROWNUM < 100
order by CO.id desc
--------------------------------------------------------------------------------
SELECT CO.item, pr.numeropolizainput, co.id operationpk, et.description evento , p.description Producto,
S.CODIGOPLANINPUT codPlan, DESCRIPCIONPLANINPUT planDescription , PR.VIGENCIAINPUT VIGENCIA, MONEDAINPUT MONEDA, CO.ENDING_DATE
FROM POLICYDCO PDCO, AGREGATEDPOLICY AP, CONTEXTOPERATION CO, EVENTDCO EDCO, EVENTTYPE ET  , prepolicy pr , -- cobertura cob, CoverageDCO cdco,
PLAN PL INNER JOIN PREPLANS S ON S.STATIC = PL.PLANID
              INNER JOIN PRODUCT P ON PL.PRODUCTID = P.PRODUCTID  INNER JOIN PREPRODUCT PP ON P.PRODUCTID = PP.STATIC
            INNER JOIN INSURANCEOBJECTDCO IODCO ON IODCO.PLANID = PL.PLANID
WHERE PDCO.AGREGATEDOBJECTID=AP.AGREGATEDPOLICYID
and  pr.pk = pdco.dcoid
AND AP.PRODUCTID=P.PRODUCTID
AND CO.ID=PDCO.OPERATIONPK
AND PDCO.OPERATIONPK=EDCO.OPERATIONPK
AND EDCO.EVENTTYPEID=ET.EVENTTYPEID
AND EDCO.POLICYPK = CO.ITEM
and IODCO.OPERATIONPK = CO.id
AND P.DESCRIPTION IN ('DesgravamenBBVADesempleo')
 AND PDCO.INITIALDATE > to_date('10/08/2022','dd/mm/yyyy')
AND CO.STATUS =  2
AND S.DESCRIPCIONPLANINPUT = 'Plan Premier'
and co.id = ap.operationpk
and ROWNUM < 100
order by CO.id desc
--------------------------------------------------------------------------------
SELECT CO.item, pr.numeropolizainput, co.id operationpk, et.description evento , p.description Producto,
S.CODIGOPLANINPUT codPlan, DESCRIPCIONPLANINPUT planDescription , PR.VIGENCIAINPUT VIGENCIA, MONEDAINPUT MONEDA, CO.ENDING_DATE
FROM POLICYDCO PDCO, AGREGATEDPOLICY AP, CONTEXTOPERATION CO, EVENTDCO EDCO, EVENTTYPE ET  , prepolicy pr , -- cobertura cob, CoverageDCO cdco,
PLAN PL INNER JOIN PREPLANS S ON S.STATIC = PL.PLANID
              INNER JOIN PRODUCT P ON PL.PRODUCTID = P.PRODUCTID  INNER JOIN PREPRODUCT PP ON P.PRODUCTID = PP.STATIC
            INNER JOIN INSURANCEOBJECTDCO IODCO ON IODCO.PLANID = PL.PLANID
WHERE PDCO.AGREGATEDOBJECTID=AP.AGREGATEDPOLICYID
and  pr.pk = pdco.dcoid
AND AP.PRODUCTID=P.PRODUCTID
AND CO.ID=PDCO.OPERATIONPK
AND PDCO.OPERATIONPK=EDCO.OPERATIONPK
AND EDCO.EVENTTYPEID=ET.EVENTTYPEID
AND EDCO.POLICYPK = CO.ITEM
and IODCO.OPERATIONPK = CO.id
AND P.DESCRIPTION IN ('DesgravamenBBVADesempleo')
 AND CO.ENDING_DATE > to_date('01/01/2019','dd/mm/yyyy')
AND CO.STATUS =  2
AND S.DESCRIPCIONPLANINPUT = 'Plan Premier'
and co.id = ap.operationpk
and ROWNUM < 30
order by CO.id desc
--------------------------------------------------------------------------------
SELECT CO.item, pr.numeropolizainput, co.id operationpk, et.description evento , p.description Producto,
S.CODIGOPLANINPUT codPlan, DESCRIPCIONPLANINPUT planDescription , PR.VIGENCIAINPUT VIGENCIA, MONEDAINPUT MONEDA, CO.ENDING_DATE
FROM POLICYDCO PDCO, AGREGATEDPOLICY AP, CONTEXTOPERATION CO, EVENTDCO EDCO, EVENTTYPE ET  , prepolicy pr , -- cobertura cob, CoverageDCO cdco,
PLAN PL INNER JOIN PREPLANS S ON S.STATIC = PL.PLANID
              INNER JOIN PRODUCT P ON PL.PRODUCTID = P.PRODUCTID  INNER JOIN PREPRODUCT PP ON P.PRODUCTID = PP.STATIC
            INNER JOIN INSURANCEOBJECTDCO IODCO ON IODCO.PLANID = PL.PLANID
WHERE PDCO.AGREGATEDOBJECTID=AP.AGREGATEDPOLICYID
and  pr.pk = pdco.dcoid
AND AP.PRODUCTID=P.PRODUCTID
AND CO.ID=PDCO.OPERATIONPK
AND PDCO.OPERATIONPK=EDCO.OPERATIONPK
AND EDCO.EVENTTYPEID=ET.EVENTTYPEID
AND EDCO.POLICYPK = CO.ITEM
and IODCO.OPERATIONPK = CO.id
AND P.DESCRIPTION IN ('DesgravamenBBVADesempleo')
 AND CO.ENDING_DATE > to_date('01/01/2019','dd/mm/yyyy')
AND CO.STATUS =  2
and co.id = ap.operationpk
and ROWNUM < 30
order by CO.id desc
--------------------------------------------------------------------------------
SELECT CO.item, pr.numeropolizainput, co.id operationpk, et.description evento , p.description Producto,
S.CODIGOPLANINPUT codPlan, DESCRIPCIONPLANINPUT planDescription , PR.VIGENCIAINPUT VIGENCIA, MONEDAINPUT MONEDA, CO.ENDING_DATE
FROM POLICYDCO PDCO, AGREGATEDPOLICY AP, CONTEXTOPERATION CO, EVENTDCO EDCO, EVENTTYPE ET  , prepolicy pr , -- cobertura cob, CoverageDCO cdco,
PLAN PL INNER JOIN PREPLANS S ON S.STATIC = PL.PLANID
              INNER JOIN PRODUCT P ON PL.PRODUCTID = P.PRODUCTID  INNER JOIN PREPRODUCT PP ON P.PRODUCTID = PP.STATIC
            INNER JOIN INSURANCEOBJECTDCO IODCO ON IODCO.PLANID = PL.PLANID
WHERE PDCO.AGREGATEDOBJECTID=AP.AGREGATEDPOLICYID
and  pr.pk = pdco.dcoid
AND AP.PRODUCTID=P.PRODUCTID
AND CO.ID=PDCO.OPERATIONPK
AND PDCO.OPERATIONPK=EDCO.OPERATIONPK
AND EDCO.EVENTTYPEID=ET.EVENTTYPEID
AND EDCO.POLICYPK = CO.ITEM
and IODCO.OPERATIONPK = CO.id
AND P.DESCRIPTION IN ('DesgravamenBBVADesempleo')
 AND CO.ENDING_DATE > to_date('01/01/2019','dd/mm/yyyy')
AND CO.STATUS =  2
--------------------------------------------------------------------------------
select pal_prodcode, palh_filename, pal_recordid, pal_policynumber, pal_status
from
STPO_POLICYASLOGICAL where  pal_recordid in (
select acd.idetrans
from int_acuerdo ac, int_acuerdo_det acd
where ac.idelotegrp = acd.idelotegrp
and ac.codprod in (select sasvalue from APP_VIDA.rimac_equivalencies
where property ='Producto'
and equivalence = 'DesgravamenBBVADesempleo' )
and acd.tipope = 1  -- ESto significa:  decode(tipope,1,'Alta',2,'Baja',4,'Pago',6,'Anulacion','') Operacion
and ac.feccreacion >=  to_date('01/01/2019','dd/mm/yyyy')  )
and  pal_status = 1
--------------------------------------------------------------------------------
select sasvalue from APP_VIDA.rimac_equivalencies
where property ='Producto'
and equivalence = 'DesgravamenBBVADesempleo'
--------------------------------------------------------------------------------
update rudesgravamen set tipodevolucioninput='Básico',SUBPLANDESGRAVAMENINPUT='PlanConticasaB' where pk = 29742352504
--------------------------------------------------------------------------------
SELECT RUDESG.* FROM PREPOLICY PRE
JOIN CONTEXTOPERATION CO ON CO.ITEM = PRE.STATIC
JOIN AGREGATEDRISKUNIT AR ON AR.OPERATIONPK = CO.ID
JOIN RISKUNITDCO RDCO ON RDCO.OPERATIONPK = AR.OPERATIONPK
JOIN PRERISKUNITS PRU ON PRU.PK = DCOID
JOIN RUDESGRAVAMEN RUDESG ON RUDESG.PK = PRU.PK
WHERE PRE.NUMEROPOLIZAINPUT = '00010102010679600' --AND RUDESG.TIPODEVOLUCIONINPUT ='Básico' AND RUDESG.SUBPLANDESGRAVAMENINPUT IS NOT NULL
and ROWNUM < 30
--------------------------------------------------------------------------------
select * from stpo_policyaslogical where pal_recordid in (3778625)
--------------------------------------------------------------------------------
update rudesgravamen set tipodevolucioninput='Básico',SUBPLANDESGRAVAMENINPUT='PlanConticasaB' where pk = 29241726489
--------------------------------------------------------------------------------
SELECT RUDESG.* FROM PREPOLICY PRE
JOIN CONTEXTOPERATION CO ON CO.ITEM = PRE.STATIC
JOIN AGREGATEDRISKUNIT AR ON AR.OPERATIONPK = CO.ID
JOIN RISKUNITDCO RDCO ON RDCO.OPERATIONPK = AR.OPERATIONPK
JOIN PRERISKUNITS PRU ON PRU.PK = DCOID
JOIN RUDESGRAVAMEN RUDESG ON RUDESG.PK = PRU.PK
WHERE PRE.NUMEROPOLIZAINPUT = '0001010201841400' --AND RUDESG.TIPODEVOLUCIONINPUT ='Básico' AND RUDESG.SUBPLANDESGRAVAMENINPUT IS NOT NULL
and ROWNUM < 30
--------------------------------------------------------------------------------
update stpo_policyaslogical set pal_status = 0 where pal_recordid in (3778625)
--------------------------------------------------------------------------------
select pal_prodcode, palh_filename, pal_recordid, pal_policynumber, pal_status
from
STPO_POLICYASLOGICAL where  pal_recordid in (
select acd.idetrans
from int_acuerdo ac, int_acuerdo_det acd
where ac.idelotegrp = acd.idelotegrp
and acd.tipope = 1  -- ESto significa:  decode(tipope,1,'Alta',2,'Baja',4,'Pago',6,'Anulacion','') Operacion
)
--and  pal_status = 1
AND pal_policynumber = '0001010201841400'
--------------------------------------------------------------------------------
SELECT * FROM STPO_POLICYASLOGICAL WHERE pal_policynumber = '0001010201841400'
--------------------------------------------------------------------------------
SELECT * FROM STPO_POLICYASLOGICAL
--------------------------------------------------------------------------------
select pal_prodcode, palh_filename, pal_recordid, pal_policynumber, pal_status
from
STPO_POLICYASLOGICAL where  pal_recordid in (
select acd.idetrans
from int_acuerdo ac, int_acuerdo_det acd
where ac.idelotegrp = acd.idelotegrp
and ac.codprod in (select sasvalue from APP_VIDA.rimac_equivalencies
where property ='Producto'
and equivalence = 'DesgravamenBBVADesempleo' )
and acd.tipope = 1  -- ESto significa:  decode(tipope,1,'Alta',2,'Baja',4,'Pago',6,'Anulacion','') Operacion
)
--and  pal_status = 1
AND pal_policynumber = '0001010201841400'
--------------------------------------------------------------------------------
select pal_prodcode, palh_filename, pal_recordid, pal_policynumber, pal_status
from
STPO_POLICYASLOGICAL where  pal_recordid in (
select acd.idetrans
from int_acuerdo ac, int_acuerdo_det acd
where ac.idelotegrp = acd.idelotegrp
and ac.codprod in (select sasvalue from APP_VIDA.rimac_equivalencies
where property ='Producto'
and equivalence = 'DesgravamenBBVADesempleo' )
and acd.tipope = 1  -- ESto significa:  decode(tipope,1,'Alta',2,'Baja',4,'Pago',6,'Anulacion','') Operacion
)
and  pal_status = 1
AND pal_policynumber = '0001010201841400'
--------------------------------------------------------------------------------
SELECT DISTINCT NUMEROPOLIZAINPUT FROM PREPOLICY PRE
JOIN CONTEXTOPERATION CO ON CO.ITEM = PRE.STATIC
JOIN AGREGATEDRISKUNIT AR ON AR.OPERATIONPK = CO.ID
JOIN RISKUNITDCO RDCO ON RDCO.OPERATIONPK = AR.OPERATIONPK
JOIN PRERISKUNITS PRU ON PRU.PK = DCOID
JOIN RUDESGRAVAMEN RUDESG ON RUDESG.PK = PRU.PK
WHERE RUDESG.TIPODEVOLUCIONINPUT ='Básico' AND RUDESG.SUBPLANDESGRAVAMENINPUT IS NOT NULL
and ROWNUM < 30
--------------------------------------------------------------------------------
SELECT NUMEROPOLIZAINPUT FROM PREPOLICY PRE
JOIN CONTEXTOPERATION CO ON CO.ITEM = PRE.STATIC
JOIN AGREGATEDRISKUNIT AR ON AR.OPERATIONPK = CO.ID
JOIN RISKUNITDCO RDCO ON RDCO.OPERATIONPK = AR.OPERATIONPK
JOIN PRERISKUNITS PRU ON PRU.PK = DCOID
JOIN RUDESGRAVAMEN RUDESG ON RUDESG.PK = PRU.PK
WHERE RUDESG.TIPODEVOLUCIONINPUT ='Básico' AND RUDESG.SUBPLANDESGRAVAMENINPUT IS NOT NULL
and ROWNUM < 30
--------------------------------------------------------------------------------
select * from rudesgravamen where tipodevolucioninput is not null
--------------------------------------------------------------------------------
select distinct tipodevolucioninput from rudesgravamen where tipodevolucioninput is not null
--------------------------------------------------------------------------------
select * from riskunitdco
--------------------------------------------------------------------------------
select * from agregatedriskunit
--------------------------------------------------------------------------------
select * from rudesgravamen where pk = 6574215759
--------------------------------------------------------------------------------
select * from rudesgravamen
--------------------------------------------------------------------------------
select * from preriskunits
--------------------------------------------------------------------------------
SELECT CO.item, pr.numeropolizainput, co.id operationpk, et.description evento , p.description Producto,
S.CODIGOPLANINPUT codPlan, DESCRIPCIONPLANINPUT planDescription , PR.VIGENCIAINPUT VIGENCIA, MONEDAINPUT MONEDA, CO.ENDING_DATE
FROM POLICYDCO PDCO, AGREGATEDPOLICY AP, CONTEXTOPERATION CO, EVENTDCO EDCO, EVENTTYPE ET  , prepolicy pr , -- cobertura cob, CoverageDCO cdco,
PLAN PL INNER JOIN PREPLANS S ON S.STATIC = PL.PLANID
              INNER JOIN PRODUCT P ON PL.PRODUCTID = P.PRODUCTID  INNER JOIN PREPRODUCT PP ON P.PRODUCTID = PP.STATIC
            INNER JOIN INSURANCEOBJECTDCO IODCO ON IODCO.PLANID = PL.PLANID
WHERE PDCO.AGREGATEDOBJECTID=AP.AGREGATEDPOLICYID
and  pr.pk = pdco.dcoid
AND AP.PRODUCTID=P.PRODUCTID
AND CO.ID=PDCO.OPERATIONPK
AND PDCO.OPERATIONPK=EDCO.OPERATIONPK
AND EDCO.EVENTTYPEID=ET.EVENTTYPEID
AND EDCO.POLICYPK = CO.ITEM
and IODCO.OPERATIONPK = CO.id
AND P.DESCRIPTION IN ('DesgravamenBBVADesempleo') --('DesgravamenBBVATC', 'DesgravamenBANBIFTC','DesgravamenBBVATC','DesgravamenFORUM')
--  AND et.description IN ('Renovacion') 
 AND CO.ENDING_DATE > to_date('01/01/2019','dd/mm/yyyy')
--  AND CO.ENDING_DATE < to_date('20/03/2020','dd/mm/yyyy')
AND CO.STATUS =  2
and co.id = ap.operationpk
and ROWNUM < 30
order by CO.id desc
--------------------------------------------------------------------------------
select * from openitem
--------------------------------------------------------------------------------
SELECT CL.POLICYID,
       CL.POLICYDATE,
       CL.CLAIMDATE,
       CL.STATE,
       CL.OPERATIONPK,
       CO.STATUS,
       CNR.DESCRIPTION,
       CL.CLAIMNUMBER,
       OI.OPENITEMID,
       OI.AMOUNT,
       OI.DTY_ID,
       OI.DOCDATE,
       TO_DATE(CL.POLICYDATE,'DD/MM/YY'), TO_DATE('29/01/2016','DD/MM/YYYY')
  FROM CLAIM  CL
  LEFT JOIN AGREGATEDPOLICY AG ON AG.AGREGATEDPOLICYID = CL.POLICYID
    JOIN PRODUCT PRO ON AG.PRODUCTID = PRO.PRODUCTID
    JOIN CONTEXTOPERATION CO ON CO.ID = CL.OPERATIONPK AND STATUS = 2
       JOIN CLAIMRISKUNIT CRU ON CL.CLAIMID = CRU.CLAIMID
       JOIN CLAIMINSURANCEOBJECT CIO
           ON CRU.CLAIMRISKUNITID = CIO.CLAIMRISKUNITID
       JOIN CLAIMNORMALRESERVE CNR
           ON CIO.CLAIMINSURANCEOBJECTID = CNR.CLAIMINSURANCEOBJECTID
       JOIN OPENITEMREFERENCE OIR ON OIR.OPR_CLAIMNUMBER = CL.CLAIMNUMBER
       JOIN OPENITEM OI ON OI.OPENITEMID = OIR.OPENITEMID
 WHERE PRO.DESCRIPTION IN ('DesgravamenEFECTIVA','DesgravamenPremierPrymera',
'DesgravamenCONFIANZA',
'DesgravamenPROEMPRESA2022',
'DesgravamenSEFRIPLEY',
'DesgravamenBBVADesempleo',
'DesgravamenBANBIF',
'DesgravamenCAJACUSCO') AND CL.POLICYID IN (496638759)
AND CNR.DESCRIPTION = 'DesempleoInvoluntarioEIncapacidadTemporal'-- AND TO_DATE(CL.POLICYDATE,'DD/MM/YY') >= TO_DATE('29/01/2017','DD/MM/YYYY')--AND DTY_ID = 5732;
--------------------------------------------------------------------------------
SELECT CL.POLICYID,
       CL.POLICYDATE,
       CL.CLAIMDATE,
       CL.STATE,
       CL.OPERATIONPK,
       CNR.DESCRIPTION,
       CL.CLAIMNUMBER,
       OI.OPENITEMID,
       OI.AMOUNT,
       OI.DTY_ID,
       OI.DOCDATE,
       TO_DATE(CL.POLICYDATE,'DD/MM/YY'), TO_DATE('29/01/2016','DD/MM/YYYY')
  FROM CLAIM  CL
  LEFT JOIN AGREGATEDPOLICY AG ON AG.AGREGATEDPOLICYID = CL.POLICYID
    JOIN PRODUCT PRO ON AG.PRODUCTID = PRO.PRODUCTID
    JOIN CONTEXTOPERATION CO ON CO.ID = CL.OPERATIONPK AND STATUS = 2
       JOIN CLAIMRISKUNIT CRU ON CL.CLAIMID = CRU.CLAIMID
       JOIN CLAIMINSURANCEOBJECT CIO
           ON CRU.CLAIMRISKUNITID = CIO.CLAIMRISKUNITID
       JOIN CLAIMNORMALRESERVE CNR
           ON CIO.CLAIMINSURANCEOBJECTID = CNR.CLAIMINSURANCEOBJECTID
       JOIN OPENITEMREFERENCE OIR ON OIR.OPR_CLAIMNUMBER = CL.CLAIMNUMBER
       JOIN OPENITEM OI ON OI.OPENITEMID = OIR.OPENITEMID
 WHERE PRO.DESCRIPTION IN ('DesgravamenEFECTIVA','DesgravamenPremierPrymera',
'DesgravamenCONFIANZA',
'DesgravamenPROEMPRESA2022',
'DesgravamenSEFRIPLEY',
'DesgravamenBBVADesempleo',
'DesgravamenBANBIF',
'DesgravamenCAJACUSCO') AND CL.POLICYID IN (496638759)
AND CNR.DESCRIPTION = 'DesempleoInvoluntarioEIncapacidadTemporal'-- AND TO_DATE(CL.POLICYDATE,'DD/MM/YY') >= TO_DATE('29/01/2017','DD/MM/YYYY')--AND DTY_ID = 5732;
--------------------------------------------------------------------------------
SELECT CL.POLICYID,
       CL.POLICYDATE,
       CL.CLAIMDATE,
       CL.STATE,
       CL.OPERATIONPK,
       CNR.DESCRIPTION,
       CL.CLAIMNUMBER,
       OI.OPENITEMID,
       OI.AMOUNT,
       OI.DTY_ID,
       OI.DOCDATE,
       TO_DATE(CL.POLICYDATE,'DD/MM/YY'), TO_DATE('29/01/2016','DD/MM/YYYY')
  FROM CLAIM  CL
  LEFT JOIN AGREGATEDPOLICY AG ON AG.AGREGATEDPOLICYID = CL.POLICYID
    JOIN PRODUCT PRO ON AG.PRODUCTID = PRO.PRODUCTID
    JOIN CONTEXTOPERATION CO ON CO.ID = CL.OPERATIONPK AND STATUS = 2
       JOIN CLAIMRISKUNIT CRU ON CL.CLAIMID = CRU.CLAIMID
       JOIN CLAIMINSURANCEOBJECT CIO
           ON CRU.CLAIMRISKUNITID = CIO.CLAIMRISKUNITID
       JOIN CLAIMNORMALRESERVE CNR
           ON CIO.CLAIMINSURANCEOBJECTID = CNR.CLAIMINSURANCEOBJECTID
       JOIN OPENITEMREFERENCE OIR ON OIR.OPR_CLAIMNUMBER = CL.CLAIMNUMBER
       JOIN OPENITEM OI ON OI.OPENITEMID = OIR.OPENITEMID
 WHERE PRO.DESCRIPTION IN ('DesgravamenEFECTIVA','DesgravamenPremierPrymera',
'DesgravamenCONFIANZA',
'DesgravamenPROEMPRESA2022',
'DesgravamenSEFRIPLEY',
'DesgravamenBBVADesempleo',
'DesgravamenBANBIF',
'DesgravamenCAJACUSCO') AND CL.POLICYID IN (496638759)
--------------------------------------------------------------------------------
SELECT CL.POLICYID,
       CL.POLICYDATE,
       CL.CLAIMDATE,
       CL.STATE,
       CL.OPERATIONPK,
       CNR.DESCRIPTION,
       CL.CLAIMNUMBER,
       OI.OPENITEMID,
       OI.AMOUNT,
       OI.DTY_ID,
       OI.DOCDATE,
       TO_DATE(CL.POLICYDATE,'DD/MM/YY'), TO_DATE('29/01/2016','DD/MM/YYYY')
  FROM CLAIM  CL
  LEFT JOIN AGREGATEDPOLICY AG ON AG.AGREGATEDPOLICYID = CL.POLICYID
    JOIN PRODUCT PRO ON AG.PRODUCTID = PRO.PRODUCTID
    JOIN CONTEXTOPERATION CO ON CO.ID = CL.OPERATIONPK AND STATUS = 2
    JOIN POLICYDCO PDCO ON PDCO.OPERATIONPK = CO.ID
       JOIN CLAIMRISKUNIT CRU ON CL.CLAIMID = CRU.CLAIMID
       JOIN CLAIMINSURANCEOBJECT CIO
           ON CRU.CLAIMRISKUNITID = CIO.CLAIMRISKUNITID
       JOIN CLAIMNORMALRESERVE CNR
           ON CIO.CLAIMINSURANCEOBJECTID = CNR.CLAIMINSURANCEOBJECTID
       JOIN OPENITEMREFERENCE OIR ON OIR.OPR_CLAIMNUMBER = CL.CLAIMNUMBER
       JOIN OPENITEM OI ON OI.OPENITEMID = OIR.OPENITEMID
 WHERE PRO.DESCRIPTION IN ('DesgravamenEFECTIVA','DesgravamenPremierPrymera',
'DesgravamenCONFIANZA',
'DesgravamenPROEMPRESA2022',
'DesgravamenSEFRIPLEY',
'DesgravamenBBVADesempleo',
'DesgravamenBANBIF',
'DesgravamenCAJACUSCO') AND CL.POLICYID IN (496638759)  AND TO_DATE(CL.POLICYDATE,'DD/MM/YY') >= TO_DATE('29/01/2017','DD/MM/YYYY')--AND DTY_ID = 5732;
--------------------------------------------------------------------------------
SELECT CL.POLICYID,
       CL.POLICYDATE,
       CL.CLAIMDATE,
       CL.STATE,
       CL.OPERATIONPK,
       CNR.DESCRIPTION,
       CL.CLAIMNUMBER,
       OI.OPENITEMID,
       OI.AMOUNT,
       OI.DTY_ID,
       OI.DOCDATE,
       TO_DATE(CL.POLICYDATE,'DD/MM/YY'), TO_DATE('29/01/2016','DD/MM/YYYY')
  FROM CLAIM  CL
  LEFT JOIN AGREGATEDPOLICY AG ON AG.AGREGATEDPOLICYID = CL.POLICYID
    JOIN PRODUCT PRO ON AG.PRODUCTID = PRO.PRODUCTID
    JOIN CONTEXTOPERATION CO ON CO.ID = CL.OPERATIONPK AND STATUS = 2
    JOIN POLICYDCO PDCO ON PDCO.OPERATIONPK = CO.ID
       JOIN CLAIMRISKUNIT CRU ON CL.CLAIMID = CRU.CLAIMID
       JOIN CLAIMINSURANCEOBJECT CIO
           ON CRU.CLAIMRISKUNITID = CIO.CLAIMRISKUNITID
       JOIN CLAIMNORMALRESERVE CNR
           ON CIO.CLAIMINSURANCEOBJECTID = CNR.CLAIMINSURANCEOBJECTID
       JOIN OPENITEMREFERENCE OIR ON OIR.OPR_CLAIMNUMBER = CL.CLAIMNUMBER
       JOIN OPENITEM OI ON OI.OPENITEMID = OIR.OPENITEMID
 WHERE PRO.DESCRIPTION IN ('DesgravamenEFECTIVA','DesgravamenPremierPrymera',
'DesgravamenCONFIANZA',
'DesgravamenPROEMPRESA2022',
'DesgravamenSEFRIPLEY',
'DesgravamenBBVADesempleo',
'DesgravamenBANBIF',
'DesgravamenCAJACUSCO') AND CL.POLICYID IN (496638759)  AND TO_DATE(CL.POLICYDATE,'DD/MM/YY') >= TO_DATE('29/01/2018','DD/MM/YYYY')--AND DTY_ID = 5732;
--------------------------------------------------------------------------------
SELECT CL.POLICYID,
       CL.POLICYDATE,
       CL.CLAIMDATE,
       CL.STATE,
       CL.OPERATIONPK,
       CNR.DESCRIPTION,
       CL.CLAIMNUMBER,
       OI.OPENITEMID,
       OI.AMOUNT,
       OI.DTY_ID,
       OI.DOCDATE,
       TO_DATE(CL.POLICYDATE,'DD/MM/YY'), TO_DATE('29/01/2016','DD/MM/YYYY')
  FROM CLAIM  CL
  LEFT JOIN AGREGATEDPOLICY AG ON AG.AGREGATEDPOLICYID = CL.POLICYID
    JOIN PRODUCT PRO ON AG.PRODUCTID = PRO.PRODUCTID
    JOIN CONTEXTOPERATION CO ON CO.ID = CL.OPERATIONPK AND STATUS = 2
    JOIN POLICYDCO PDCO ON PDCO.OPERATIONPK = CO.ID
       JOIN CLAIMRISKUNIT CRU ON CL.CLAIMID = CRU.CLAIMID
       JOIN CLAIMINSURANCEOBJECT CIO
           ON CRU.CLAIMRISKUNITID = CIO.CLAIMRISKUNITID
       JOIN CLAIMNORMALRESERVE CNR
           ON CIO.CLAIMINSURANCEOBJECTID = CNR.CLAIMINSURANCEOBJECTID
       JOIN OPENITEMREFERENCE OIR ON OIR.OPR_CLAIMNUMBER = CL.CLAIMNUMBER
       JOIN OPENITEM OI ON OI.OPENITEMID = OIR.OPENITEMID
 WHERE PRO.DESCRIPTION IN ('DesgravamenEFECTIVA','DesgravamenPremierPrymera',
'DesgravamenCONFIANZA',
'DesgravamenPROEMPRESA2022',
'DesgravamenSEFRIPLEY',
'DesgravamenBBVADesempleo',
'DesgravamenBANBIF',
'DesgravamenCAJACUSCO') AND CL.POLICYID IN (496638759)  AND TO_DATE(CL.POLICYDATE,'DD/MM/YY') >= TO_DATE('29/01/2016','DD/MM/YYYY')--AND DTY_ID = 5732;
--------------------------------------------------------------------------------
SELECT CL.POLICYID,
       CL.POLICYDATE,
       CL.CLAIMDATE,
       CL.STATE,
       CL.OPERATIONPK,
       CNR.DESCRIPTION,
       CL.CLAIMNUMBER,
       OI.OPENITEMID,
       OI.AMOUNT,
       OI.DTY_ID,
       OI.DOCDATE,
       TO_DATE(CL.POLICYDATE,'DD/MM/YY'), TO_DATE('29/01/2016','DD/MM/YYYY')
  FROM CLAIM  CL
  LEFT JOIN AGREGATEDPOLICY AG ON AG.AGREGATEDPOLICYID = CL.POLICYID
    JOIN PRODUCT PRO ON AG.PRODUCTID = PRO.PRODUCTID
    JOIN CONTEXTOPERATION CO ON CO.ID = CL.OPERATIONPK AND STATUS = 2
    JOIN POLICYDCO PDCO ON PDCO.OPERATIONPK = CO.ID
       JOIN CLAIMRISKUNIT CRU ON CL.CLAIMID = CRU.CLAIMID
       JOIN CLAIMINSURANCEOBJECT CIO
           ON CRU.CLAIMRISKUNITID = CIO.CLAIMRISKUNITID
       JOIN CLAIMNORMALRESERVE CNR
           ON CIO.CLAIMINSURANCEOBJECTID = CNR.CLAIMINSURANCEOBJECTID
       JOIN OPENITEMREFERENCE OIR ON OIR.OPR_CLAIMNUMBER = CL.CLAIMNUMBER
       JOIN OPENITEM OI ON OI.OPENITEMID = OIR.OPENITEMID
 WHERE PRO.DESCRIPTION IN ('DesgravamenEFECTIVA','DesgravamenPremierPrymera',
'DesgravamenCONFIANZA',
'DesgravamenPROEMPRESA2022',
'DesgravamenSEFRIPLEY',
'DesgravamenBBVADesempleo',
'DesgravamenBANBIF',
'DesgravamenCAJACUSCO') AND CL.POLICYID IN (496638759)  --AND TO_DATE(CL.POLICYDATE,'DD/MM/YYYY') >= TO_DATE('29/01/2016','DD/MM/YYYY')--AND DTY_ID = 5732;
--------------------------------------------------------------------------------
SELECT CL.POLICYID,
       CL.POLICYDATE,
       CL.CLAIMDATE,
       CL.STATE,
       CL.OPERATIONPK,
       CNR.DESCRIPTION,
       CL.CLAIMNUMBER,
       OI.OPENITEMID,
       OI.AMOUNT,
       OI.DTY_ID,
       OI.DOCDATE,
       TO_DATE(CL.POLICYDATE,'DD/MM/YYYY'), TO_DATE('29/01/2016','DD/MM/YYYY')
  FROM CLAIM  CL
  LEFT JOIN AGREGATEDPOLICY AG ON AG.AGREGATEDPOLICYID = CL.POLICYID
    JOIN PRODUCT PRO ON AG.PRODUCTID = PRO.PRODUCTID
    JOIN CONTEXTOPERATION CO ON CO.ID = CL.OPERATIONPK AND STATUS = 2
    JOIN POLICYDCO PDCO ON PDCO.OPERATIONPK = CO.ID
       JOIN CLAIMRISKUNIT CRU ON CL.CLAIMID = CRU.CLAIMID
       JOIN CLAIMINSURANCEOBJECT CIO
           ON CRU.CLAIMRISKUNITID = CIO.CLAIMRISKUNITID
       JOIN CLAIMNORMALRESERVE CNR
           ON CIO.CLAIMINSURANCEOBJECTID = CNR.CLAIMINSURANCEOBJECTID
       JOIN OPENITEMREFERENCE OIR ON OIR.OPR_CLAIMNUMBER = CL.CLAIMNUMBER
       JOIN OPENITEM OI ON OI.OPENITEMID = OIR.OPENITEMID
 WHERE PRO.DESCRIPTION IN ('DesgravamenEFECTIVA','DesgravamenPremierPrymera',
'DesgravamenCONFIANZA',
'DesgravamenPROEMPRESA2022',
'DesgravamenSEFRIPLEY',
'DesgravamenBBVADesempleo',
'DesgravamenBANBIF',
'DesgravamenCAJACUSCO') AND CL.POLICYID IN (496638759)  --AND TO_DATE(CL.POLICYDATE,'DD/MM/YYYY') >= TO_DATE('29/01/2016','DD/MM/YYYY')--AND DTY_ID = 5732;
--------------------------------------------------------------------------------
SELECT CL.POLICYID,
       CL.POLICYDATE,
       CL.CLAIMDATE,
       CL.STATE,
       CL.OPERATIONPK,
       CNR.DESCRIPTION,
       CL.CLAIMNUMBER,
       OI.OPENITEMID,
       OI.AMOUNT,
       OI.DTY_ID,
       OI.DOCDATE,
       TO_DATE(CL.POLICYDATE,'DD/MM/YYYY'), TO_DATE('29/01/2016','DD/MM/YYYY')
  FROM CLAIM  CL
  LEFT JOIN AGREGATEDPOLICY AG ON AG.AGREGATEDPOLICYID = CL.POLICYID
    JOIN PRODUCT PRO ON AG.PRODUCTID = PRO.PRODUCTID
    JOIN CONTEXTOPERATION CO ON CO.ID = CL.OPERATIONPK AND STATUS = 2
    JOIN POLICYDCO PDCO ON PDCO.OPERATIONPK = CO.ID
       JOIN CLAIMRISKUNIT CRU ON CL.CLAIMID = CRU.CLAIMID
       JOIN CLAIMINSURANCEOBJECT CIO
           ON CRU.CLAIMRISKUNITID = CIO.CLAIMRISKUNITID
       JOIN CLAIMNORMALRESERVE CNR
           ON CIO.CLAIMINSURANCEOBJECTID = CNR.CLAIMINSURANCEOBJECTID
       JOIN OPENITEMREFERENCE OIR ON OIR.OPR_CLAIMNUMBER = CL.CLAIMNUMBER
       JOIN OPENITEM OI ON OI.OPENITEMID = OIR.OPENITEMID
 WHERE PRO.DESCRIPTION IN ('DesgravamenEFECTIVA','DesgravamenPremierPrymera',
'DesgravamenCONFIANZA',
'DesgravamenPROEMPRESA2022',
'DesgravamenSEFRIPLEY',
'DesgravamenBBVADesempleo',
'DesgravamenBANBIF',
'DesgravamenCAJACUSCO') AND CL.POLICYID IN (496638759)  AND TO_DATE(CL.POLICYDATE,'DD/MM/YYYY') >= TO_DATE('29/01/2016','DD/MM/YYYY')--AND DTY_ID = 5732;
--------------------------------------------------------------------------------
SELECT CL.POLICYID,
       CL.POLICYDATE,
       CL.CLAIMDATE,
       CL.STATE,
       CL.OPERATIONPK,
       CNR.DESCRIPTION,
       CL.CLAIMNUMBER,
       OI.OPENITEMID,
       OI.AMOUNT,
       OI.DTY_ID,
       OI.DOCDATE
  FROM CLAIM  CL
  LEFT JOIN AGREGATEDPOLICY AG ON AG.AGREGATEDPOLICYID = CL.POLICYID
    JOIN PRODUCT PRO ON AG.PRODUCTID = PRO.PRODUCTID
    JOIN CONTEXTOPERATION CO ON CO.ID = CL.OPERATIONPK AND STATUS = 2
    JOIN POLICYDCO PDCO ON PDCO.OPERATIONPK = CO.ID
       JOIN CLAIMRISKUNIT CRU ON CL.CLAIMID = CRU.CLAIMID
       JOIN CLAIMINSURANCEOBJECT CIO
           ON CRU.CLAIMRISKUNITID = CIO.CLAIMRISKUNITID
       JOIN CLAIMNORMALRESERVE CNR
           ON CIO.CLAIMINSURANCEOBJECTID = CNR.CLAIMINSURANCEOBJECTID
       JOIN OPENITEMREFERENCE OIR ON OIR.OPR_CLAIMNUMBER = CL.CLAIMNUMBER
       JOIN OPENITEM OI ON OI.OPENITEMID = OIR.OPENITEMID
 WHERE PRO.DESCRIPTION IN ('DesgravamenEFECTIVA','DesgravamenPremierPrymera',
'DesgravamenCONFIANZA',
'DesgravamenPROEMPRESA2022',
'DesgravamenSEFRIPLEY',
'DesgravamenBBVADesempleo',
'DesgravamenBANBIF',
'DesgravamenCAJACUSCO') AND CL.POLICYID IN (496638759)  AND TO_DATE(CL.POLICYDATE,'DD/MM/YYYY') >= TO_DATE('29/01/2016','DD/MM/YYYY')--AND DTY_ID = 5732;
--------------------------------------------------------------------------------
SELECT CL.POLICYID,
       CL.POLICYDATE,
       CL.CLAIMDATE,
       CL.STATE,
       CL.OPERATIONPK,
       CNR.DESCRIPTION,
       CL.CLAIMNUMBER,
       OI.OPENITEMID,
       OI.AMOUNT,
       OI.DTY_ID,
       OI.DOCDATE
  FROM CLAIM  CL
  LEFT JOIN AGREGATEDPOLICY AG ON AG.AGREGATEDPOLICYID = CL.POLICYID
    JOIN PRODUCT PRO ON AG.PRODUCTID = PRO.PRODUCTID
    JOIN CONTEXTOPERATION CO ON CO.ID = CL.OPERATIONPK AND STATUS = 2
    JOIN POLICYDCO PDCO ON PDCO.OPERATIONPK = CO.ID
       JOIN CLAIMRISKUNIT CRU ON CL.CLAIMID = CRU.CLAIMID
       JOIN CLAIMINSURANCEOBJECT CIO
           ON CRU.CLAIMRISKUNITID = CIO.CLAIMRISKUNITID
       JOIN CLAIMNORMALRESERVE CNR
           ON CIO.CLAIMINSURANCEOBJECTID = CNR.CLAIMINSURANCEOBJECTID
       JOIN OPENITEMREFERENCE OIR ON OIR.OPR_CLAIMNUMBER = CL.CLAIMNUMBER
       JOIN OPENITEM OI ON OI.OPENITEMID = OIR.OPENITEMID
 WHERE PRO.DESCRIPTION IN ('DesgravamenEFECTIVA','DesgravamenPremierPrymera',
'DesgravamenCONFIANZA',
'DesgravamenPROEMPRESA2022',
'DesgravamenSEFRIPLEY',
'DesgravamenBBVADesempleo',
'DesgravamenBANBIF',
'DesgravamenCAJACUSCO') AND CL.POLICYID IN (496638759)  AND TO_DATE(CL.POLICYDATE,'DD/MM/YYYY') >= TO_DATE('29/01/2018','DD/MM/YYYY')--AND DTY_ID = 5732;
--------------------------------------------------------------------------------
SELECT CL.POLICYID,
       CL.POLICYDATE,
       CL.CLAIMDATE,
       CL.STATE,
       CL.OPERATIONPK,
       CNR.DESCRIPTION,
       CL.CLAIMNUMBER,
       OI.OPENITEMID,
       OI.AMOUNT,
       OI.DTY_ID,
       OI.DOCDATE
  FROM CLAIM  CL
  LEFT JOIN AGREGATEDPOLICY AG ON AG.AGREGATEDPOLICYID = CL.POLICYID
    JOIN PRODUCT PRO ON AG.PRODUCTID = PRO.PRODUCTID
    JOIN CONTEXTOPERATION CO ON CO.ID = CL.OPERATIONPK AND STATUS = 2
    JOIN POLICYDCO PDCO ON PDCO.OPERATIONPK = CO.ID
       JOIN CLAIMRISKUNIT CRU ON CL.CLAIMID = CRU.CLAIMID
       JOIN CLAIMINSURANCEOBJECT CIO
           ON CRU.CLAIMRISKUNITID = CIO.CLAIMRISKUNITID
       JOIN CLAIMNORMALRESERVE CNR
           ON CIO.CLAIMINSURANCEOBJECTID = CNR.CLAIMINSURANCEOBJECTID
       JOIN OPENITEMREFERENCE OIR ON OIR.OPR_CLAIMNUMBER = CL.CLAIMNUMBER
       JOIN OPENITEM OI ON OI.OPENITEMID = OIR.OPENITEMID
 WHERE PRO.DESCRIPTION IN ('DesgravamenEFECTIVA','DesgravamenPremierPrymera',
'DesgravamenCONFIANZA',
'DesgravamenPROEMPRESA2022',
'DesgravamenSEFRIPLEY',
'DesgravamenBBVADesempleo',
'DesgravamenBANBIF',
'DesgravamenCAJACUSCO') AND CL.POLICYID IN (496638759)  AND trunc(CL.POLICYDATE) >= TO_DATE('29/01/2018','DD/MM/YYYY')--AND DTY_ID = 5732;
--------------------------------------------------------------------------------
SELECT CL.POLICYID,
       CL.POLICYDATE,
       CL.CLAIMDATE,
       CL.STATE,
       CL.OPERATIONPK,
       CNR.DESCRIPTION,
       CL.CLAIMNUMBER,
       OI.OPENITEMID,
       OI.AMOUNT,
       OI.DTY_ID,
       OI.DOCDATE
  FROM CLAIM  CL
  LEFT JOIN AGREGATEDPOLICY AG ON AG.AGREGATEDPOLICYID = CL.POLICYID
    JOIN PRODUCT PRO ON AG.PRODUCTID = PRO.PRODUCTID
    JOIN CONTEXTOPERATION CO ON CO.ID = CL.OPERATIONPK AND STATUS = 2
    JOIN POLICYDCO PDCO ON PDCO.OPERATIONPK = CO.ID
       JOIN CLAIMRISKUNIT CRU ON CL.CLAIMID = CRU.CLAIMID
       JOIN CLAIMINSURANCEOBJECT CIO
           ON CRU.CLAIMRISKUNITID = CIO.CLAIMRISKUNITID
       JOIN CLAIMNORMALRESERVE CNR
           ON CIO.CLAIMINSURANCEOBJECTID = CNR.CLAIMINSURANCEOBJECTID
       JOIN OPENITEMREFERENCE OIR ON OIR.OPR_CLAIMNUMBER = CL.CLAIMNUMBER
       JOIN OPENITEM OI ON OI.OPENITEMID = OIR.OPENITEMID
 WHERE PRO.DESCRIPTION IN ('DesgravamenEFECTIVA','DesgravamenPremierPrymera',
'DesgravamenCONFIANZA',
'DesgravamenPROEMPRESA2022',
'DesgravamenSEFRIPLEY',
'DesgravamenBBVADesempleo',
'DesgravamenBANBIF',
'DesgravamenCAJACUSCO') AND CL.POLICYID IN (496638759)  AND CL.POLICYDATE >= TO_DATE('29/01/2018','DD/MM/YYYY')--AND DTY_ID = 5732;
--------------------------------------------------------------------------------
SELECT CL.POLICYID,
       CL.POLICYDATE,
       CL.CLAIMDATE,
       CL.STATE,
       CL.OPERATIONPK,
       CNR.DESCRIPTION,
       CL.CLAIMNUMBER,
       OI.OPENITEMID,
       OI.AMOUNT,
       OI.DTY_ID,
       OI.DOCDATE
  FROM CLAIM  CL
  LEFT JOIN AGREGATEDPOLICY AG ON AG.AGREGATEDPOLICYID = CL.POLICYID
    JOIN PRODUCT PRO ON AG.PRODUCTID = PRO.PRODUCTID
    JOIN CONTEXTOPERATION CO ON CO.ID = CL.OPERATIONPK AND STATUS = 2
    JOIN POLICYDCO PDCO ON PDCO.OPERATIONPK = CO.ID
       JOIN CLAIMRISKUNIT CRU ON CL.CLAIMID = CRU.CLAIMID
       JOIN CLAIMINSURANCEOBJECT CIO
           ON CRU.CLAIMRISKUNITID = CIO.CLAIMRISKUNITID
       JOIN CLAIMNORMALRESERVE CNR
           ON CIO.CLAIMINSURANCEOBJECTID = CNR.CLAIMINSURANCEOBJECTID
       JOIN OPENITEMREFERENCE OIR ON OIR.OPR_CLAIMNUMBER = CL.CLAIMNUMBER
       JOIN OPENITEM OI ON OI.OPENITEMID = OIR.OPENITEMID
 WHERE PRO.DESCRIPTION IN ('DesgravamenEFECTIVA','DesgravamenPremierPrymera',
'DesgravamenCONFIANZA',
'DesgravamenPROEMPRESA2022',
'DesgravamenSEFRIPLEY',
'DesgravamenBBVADesempleo',
'DesgravamenBANBIF',
'DesgravamenCAJACUSCO') AND CL.POLICYID IN (496638759)  --AND CL.POLICYDATE >= TO_DATE('30/01/2018','DD/MM/YYYY')--AND DTY_ID = 5732;
--------------------------------------------------------------------------------
SELECT CL.POLICYID,
       CL.POLICYDATE,
       CL.CLAIMDATE,
       CL.STATE,
       CL.OPERATIONPK,
       CNR.DESCRIPTION,
       CL.CLAIMNUMBER,
       OI.OPENITEMID,
       OI.AMOUNT,
       OI.DTY_ID,
       OI.DOCDATE
  FROM CLAIM  CL
  LEFT JOIN AGREGATEDPOLICY AG ON AG.AGREGATEDPOLICYID = CL.POLICYID
    JOIN PRODUCT PRO ON AG.PRODUCTID = PRO.PRODUCTID
    JOIN CONTEXTOPERATION CO ON CO.ID = CL.OPERATIONPK AND STATUS = 2
    JOIN POLICYDCO PDCO ON PDCO.OPERATIONPK = CO.ID
       JOIN CLAIMRISKUNIT CRU ON CL.CLAIMID = CRU.CLAIMID
       JOIN CLAIMINSURANCEOBJECT CIO
           ON CRU.CLAIMRISKUNITID = CIO.CLAIMRISKUNITID
       JOIN CLAIMNORMALRESERVE CNR
           ON CIO.CLAIMINSURANCEOBJECTID = CNR.CLAIMINSURANCEOBJECTID
       JOIN OPENITEMREFERENCE OIR ON OIR.OPR_CLAIMNUMBER = CL.CLAIMNUMBER
       JOIN OPENITEM OI ON OI.OPENITEMID = OIR.OPENITEMID
 WHERE PRO.DESCRIPTION IN ('DesgravamenEFECTIVA','DesgravamenPremierPrymera',
'DesgravamenCONFIANZA',
'DesgravamenPROEMPRESA2022',
'DesgravamenSEFRIPLEY',
'DesgravamenBBVADesempleo',
'DesgravamenBANBIF',
'DesgravamenCAJACUSCO') AND CL.POLICYID IN (496638759)  AND CL.POLICYDATE >= TO_DATE('30/01/2018','DD/MM/YYYY')--AND DTY_ID = 5732;
--------------------------------------------------------------------------------
SELECT CL.POLICYID,
       CL.POLICYDATE,
       CL.CLAIMDATE,
       CL.STATE,
       CL.OPERATIONPK,
       CNR.DESCRIPTION,
       CL.CLAIMNUMBER,
       OI.OPENITEMID,
       OI.AMOUNT,
       OI.DTY_ID,
       OI.DOCDATE
  FROM CLAIM  CL
  LEFT JOIN AGREGATEDPOLICY AG ON AG.AGREGATEDPOLICYID = CL.POLICYID
    JOIN PRODUCT PRO ON AG.PRODUCTID = PRO.PRODUCTID
    JOIN CONTEXTOPERATION CO ON CO.ID = CL.OPERATIONPK AND STATUS = 2
    JOIN POLICYDCO PDCO ON PDCO.OPERATIONPK = CO.ID
       JOIN CLAIMRISKUNIT CRU ON CL.CLAIMID = CRU.CLAIMID
       JOIN CLAIMINSURANCEOBJECT CIO
           ON CRU.CLAIMRISKUNITID = CIO.CLAIMRISKUNITID
       JOIN CLAIMNORMALRESERVE CNR
           ON CIO.CLAIMINSURANCEOBJECTID = CNR.CLAIMINSURANCEOBJECTID
       JOIN OPENITEMREFERENCE OIR ON OIR.OPR_CLAIMNUMBER = CL.CLAIMNUMBER
       JOIN OPENITEM OI ON OI.OPENITEMID = OIR.OPENITEMID
 WHERE PRO.DESCRIPTION IN ('DesgravamenEFECTIVA','DesgravamenPremierPrymera',
'DesgravamenCONFIANZA',
'DesgravamenPROEMPRESA2022',
'DesgravamenSEFRIPLEY',
'DesgravamenBBVADesempleo',
'DesgravamenBANBIF',
'DesgravamenCAJACUSCO') AND CL.POLICYID IN (496638759)  AND CL.POLICYDATE >= TO_DATE('01/01/2019','DD/MM/YYYY')--AND DTY_ID = 5732;
--------------------------------------------------------------------------------
SELECT CL.POLICYID,
       CL.POLICYDATE,
       CL.CLAIMDATE,
       CL.STATE,
       CL.OPERATIONPK,
       CNR.DESCRIPTION,
       CL.CLAIMNUMBER,
       OI.OPENITEMID,
       OI.AMOUNT,
       OI.DTY_ID,
       OI.DOCDATE
  FROM CLAIM  CL
  LEFT JOIN AGREGATEDPOLICY AG ON AG.AGREGATEDPOLICYID = CL.POLICYID
    JOIN PRODUCT PRO ON AG.PRODUCTID = PRO.PRODUCTID
    JOIN CONTEXTOPERATION CO ON CO.ID = CL.OPERATIONPK AND STATUS = 2
    JOIN POLICYDCO PDCO ON PDCO.OPERATIONPK = CO.ID
       JOIN CLAIMRISKUNIT CRU ON CL.CLAIMID = CRU.CLAIMID
       JOIN CLAIMINSURANCEOBJECT CIO
           ON CRU.CLAIMRISKUNITID = CIO.CLAIMRISKUNITID
       JOIN CLAIMNORMALRESERVE CNR
           ON CIO.CLAIMINSURANCEOBJECTID = CNR.CLAIMINSURANCEOBJECTID
       JOIN OPENITEMREFERENCE OIR ON OIR.OPR_CLAIMNUMBER = CL.CLAIMNUMBER
       JOIN OPENITEM OI ON OI.OPENITEMID = OIR.OPENITEMID
 WHERE PRO.DESCRIPTION IN ('DesgravamenEFECTIVA','DesgravamenPremierPrymera',
'DesgravamenCONFIANZA',
'DesgravamenPROEMPRESA2022',
'DesgravamenSEFRIPLEY',
'DesgravamenBBVADesempleo',
'DesgravamenBANBIF',
'DesgravamenCAJACUSCO') AND CL.POLICYID IN (496638759)  AND CL.POLICYDATE >= PDCO.INITIALDATE                   --AND DTY_ID = 5732;
--------------------------------------------------------------------------------
SELECT CL.POLICYID,
       CL.POLICYDATE,
       CL.CLAIMDATE,
       CL.STATE,
       CL.OPERATIONPK,
       CNR.DESCRIPTION,
       CL.CLAIMNUMBER,
       OI.OPENITEMID,
       OI.AMOUNT,
       OI.DTY_ID,
       OI.DOCDATE
  FROM CLAIM  CL
  LEFT JOIN AGREGATEDPOLICY AG ON AG.AGREGATEDPOLICYID = CL.POLICYID
    JOIN PRODUCT PRO ON AG.PRODUCTID = PRO.PRODUCTID AND PRO.DESCRIPTION IN ('DesgravamenBBVADesempleo')
    JOIN CONTEXTOPERATION CO ON CO.ID = CL.OPERATIONPK AND STATUS = 2
    JOIN POLICYDCO PDCO ON PDCO.OPERATIONPK = CO.ID
       JOIN CLAIMRISKUNIT CRU ON CL.CLAIMID = CRU.CLAIMID
       JOIN CLAIMINSURANCEOBJECT CIO
           ON CRU.CLAIMRISKUNITID = CIO.CLAIMRISKUNITID
       JOIN CLAIMNORMALRESERVE CNR
           ON CIO.CLAIMINSURANCEOBJECTID = CNR.CLAIMINSURANCEOBJECTID
       JOIN OPENITEMREFERENCE OIR ON OIR.OPR_CLAIMNUMBER = CL.CLAIMNUMBER
       JOIN OPENITEM OI ON OI.OPENITEMID = OIR.OPENITEMID
 WHERE PRO.DESCRIPTION IN ('DesgravamenEFECTIVA','DesgravamenPremierPrymera',
'DesgravamenCONFIANZA',
'DesgravamenPROEMPRESA2022',
'DesgravamenSEFRIPLEY',
'DesgravamenBBVADesempleo',
'DesgravamenBANBIF',
'DesgravamenCAJACUSCO') AND CL.POLICYID IN (496638759)                         --AND DTY_ID = 5732;
--------------------------------------------------------------------------------
SELECT CL.POLICYID,CL.POLICYDATE,CL.CLAIMDATE,CL.STATE, CL.OPERATIONPK,CNR.DESCRIPTION,CL.CLAIMNUMBER,OI.OPENITEMID,OI.AMOUNT,OI.DTY_ID,OI.DOCDATE
               FROM CLAIM  CL
                    JOIN CLAIMRISKUNIT CRU ON CL.CLAIMID = CRU.CLAIMID
                    JOIN CLAIMINSURANCEOBJECT CIO
                        ON CRU.CLAIMRISKUNITID = CIO.CLAIMRISKUNITID
                    JOIN CLAIMNORMALRESERVE CNR
                        ON CIO.CLAIMINSURANCEOBJECTID =
                           CNR.CLAIMINSURANCEOBJECTID
                          -- JOIN CLAIMNORMALRESERVE CNR ON CNR.OPERATIONPK = CL.OPERATIONPK
                    JOIN OPENITEMREFERENCE OIR ON OIR.OPR_CLAIMNUMBER = CL.CLAIMNUMBER
                    JOIN OPENITEM OI ON OI.OPENITEMID = OIR.OPENITEMID
              WHERE CL.POLICYID IN (496638759) --AND DTY_ID = 5732;
--------------------------------------------------------------------------------
SELECT CL.POLICYID,CL.POLICYDATE,CL.CLAIMDATE,CL.STATE, CL.OPERATIONPK,CNR.DESCRIPTION,CL.CLAIMNUMBER,OI.OPENITEMID,OI.AMOUNT,OI.DTY_ID,OI.DOCDATE
               FROM CLAIM  CL
                    JOIN CLAIMRISKUNIT CRU ON CL.CLAIMID = CRU.CLAIMID
                    JOIN CLAIMINSURANCEOBJECT CIO
                        ON CRU.CLAIMRISKUNITID = CIO.CLAIMRISKUNITID
                    JOIN CLAIMNORMALRESERVE CNR
                        ON CIO.CLAIMINSURANCEOBJECTID =
                           CNR.CLAIMINSURANCEOBJECTID
                          -- JOIN CLAIMNORMALRESERVE CNR ON CNR.OPERATIONPK = CL.OPERATIONPK
                    JOIN OPENITEMREFERENCE OIR ON OIR.OPR_CLAIMNUMBER = CL.CLAIMNUMBER
                    JOIN OPENITEM OI ON OI.OPENITEMID = OIR.OPENITEMID
              WHERE CL.POLICYID IN (496638759) AND DTY_ID = 5732
--------------------------------------------------------------------------------
select * from claimnormalreserve WHERE OPERATIONPK = 1456960620
--------------------------------------------------------------------------------
SELECT CL.POLICYID,CL.POLICYDATE,CL.CLAIMDATE,CL.STATE, CL.OPERATIONPK,CNR.DESCRIPTION,CL.CLAIMNUMBER,OI.OPENITEMID,OI.AMOUNT,OI.DTY_ID,OI.DOCDATE
               FROM CLAIM  CL
                   /* JOIN CLAIMRISKUNIT CRU ON CL.CLAIMID = CRU.CLAIMID
                    JOIN CLAIMINSURANCEOBJECT CIO
                        ON CRU.CLAIMRISKUNITID = CIO.CLAIMRISKUNITID
                    JOIN CLAIMNORMALRESERVE CNR
                        ON CIO.CLAIMINSURANCEOBJECTID =
                           CNR.CLAIMINSURANCEOBJECTID*/
                           JOIN CLAIMNORMALRESERVE CNR ON CNR.OPERATIONPK = CL.OPERATIONPK
                    JOIN OPENITEMREFERENCE OIR ON OIR.OPR_CLAIMNUMBER = CL.CLAIMNUMBER
                    JOIN OPENITEM OI ON OI.OPENITEMID = OIR.OPENITEMID
              WHERE CL.POLICYID IN (496638759) AND DTY_ID = 5732
--------------------------------------------------------------------------------
select * from claimnormalreserve
--------------------------------------------------------------------------------
SELECT SUM(OI.AMOUNT)
               FROM CLAIM  CL
                    JOIN CLAIMRISKUNIT CRU ON CL.CLAIMID = CRU.CLAIMID
                    JOIN CLAIMINSURANCEOBJECT CIO
                        ON CRU.CLAIMRISKUNITID = CIO.CLAIMRISKUNITID
                    JOIN CLAIMNORMALRESERVE CNR
                        ON CIO.CLAIMINSURANCEOBJECTID =
                           CNR.CLAIMINSURANCEOBJECTID
                    JOIN OPENITEMREFERENCE OIR ON OIR.OPR_CLAIMNUMBER = CL.CLAIMNUMBER
                    JOIN OPENITEM OI ON OI.OPENITEMID = OIR.OPENITEMID
              WHERE CL.POLICYID IN (496638759) AND DTY_ID = 5732
--------------------------------------------------------------------------------
SELECT CL.POLICYID,CL.POLICYDATE,CL.CLAIMDATE,CL.STATE, CL.OPERATIONPK,CNR.DESCRIPTION,CL.CLAIMNUMBER,OI.OPENITEMID,OI.AMOUNT,OI.DTY_ID,OI.DOCDATE
               FROM CLAIM  CL
                    JOIN CLAIMRISKUNIT CRU ON CL.CLAIMID = CRU.CLAIMID
                    JOIN CLAIMINSURANCEOBJECT CIO
                        ON CRU.CLAIMRISKUNITID = CIO.CLAIMRISKUNITID
                    JOIN CLAIMNORMALRESERVE CNR
                        ON CIO.CLAIMINSURANCEOBJECTID =
                           CNR.CLAIMINSURANCEOBJECTID
                    JOIN OPENITEMREFERENCE OIR ON OIR.OPR_CLAIMNUMBER = CL.CLAIMNUMBER
                    JOIN OPENITEM OI ON OI.OPENITEMID = OIR.OPENITEMID
              WHERE CL.POLICYID IN (496638759) AND DTY_ID = 5732
--------------------------------------------------------------------------------
SELECT CL.POLICYID,CL.POLICYDATE,CL.CLAIMDATE,CL.STATE, CL.OPERATIONPK,CNR.DESCRIPTION,CL.CLAIMNUMBER,OI.OPENITEMID,OI.AMOUNT,OI.DTY_ID,OI.DOCDATE
               FROM CLAIM  CL
                    JOIN CLAIMRISKUNIT CRU ON CL.CLAIMID = CRU.CLAIMID
                    JOIN CLAIMINSURANCEOBJECT CIO
                        ON CRU.CLAIMRISKUNITID = CIO.CLAIMRISKUNITID
                    JOIN CLAIMNORMALRESERVE CNR
                        ON CIO.CLAIMINSURANCEOBJECTID =
                           CNR.CLAIMINSURANCEOBJECTID
                    JOIN OPENITEMREFERENCE OIR ON OIR.OPR_CLAIMNUMBER = CL.CLAIMNUMBER
                    JOIN OPENITEM OI ON OI.OPENITEMID = OIR.OPENITEMID
              WHERE CL.POLICYID IN (496638759)
--------------------------------------------------------------------------------
SELECT CL.POLICYID,CL.POLICYDATE,CL.CLAIMDATE,CL.STATE, CL.OPERATIONPK,CNR.DESCRIPTION,CL.CLAIMNUMBER,OI.OPENITEMID,OI.AMOUNT
               FROM CLAIM  CL
                    JOIN CLAIMRISKUNIT CRU ON CL.CLAIMID = CRU.CLAIMID
                    JOIN CLAIMINSURANCEOBJECT CIO
                        ON CRU.CLAIMRISKUNITID = CIO.CLAIMRISKUNITID
                    JOIN CLAIMNORMALRESERVE CNR
                        ON CIO.CLAIMINSURANCEOBJECTID =
                           CNR.CLAIMINSURANCEOBJECTID
                    JOIN OPENITEMREFERENCE OIR ON OIR.OPR_CLAIMNUMBER = CL.CLAIMNUMBER
                    JOIN OPENITEM OI ON OI.OPENITEMID = OIR.OPENITEMID
              WHERE CL.POLICYID IN (496638759)
--------------------------------------------------------------------------------
SELECT * FROM OPENITEMREFERENCE WHERE OPR_CLAIMNUMBER IN ('00010157025097700588',
'00010157025097700582',
'00010157025097700661')
--------------------------------------------------------------------------------
SELECT CL.POLICYID,CL.POLICYDATE,CL.CLAIMDATE,CL.STATE, CL.OPERATIONPK,CNR.DESCRIPTION,CL.CLAIMNUMBER
               FROM CLAIM  CL
                    JOIN CLAIMRISKUNIT CRU ON CL.CLAIMID = CRU.CLAIMID
                    JOIN CLAIMINSURANCEOBJECT CIO
                        ON CRU.CLAIMRISKUNITID = CIO.CLAIMRISKUNITID
                    JOIN CLAIMNORMALRESERVE CNR
                        ON CIO.CLAIMINSURANCEOBJECTID =
                           CNR.CLAIMINSURANCEOBJECTID
              WHERE CL.POLICYID IN (496638759)
--------------------------------------------------------------------------------
SELECT * FROM OPENITEM WHERE OPENITEMID IN (6535205421,
6637436909,
6637436910,
6637440540,
6552863426,
6552863429,
6552863430,
6684916027,
6686949831,
6686949832) AND DTY_ID = 5732
--------------------------------------------------------------------------------
select * from stca_doctype where dty_id in (
4014,
5732,
4053
)
--------------------------------------------------------------------------------
SELECT * FROM OPENITEM WHERE OPENITEMID IN (6535205421,
6637436909,
6637436910,
6637440540,
6552863426,
6552863429,
6552863430,
6684916027,
6686949831,
6686949832)
--------------------------------------------------------------------------------
SELECT CL.POLICYID,CL.POLICYDATE,CL.CLAIMDATE,CL.STATE, CL.OPERATIONPK,CNR.DESCRIPTION
               FROM CLAIM  CL
                    JOIN CLAIMRISKUNIT CRU ON CL.CLAIMID = CRU.CLAIMID
                    JOIN CLAIMINSURANCEOBJECT CIO
                        ON CRU.CLAIMRISKUNITID = CIO.CLAIMRISKUNITID
                    JOIN CLAIMNORMALRESERVE CNR
                        ON CIO.CLAIMINSURANCEOBJECTID =
                           CNR.CLAIMINSURANCEOBJECTID
              WHERE CL.POLICYID IN (496638759)
--------------------------------------------------------------------------------
SELECT * FROM OPENITEMREFERENCE
--------------------------------------------------------------------------------
SELECT * FROM CLAIM WHERE POLICYID = 496638759
--------------------------------------------------------------------------------
SELECT CL.POLICYID,CL.OPERATIONPK--,CL.OPERATIONPK, CL.CLAIMNUMBER, CL.STATE, CL.POLICYDATE AS CLAIMDATE, PDCO.INITIALDATE 
FROM CLAIM CL
LEFT JOIN AGREGATEDPOLICY AG ON AG.AGREGATEDPOLICYID = CL.POLICYID
JOIN PRODUCT PRO ON AG.PRODUCTID = PRO.PRODUCTID AND PRO.DESCRIPTION IN ('DesgravamenBBVADesempleo')
JOIN CONTEXTOPERATION CO ON CO.ID = CL.OPERATIONPK AND STATUS = 2
JOIN POLICYDCO PDCO ON PDCO.OPERATIONPK = CO.ID
LEFT JOIN OPENITEMREFERENCE OIR ON OPR_CLAIMNUMBER = CL.CLAIMNUMBER
GROUP BY CL.POLICYID,CL.OPERATIONPK
HAVING COUNT(CL.POLICYID)>3
--------------------------------------------------------------------------------
SELECT * FROM CLAIM WHERE POLICYID = 435861055
--------------------------------------------------------------------------------
SELECT CL.POLICYID,CL.POLICYDATE,CL.CLAIMDATE,CL.STATE, CL.OPERATIONPK,CNR.DESCRIPTION
               FROM CLAIM  CL
                    JOIN CLAIMRISKUNIT CRU ON CL.CLAIMID = CRU.CLAIMID
                    JOIN CLAIMINSURANCEOBJECT CIO
                        ON CRU.CLAIMRISKUNITID = CIO.CLAIMRISKUNITID
                    JOIN CLAIMNORMALRESERVE CNR
                        ON CIO.CLAIMINSURANCEOBJECTID =
                           CNR.CLAIMINSURANCEOBJECTID
              WHERE CL.POLICYID IN (429049924)
--------------------------------------------------------------------------------
SELECT * FROM CLAIM WHERE POLICYID = 429049924
--------------------------------------------------------------------------------
SELECT CL.POLICYID,CL.CLAIMNUMBER--,CL.OPERATIONPK, CL.CLAIMNUMBER, CL.STATE, CL.POLICYDATE AS CLAIMDATE, PDCO.INITIALDATE 
FROM CLAIM CL
LEFT JOIN AGREGATEDPOLICY AG ON AG.AGREGATEDPOLICYID = CL.POLICYID
JOIN PRODUCT PRO ON AG.PRODUCTID = PRO.PRODUCTID AND PRO.DESCRIPTION IN ('DesgravamenBBVADesempleo')
JOIN CONTEXTOPERATION CO ON CO.ID = CL.OPERATIONPK AND STATUS = 2
JOIN POLICYDCO PDCO ON PDCO.OPERATIONPK = CO.ID
LEFT JOIN OPENITEMREFERENCE OIR ON OPR_CLAIMNUMBER = CL.CLAIMNUMBER
GROUP BY CL.POLICYID,CL.CLAIMNUMBER
HAVING COUNT(CL.POLICYID)>3
--------------------------------------------------------------------------------
SELECT CL.POLICYID,CL.CLAIMNUMBER--,CL.OPERATIONPK, CL.CLAIMNUMBER, CL.STATE, CL.POLICYDATE AS CLAIMDATE, PDCO.INITIALDATE 
FROM CLAIM CL
LEFT JOIN AGREGATEDPOLICY AG ON AG.AGREGATEDPOLICYID = CL.POLICYID
JOIN PRODUCT PRO ON AG.PRODUCTID = PRO.PRODUCTID AND PRO.DESCRIPTION IN ('DesgravamenBBVADesempleo')
JOIN CONTEXTOPERATION CO ON CO.ID = CL.OPERATIONPK AND STATUS = 2
JOIN POLICYDCO PDCO ON PDCO.OPERATIONPK = CO.ID
LEFT JOIN OPENITEMREFERENCE OIR ON OPR_CLAIMNUMBER = CL.CLAIMNUMBER
GROUP BY CL.POLICYID,CL.CLAIMNUMBER
HAVING COUNT(CL.CLAIMNUMBER)>3
--------------------------------------------------------------------------------
SELECT CL.POLICYID,CL.CLAIMNUMBER--,CL.OPERATIONPK, CL.CLAIMNUMBER, CL.STATE, CL.POLICYDATE AS CLAIMDATE, PDCO.INITIALDATE 
FROM CLAIM CL
LEFT JOIN AGREGATEDPOLICY AG ON AG.AGREGATEDPOLICYID = CL.POLICYID
JOIN PRODUCT PRO ON AG.PRODUCTID = PRO.PRODUCTID AND PRO.DESCRIPTION IN ('DesgravamenBBVADesempleo')
JOIN CONTEXTOPERATION CO ON CO.ID = CL.OPERATIONPK AND STATUS = 2
JOIN POLICYDCO PDCO ON PDCO.OPERATIONPK = CO.ID
JOIN OPENITEMREFERENCE OIR ON OPR_CLAIMNUMBER = CL.CLAIMNUMBER
GROUP BY CL.POLICYID,CL.CLAIMNUMBER
HAVING COUNT(CL.CLAIMNUMBER)>3
--------------------------------------------------------------------------------
SELECT CL.POLICYID,CL.CLAIMNUMBER--,CL.OPERATIONPK, CL.CLAIMNUMBER, CL.STATE, CL.POLICYDATE AS CLAIMDATE, PDCO.INITIALDATE 
FROM CLAIM CL
LEFT JOIN AGREGATEDPOLICY AG ON AG.AGREGATEDPOLICYID = CL.POLICYID
JOIN PRODUCT PRO ON AG.PRODUCTID = PRO.PRODUCTID AND PRO.DESCRIPTION IN ('DesgravamenBBVADesempleo')
JOIN CONTEXTOPERATION CO ON CO.ID = CL.OPERATIONPK AND STATUS = 2
JOIN POLICYDCO PDCO ON PDCO.OPERATIONPK = CO.ID
JOIN OPENITEMREFERENCE OIR ON OPR_CLAIMNUMBER = CL.CLAIMNUMBER
GROUP BY CL.POLICYID,CL.CLAIMNUMBER
HAVING COUNT(CL.CLAIMNUMBER)>2
--------------------------------------------------------------------------------
SELECT CL.POLICYID--,CL.OPERATIONPK, CL.CLAIMNUMBER, CL.STATE, CL.POLICYDATE AS CLAIMDATE, PDCO.INITIALDATE 
FROM CLAIM CL
LEFT JOIN AGREGATEDPOLICY AG ON AG.AGREGATEDPOLICYID = CL.POLICYID
JOIN PRODUCT PRO ON AG.PRODUCTID = PRO.PRODUCTID AND PRO.DESCRIPTION IN ('DesgravamenBBVADesempleo')
JOIN CONTEXTOPERATION CO ON CO.ID = CL.OPERATIONPK AND STATUS = 2
JOIN POLICYDCO PDCO ON PDCO.OPERATIONPK = CO.ID
JOIN OPENITEMREFERENCE OIR ON OPR_CLAIMNUMBER = CL.CLAIMNUMBER
GROUP BY CL.POLICYID
HAVING COUNT(CL.CLAIMNUMBER)>2
--------------------------------------------------------------------------------
SELECT * FROM CLAIM WHERE POLICYID = 432447911
--------------------------------------------------------------------------------
select * from openitem where openitemid = 432447911
--------------------------------------------------------------------------------
SELECT CL.POLICYID--,CL.OPERATIONPK, CL.CLAIMNUMBER, CL.STATE, CL.POLICYDATE AS CLAIMDATE, PDCO.INITIALDATE 
FROM CLAIM CL
LEFT JOIN AGREGATEDPOLICY AG ON AG.AGREGATEDPOLICYID = CL.POLICYID
JOIN PRODUCT PRO ON AG.PRODUCTID = PRO.PRODUCTID AND PRO.DESCRIPTION IN ('DesgravamenBBVADesempleo')
JOIN CONTEXTOPERATION CO ON CO.ID = CL.OPERATIONPK AND STATUS = 2
JOIN POLICYDCO PDCO ON PDCO.OPERATIONPK = CO.ID
JOIN OPENITEMREFERENCE OIR ON OPR_CLAIMNUMBER = CL.CLAIMNUMBER
GROUP BY CL.POLICYID
HAVING COUNT(CL.CLAIMNUMBER)>1
--------------------------------------------------------------------------------
SELECT * FROM CLAIM WHERE POLICYID = 432454596
--------------------------------------------------------------------------------
SELECT CL.POLICYID--,CL.OPERATIONPK, CL.CLAIMNUMBER, CL.STATE, CL.POLICYDATE AS CLAIMDATE, PDCO.INITIALDATE 
FROM CLAIM CL
LEFT JOIN AGREGATEDPOLICY AG ON AG.AGREGATEDPOLICYID = CL.POLICYID
JOIN PRODUCT PRO ON AG.PRODUCTID = PRO.PRODUCTID AND PRO.DESCRIPTION IN ('DesgravamenBBVADesempleo')
JOIN CONTEXTOPERATION CO ON CO.ID = CL.OPERATIONPK AND STATUS = 2
JOIN POLICYDCO PDCO ON PDCO.OPERATIONPK = CO.ID
JOIN OPENITEMREFERENCE OIR ON OPR_CLAIMNUMBER = CL.CLAIMNUMBER
GROUP BY CL.POLICYID
HAVING COUNT(CL.POLICYID)>1
--------------------------------------------------------------------------------
SELECT CL.POLICYID,CL.OPERATIONPK, CL.CLAIMNUMBER, CL.STATE, CL.POLICYDATE AS CLAIMDATE, PDCO.INITIALDATE FROM CLAIM CL
LEFT JOIN AGREGATEDPOLICY AG ON AG.AGREGATEDPOLICYID = CL.POLICYID
JOIN PRODUCT PRO ON AG.PRODUCTID = PRO.PRODUCTID AND PRO.DESCRIPTION IN ('DesgravamenBBVADesempleo')
JOIN CONTEXTOPERATION CO ON CO.ID = CL.OPERATIONPK AND STATUS = 2
JOIN POLICYDCO PDCO ON PDCO.OPERATIONPK = CO.ID
JOIN OPENITEMREFERENCE OIR ON OPR_CLAIMNUMBER = CL.CLAIMNUMBER
--------------------------------------------------------------------------------
SELECT CL.POLICYID,CL.POLICYDATE,CL.CLAIMDATE,CL.STATE, CL.OPERATIONPK,CNR.DESCRIPTION
               FROM CLAIM  CL
                    JOIN CLAIMRISKUNIT CRU ON CL.CLAIMID = CRU.CLAIMID
                    JOIN CLAIMINSURANCEOBJECT CIO
                        ON CRU.CLAIMRISKUNITID = CIO.CLAIMRISKUNITID
                    JOIN CLAIMNORMALRESERVE CNR
                        ON CIO.CLAIMINSURANCEOBJECTID =
                           CNR.CLAIMINSURANCEOBJECTID
              WHERE CL.CLAIMNUMBER = '0001015701732300353'
--------------------------------------------------------------------------------
SELECT CL.POLICYID,CL.POLICYDATE,CL.STATE, CL.OPERATIONPK,CNR.DESCRIPTION
               FROM CLAIM  CL
                    JOIN CLAIMRISKUNIT CRU ON CL.CLAIMID = CRU.CLAIMID
                    JOIN CLAIMINSURANCEOBJECT CIO
                        ON CRU.CLAIMRISKUNITID = CIO.CLAIMRISKUNITID
                    JOIN CLAIMNORMALRESERVE CNR
                        ON CIO.CLAIMINSURANCEOBJECTID =
                           CNR.CLAIMINSURANCEOBJECTID
              WHERE CL.CLAIMNUMBER = '0001015701732300353'
--------------------------------------------------------------------------------
SELECT SQ_ICR_LOG.nextval,
                    CL.CLAIMID,
                    CRU.CLAIMRISKUNITID,
                    CIO.CLAIMINSURANCEOBJECTID,
                    CNR.CLAIMNORMALRESERVEDID,
                    CL.OPERATIONPK,
                    CNR.*
               FROM CLAIM  CL
                    JOIN CLAIMRISKUNIT CRU ON CL.CLAIMID = CRU.CLAIMID
                    JOIN CLAIMINSURANCEOBJECT CIO
                        ON CRU.CLAIMRISKUNITID = CIO.CLAIMRISKUNITID
                    JOIN CLAIMNORMALRESERVE CNR
                        ON CIO.CLAIMINSURANCEOBJECTID =
                           CNR.CLAIMINSURANCEOBJECTID
              WHERE CL.CLAIMNUMBER = '0001015701732300353'
--------------------------------------------------------------------------------
SELECT SQ_ICR_LOG.nextval,
                    CL.CLAIMID,
                    CRU.CLAIMRISKUNITID,
                    CIO.CLAIMINSURANCEOBJECTID,
                    CNR.CLAIMNORMALRESERVEDID,
                    CL.OPERATIONPK,
                    CNR.RESERVELIMIT,
                    CNR.CNR_MAXPAYMENTAMOUNT
               FROM CLAIM  CL
                    JOIN CLAIMRISKUNIT CRU ON CL.CLAIMID = CRU.CLAIMID
                    JOIN CLAIMINSURANCEOBJECT CIO
                        ON CRU.CLAIMRISKUNITID = CIO.CLAIMRISKUNITID
                    JOIN CLAIMNORMALRESERVE CNR
                        ON CIO.CLAIMINSURANCEOBJECTID =
                           CNR.CLAIMINSURANCEOBJECTID
              WHERE CL.CLAIMNUMBER = '0001015701732300353'
--------------------------------------------------------------------------------
select * from stca_doctype where dty_id in (5732)
--------------------------------------------------------------------------------
select * from openitem where openitemid = 6254825972
--------------------------------------------------------------------------------
select * from openitemreference where opr_claimnumber = '0001015701732300353'
--------------------------------------------------------------------------------
select * from CLAIMINSURANCEOBJECT
--------------------------------------------------------------------------------
select * from CLAIMRISKUNIT
--------------------------------------------------------------------------------
SELECT COUNT(DISTINCT (DESCRIPTION)) FROM COVERAGEDCO CDCO
JOIN CONTEXTOPERATION CO ON CO.ID = CDCO.OPERATIONPK
WHERE CO.ITEM = 513887243 AND CO.STATUS = 2 AND CDCO.DESCRIPTION = 'InvalidezTotalyPermanentePorAccidente'
--------------------------------------------------------------------------------
SELECT COUNT(DISTINCT (DESCRIPTION)) FROM COVERAGEDCO CDCO
JOIN POLICYDCO PDCO ON PDCO.OPERATIONPK = CDCO.OPERATIONPK
WHERE PDCO.AGREGATEDOBJECTID =513887243 AND CDCO.DESCRIPTION = 'InvalidezTotalyPermanentePorAccidente'
--------------------------------------------------------------------------------
SELECT COUNT(DESCRIPTION) FROM COVERAGEDCO CDCO
JOIN POLICYDCO PDCO ON PDCO.OPERATIONPK = CDCO.OPERATIONPK
WHERE PDCO.AGREGATEDOBJECTID =513887243 AND UPPER(CDCO.DESCRIPTION) IN UPPER('InvalidezTotalyPermanentePorAccidente')
--------------------------------------------------------------------------------
SELECT 1 FROM COVERAGEDCO CDCO
JOIN POLICYDCO PDCO ON PDCO.OPERATIONPK = CDCO.OPERATIONPK
WHERE PDCO.AGREGATEDOBJECTID =513887243 AND UPPER(CDCO.DESCRIPTION) IN UPPER('InvalidezTotalyPermanentePorAccidente')
--------------------------------------------------------------------------------
select distinct description from COVERAGEDCO where operationpk in (select operationpk from policydco where agregatedobjectid =513887243)
--------------------------------------------------------------------------------
select * from COVERAGEDCO where operationpk in (select operationpk from policydco where agregatedobjectid =513887243)
--------------------------------------------------------------------------------
select * from COVERAGEDCO where operationpk in (1470085524)
--------------------------------------------------------------------------------
select * from COVERAGEDCO
--------------------------------------------------------------------------------
select * from COBERTURA
--------------------------------------------------------------------------------
select 518539183 - 208744019 from agregatedpolicy
--------------------------------------------------------------------------------
select min(agregatedpolicyid) from agregatedpolicy
--------------------------------------------------------------------------------
select max(agregatedpolicyid) from agregatedpolicy
--------------------------------------------------------------------------------
select dty_id from openitem where openitemid = 6254825972
--------------------------------------------------------------------------------
SELECT CL.POLICYID,CL.OPERATIONPK, CL.CLAIMNUMBER, CL.STATE, CL.POLICYDATE AS CLAIMDATE, PDCO.INITIALDATE FROM CLAIM CL
LEFT JOIN AGREGATEDPOLICY AG ON AG.AGREGATEDPOLICYID = CL.POLICYID
JOIN PRODUCT PRO ON AG.PRODUCTID = PRO.PRODUCTID AND PRO.DESCRIPTION IN ('DesgravamenBBVADesempleo')
JOIN CONTEXTOPERATION CO ON CO.ID = CL.OPERATIONPK AND STATUS = 2
JOIN POLICYDCO PDCO ON PDCO.OPERATIONPK = CO.ID
--------------------------------------------------------------------------------
select * from openitemreference
--------------------------------------------------------------------------------
select * from stca_doctype where dty_id in (select dty_id from openitem where operationpk = 730402480)
--------------------------------------------------------------------------------
select * from openitem where operationpk = 730402480
--------------------------------------------------------------------------------
select * from stca_doctype where dty_id in (8212,7332)
--------------------------------------------------------------------------------
SELECT CL.POLICYID,CL.CLAIMNUMBER, CL.STATE, CL.POLICYDATE AS CLAIMDATE, PDCO.INITIALDATE FROM CLAIM CL
LEFT JOIN AGREGATEDPOLICY AG ON AG.AGREGATEDPOLICYID = CL.POLICYID
JOIN PRODUCT PRO ON AG.PRODUCTID = PRO.PRODUCTID AND PRO.DESCRIPTION IN ('DesgravamenBBVADesempleo')
JOIN CONTEXTOPERATION CO ON CO.ID = CL.OPERATIONPK AND STATUS = 2
JOIN POLICYDCO PDCO ON PDCO.OPERATIONPK = CO.ID
--------------------------------------------------------------------------------
SELECT CL.POLICYID,CL.CLAIMNUMBER, CL.STATE, TO_DATE(CL.POLICYDATE,'YYYY/mm/DD') AS CLAIMDATE, PDCO.INITIALDATE FROM CLAIM CL
LEFT JOIN AGREGATEDPOLICY AG ON AG.AGREGATEDPOLICYID = CL.POLICYID
JOIN PRODUCT PRO ON AG.PRODUCTID = PRO.PRODUCTID AND PRO.DESCRIPTION IN ('DesgravamenBBVADesempleo')
JOIN CONTEXTOPERATION CO ON CO.ID = CL.OPERATIONPK AND STATUS = 2
JOIN POLICYDCO PDCO ON PDCO.OPERATIONPK = CO.ID
--------------------------------------------------------------------------------
SELECT CL.POLICYID,CL.CLAIMNUMBER, CL.STATE, TO_DATE(CL.POLICYDATE,'YYYY-MM-DD') AS CLAIMDATE, PDCO.INITIALDATE FROM CLAIM CL
LEFT JOIN AGREGATEDPOLICY AG ON AG.AGREGATEDPOLICYID = CL.POLICYID
JOIN PRODUCT PRO ON AG.PRODUCTID = PRO.PRODUCTID AND PRO.DESCRIPTION IN ('DesgravamenBBVADesempleo')
JOIN CONTEXTOPERATION CO ON CO.ID = CL.OPERATIONPK AND STATUS = 2
JOIN POLICYDCO PDCO ON PDCO.OPERATIONPK = CO.ID
--------------------------------------------------------------------------------
SELECT CL.POLICYID,CL.CLAIMNUMBER, CL.STATE, CL.POLICYDATE FROM CLAIM CL
LEFT JOIN AGREGATEDPOLICY AG ON AG.AGREGATEDPOLICYID = CL.POLICYID
JOIN PRODUCT PRO ON AG.PRODUCTID = PRO.PRODUCTID AND PRO.DESCRIPTION IN ('DesgravamenBBVADesempleo')
JOIN CONTEXTOPERATION CO ON CO.ID = CL.OPERATIONPK AND STATUS = 2
JOIN POLICYDCO PDCO ON PDCO.OPERATIONPK = CO.ID