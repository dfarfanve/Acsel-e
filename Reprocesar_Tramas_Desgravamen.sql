
-- Productos mas usados: DesgravamenBBVADesempleo, DesgravamenBBVATCDesempleo  DesgravamenFORUM ,DesgravamenEFECTIVA


-- PASO 1: Buscar tramas para reprocesar

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
and  pal_status = 1;

-- PASO 2: Obtener pal_recordid del PASO 1 de las tramas que se van a reprocesar
select * from stpo_policyaslogical where pal_recordid in (111996871,
111897107);

-- PASO 3: Bloquear las que esten pendientes de procesar 
update stpo_policyaslogical set pal_status = 6 where pal_status = 0 ;

-- PASO 4: Con esto se activa lo que se va a procesar
update stpo_policyaslogical set pal_status = 0 where pal_recordid in (111996871,
111897107);

-- PASO 5: Ejecutar por la aplicacion el Job: Emisión Masivo Desgravamen

-- PASO 6: Verificar pal_status = 1 y pal_policynumber = nuevo numero de poliza
select * from stpo_policyaslogical where pal_recordid in (111996871,
111897107);

-- PASO 7: Se obtiene el PK de la unidad de riesgo a partir del número de póliza para actualizar las propiedades en la plantilla

SELECT RUDESG.PK FROM PREPOLICY PRE
JOIN CONTEXTOPERATION CO ON CO.ITEM = PRE.STATIC
JOIN AGREGATEDRISKUNIT AR ON AR.OPERATIONPK = CO.ID
JOIN RISKUNITDCO RDCO ON RDCO.OPERATIONPK = AR.OPERATIONPK
JOIN PRERISKUNITS PRU ON PRU.PK = DCOID
JOIN RUDESGRAVAMEN RUDESG ON RUDESG.PK = PRU.PK 
WHERE PRE.NUMEROPOLIZAINPUT IN ('00010157040352000');

-- PASO 8: ASIGNAR TIPO DE DEVOLUCION Y SUBPLAN SINO LO TIENE 
--PlanConticasaB = "14.0"
--PlanLibreDisponibilidadB = "15.0"
--PlanMiViviendaB = "16.0"
--PlanVehicularesB = "17.0"  

update rudesgravamen set tipodevolucioninput='Básico', tipodevolucioninput='1.0', SUBPLANDESGRAVAMENVALUE='14.0',SUBPLANDESGRAVAMENINPUT='PlanConticasaB' where pk in 29742352504;
											