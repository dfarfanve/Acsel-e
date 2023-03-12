	1. Enviar anular el documento.
			1.1 Pasar a cancelados los documentos.
			1.2 Insertar en la batch de Anulados.
			1.3 Ejecutar el Job.
			1.4 Validar que se vayan los documentos.
			1.5 Pasar los documentos a Active :
            
 -- Si es PÖR BAJA o ANULACION
-- Se debe anular el openitem y en history e insertar en la batch

-- Paso 1.1  

update APP_VIDA.stca_openitemhistory set  oih_auditdate = to_date('29-03-2021','dd-mm-yyyy') , 
oih_status = 'cancelled' ,oih_substatus = 'cancelled'
where  opm_id in  (6440366986,
6440366985,
6440366984) 
and oih_description = 'openItemHistoryStatus.creation' ;

select * from APP_VIDA.stca_openitemhistory where opm_id in (6440366986,
6440366985,
6440366984) 
and oih_description = 'openItemHistoryStatus.creation'; 

-- status = pending  oih_substatus = notApplied

update openitem  set status  = 'cancelled' , opm_substatus= 'cancelled' 
where openitemid in (6440366986,
6440366985,
6440366984)  ;



   select * from app_vida.STPS_BATCHPROCESSRECORD_FUND where id_object in  (
   select operationpk from openitem where openitemid  in (6440366986,
6440366985,
6440366984)  
   ) ;
   
    INSERT INTO   app_vida.STPS_BATCHPROCESSRECORD_FUND (id, id_object, proctype, filename, processed) 
   SELECT      app_vida.SQ_STPS_BATCHPR_FUND.NEXTVAL ,      CO.ID,      'ANU',      '2021-04-29_OpenItemsFundsManual_cancel',      0    
   FROM contextoperation CO where id in ( select operationpk from openitem where openitemid  in in (6440366986,
6440366985,
6440366984)   ) ;
   
   select * from app_vida.STPS_BATCHPROCESSRECORD_FUND where id_object = 1583937531;

--------------------------------------------------------------------------

-- Paso 1.5


update APP_VIDA.stca_openitemhistory set  oih_auditdate = to_date('29-03-2021','dd-mm-yyyy') , 
oih_status = 'pending' ,oih_substatus = 'notApplied', oih_description = 'openItemHistoryStatus.MigracionApi'
where  opm_id in  (8591306067,
8591303009,
8591299982,
8591305177,
8612492589) 
and oih_description = 'openItemHistoryStatus.creation' ;

select * from APP_VIDA.stca_openitemhistory where opm_id in  (8591306067,
8591303009,
8591299982,
8591305177,
8612492589) 
and oih_description = 'openItemHistoryStatus.MigracionApi'; 

-- status = pending  oih_substatus = notApplied

update openitem  set status  = 'active' , opm_substatus= 'active' 
where openitemid in (8591306067,
8591303009,
8591299982,
8591305177,
8612492589)  ;


select * from openitem where openitemid  in (8591306067,
8591303009,
8591299982,
8591305177,
8612492589)  ;
