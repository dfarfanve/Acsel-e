DECLARE v_err_msg VARCHAR2(1000);
BEGIN
 INT_AUX.APLICAR_COMODIN(799,1308250051,v_err_msg);
  dbms_output.put_line(v_err_msg);
END;