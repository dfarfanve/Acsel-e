DECLARE

     OPEITEMMODELO 		  NUMBER(19,0); 
     OPEITEMNUEVO         NUMBER(19,0); 
     NUMDOC_NUEVO           NUMBER(19,0); 
     CONTROL_NUEVO           NUMBER(19,0); 
BEGIN

-- ESTE PROCEDIMIENTO SIRVE PARA GENERAR UNA NUEVA OBLIGACION PARA UN NUEVO OPENITEM TOMANDO COMO REFERENCIA OTRO OPENITEM DE OTRA POLIZA  OPEITEMMODELO A LA QUE SE LE GENERO OBLIGACION.
-- LUEGO TOCA LOS INSERT obteniendo de la transacre la informacion propia del openitem Nuevo que no ha tenido ninguna obligacion
-- EN CASO NO HAYA GENERADO NINGUNA OBLIGACION SE DEBE REALIZAR DE OTRA MANERA
 
   -- EL MODELO YA TUVO QUE GENERAR UNA OBLIGACION PREVIAMENTE
    OPEITEMMODELO := 8122541239 ;                    
    OPEITEMNUEVO := 8303729788 ;   
     
-- OBTENER  EL CONTROL y el NUMOBLIG:
                    SELECT sq_obligacion.nextval@DBL_PROD  ,  sq_ACSELXINTERFACE_CONTROL.NEXTVAL 
                    INTO NUMDOC_NUEVO, CONTROL_NUEVO
                    FROM  dual; 
                    


                    INSERT INTO ITFCTRLOBL
                    (ORIGEN,TIPOPROCESO,CONTROL,ESTADO,DESCPROCESO)
                    VALUES ('AE','O',CONTROL_NUEVO,'0','PDTE PAGAR A/E');
                    
                    -- CON ESTO BLOQUEO EL CONTROL 
                    update ITFCTRLOBL set estado='I' where control=CONTROL_NUEVO;
                    
                    

        INSERT INTO Tempoblig
        Select Sisorig, Tipodoc, NUMDOC_NUEVO , -- Numdoc, 
        Numlinea, 'VAL', Codprod, Tipopago, Genrelegre, Formapago, Bancodest, Ctadest, Formrelegre, Numpol, Numendoso, Numcert, Codcobert, Codplan, Numsinorig, 'PAG',
        Numoblig, Tipoid, Numid, Dvid, Tipooblig, Fecsts, Fecgtiapago, Textoblig, Codmoneda, Mtobrutoobligmoneda, Mtonetoobligmoneda, Dptoemi, Sldoobligmoneda, 
        Codinterlider, Codcia, Numagrup, Tipoidaseg, Numidaseg, Dvidaseg, Nombregiracheq, Monedactabco, Fechasiniestro, Dvidagencia, Dvidaseage, 
        CONTROL_NUEVO, -- Ctrl,
        Tipobenef, Mtobrutoobliglocal, Mtonetoobliglocal, Sldoobliglocal, Centrocosto, Fecinivig, Feceminota, Fecfinvig, Fecing, Idepol, 
        Indcoa, Porccoa, Codramoafect, Numidcoalider, Codlid, Porcpart, Tipopdcion, Ramop, Numidagt, Tipomov, Ctrlproceso, Fecinitra, Fecfintra,
        Codofi_Mc, Codcanal_Mc, Tipocanal_Mc, Codagerimac_Mc, Numidinter_Mc, Codageinter_Mc, Numidejec_Mc, Codigoebs, Codagecorre_Mc, OPEITEMNUEVO -- Ideacsele
        , Numordpag,numacre,coduser
        From Transoblig T 
        Where T.ideacsele =  OPEITEMMODELO;
    
    
        INSERT INTO TempDETOBLIG 
        select SISORIG,TIPODOC,NUMDOC,NUMLINEA,STSOBLIG,'71','0','0',CODMONEDA,'000000' ,
        NULL,Mtobrutoobligmoneda,Mtobrutoobligmoneda,'A','N', CONTROL_NUEVO --CTRL,
        ,null,null,null,null
        from TRANSOBLIG
        WHERE  numdoc IN ( SELECT NUMDOC FROM Tempoblig T WHERE  T.ideacsele =  OPEITEMMODELO );
                    
        -- Validar Montos y la MONEDA 
        update APP_VIDA.tempoblig set NUMPOL =  '90018970' , NUMID = '16462961' , FECSTS = '20200603' , MTOBRUTOOBLIGMONEDA = 181.39 , MTONETOOBLIGMONEDA =  181.39  ,
        SLDOOBLIGMONEDA =  181.39 , MTOBRUTOOBLIGLOCAL = 181.39 , MTONETOOBLIGLOCAL =  181.39  , SLDOOBLIGLOCAL =  181.39 ,
        NUMIDASEG = '16462961' ,
        NOMBREGIRACHEQ = 'KAREEN JESSICA BENAVENTE INCA' , 
        TIPOMOV = 'MOD' ,
        CODMONEDA ='002'
        WHERE IDEACSELE = OPEITEMNUEVO;
        
        update APP_VIDA.transoblig set NUMPOL =  '90018970' , NUMID = '16462961' , FECSTS = '20200603' , MTOBRUTOOBLIGMONEDA = 181.39 , MTONETOOBLIGMONEDA =  181.39  ,
        SLDOOBLIGMONEDA =  181.39 , MTOBRUTOOBLIGLOCAL = 181.39 , MTONETOOBLIGLOCAL =  181.39  , SLDOOBLIGLOCAL =  181.39 ,
        NUMIDASEG = '16462961' ,
        NOMBREGIRACHEQ = 'KAREEN JESSICA BENAVENTE INCA' , 
        TIPOMOV = 'MOD' ,
        CODMONEDA ='002'
        WHERE IDEACSELE = OPEITEMNUEVO;
        
         update  APP_VIDA.TempDETOBLIG set mtocptoegre = 181.39 , mtodetobligmoneda =  181.39 ,
         CODMONEDA ='002'
        where numdoc in ( select numdoc from APP_VIDA.transoblig where ideacsele = OPEITEMNUEVO );
        
        update  APP_VIDA.transdetoblig set mtocptoegre = 181.39 , mtodetobligmoneda =  181.39 ,
        CODMONEDA ='002'
        where numdoc in ( select numdoc from APP_VIDA.transoblig where ideacsele = OPEITEMNUEVO );
             
     
     -- con esto activo el control:    
         Update Itfctrlobl
            Set Estado = 'O' --  O 
            Where Control in (select ctrl from transoblig T 
                              where  T.numdoc IN ( NUMDOC_NUEVO ) );
                           
                   
 
  -- END LOOP;
  COMMIT;

END;


