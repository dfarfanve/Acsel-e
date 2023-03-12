
   select * from app_vida.STPS_BATCHPROCESSRECORD_FUND where id_object in  (
   select operationpk from openitem where openitemid  in (8591306067,
8591303009,
8591299982,
8591305177,
8612492589) 
   )  and proctype is null; 

select * from APP_VIDA.stca_openiteminfo where opm_id in(8591306067,
8591303009,
8591299982,
8591305177,
8612492589)  ;

-- Paso 1  Activar en la Tabla batch los openiem que se van a reenviar
update APP_VIDA.stps_batchprocessrecord_fund set  processed = 0 ,filename = '2021-03-29_OpenItemsFunds' where id_object in 
(select operationpk from openitem where openitemid in (8591306067,
8591303009,
8591299982,
8591305177,
8612492589 )  ) 
 and proctype is null; 

-- Paso 2 eliminar de esta tabla el numdocAX asociado a ese openitem en el core de acsele
delete APP_VIDA.stca_openiteminfo where opm_id in ( 8591306067,
8591303009,
8591299982,
8591305177,
8612492589 ) ;

-- Paso 3 eliminar de la transacre
delete transacre where ideacsele in (
8158065064  ) ;


-----------------------------------------------------------------------
-- CONSULTAR EN LAS TABLAS LUEGO DE EJECUTAR EL JOB MANUAL O MASIVO
-- AQUI
select * from APP_VIDA.stps_batchprocessrecord_fund where id_object in 
(select operationpk from openitem where openitemid in (8591306067,
8591303009,
8591299982,
8591305177,
8612492589 )  ) 
 and proctype is null; 

select * from openitem where openitemid in 
( 8591306067,
8591303009,
8591299982,
8591305177,
8612492589 )  ;



select *  from transacre where ideacsele in ( 8591306067,
8591303009,
8591299982,
8591305177,
8612492589 ) ;

select *  from tempacre_masiva where ideacsele in ( 8591306067,
8591303009,
8591299982,
8591305177,
8612492589 ) ;




