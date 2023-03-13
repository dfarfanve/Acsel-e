jdbc.Datasource-GS
jdbc.Datasource-PE



  FUNCTION GET_LASTPART_NUMPOL(p_product_name IN VARCHAR2,p_moncom IN VARCHAR2) RETURN VARCHAR2 RESULT_CACHE
    IS
    v_valor VARCHAR2(4);
    BEGIN
      SELECT CASE WHEN A.BIMONEDAINPUT = 'Si' THEN '-' || p_moncom ELSE '' END as formato_out INTO v_valor
      FROM   PREPRODUCT A
      WHERE  A.STATIC = INT_UTIL.GET_PRODUCTID_BY_NAME (p_product_name);
      RETURN v_valor;
      EXCEPTION
      WHEN OTHERS THEN
      RETURN '';
    END GET_BICURRENCY;