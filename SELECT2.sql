SELECT
          A.EVENTO_APLICAR,A.IND_CARGADO, A.ASL_LOGICAL_PK,A.ID_CORRELATIVO, A.ARCHIVO_TRAMA, A.EVENTO_APLICAR, A.PRIMER_NOMBRE, A.SEGUNDO_NOMBRE, A.APELLIDO_PATERNO, A.APELLIDO_MATERNO, A.TIPO_DOCUMENTO, A.NUMERO_DOCUMENTO, A.FECHA_NACIMIENTO, A.DIRECCION, A.TELEFONO, A.MONEDA, A.FECHA_INICIO_VIGENCIA, A.FECHA_FIN_VIGENCIA, A.NUMERO_CERTIFICADO, A.NUMERO_POLIZA, A.PRIMA_ARCHIVO, A.IMPORTE_CREDITO, A.TASA_SEGURO, A.CODIGO_VENDEDOR, A.SALDO_CREDITO, A.PRODUCTO, A.SUB_PRODUCTO, A.CODIGO_UNICO_CLIENTE, A.NRO_CUOTA, A.PLAZO, A.NRO_TARJETA, A.MOTIVO, A.TIPO_POLIZA, A.SUB_PRODUCTO_PLAN, A.TIPO_ASEGURADO, A.CODDEPARTAMENTO, A.CODPROVINCIA, A.CODDISTRITO,
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
        WHERE A.IND_CARGADO IS NULL AND A.ASL_LOGICAL_PK IS NULL;
        
        select * from prepolicy where numeropolizainput = '500105-0000149-02';
        
         SELECT count(*) AS cuenta, PRODUCTO, EVENTO_APLICAR, PERIODO_BASE FROM INT_DESG_PROCESS
      WHERE NUM_ERRORS = 0 GROUP BY PRODUCTO, EVENTO_APLICAR, PERIODO_BASE
      ORDER BY PERIODO_BASE, EVENTO_APLICAR, PRODUCTO; 
       select * FROM INT_DESG_PROCESS;
      update int_desg_process set evento_aplicar = 0,asl_logical_pk;
      
      SELECT TIPODESGINPUT FROM TDJOBDESGRAVAMENPARAM
      WHERE PRODUCTOSINPUT = 'DesgTarjetasIndividual';
      
      select * from OBJECT_TMP;