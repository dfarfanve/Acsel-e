FUNCTION GET_BICURRENCY(p_product_name IN VARCHAR2) RETURN VARCHAR2 RESULT_CACHE
  IS
    v_valor VARCHAR2(4);
    BEGIN
      SELECT  DECODE(A.BIMONEDAINPUT, 'Si', 'Y', 'No','N') as formato_out INTO v_valor
      FROM   PREPRODUCT A
      WHERE  A.STATIC = INT_UTIL.GET_PRODUCTID_BY_NAME (p_product_name);
      RETURN v_valor;
      EXCEPTION
      WHEN OTHERS THEN
      RETURN 'N';
    END GET_BICURRENCY;
	
	
	Si = 1.0
	No = 0.0