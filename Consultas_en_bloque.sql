-------------------- CANCELACIONES VIDAMAXCREDITO AGOSTO - RAFAEL --------------------
SELECT Distinct
    cntxop.id,                    --AS operationpk,
    cntxop.item,                 -- AS polizaid,
    cntxop.time_stamp,
    prepo.numeropolizainput,      --AS NumeroPoliza,
    pod.initialdate,             -- AS fechainicial,
    pod.finishdate,              -- AS fechafinal,
    evttype.description ,        -- AS descripcionevento,
    plan.description,            -- AS nombreplan,
    oavc.grupotarifainput,       -- AS GRUPOTARIFA,
    aggin.description,           -- AS nombreobjetoasegurado,
    oavc.savidamaxinput,         -- AS sumaasegurada,
    oavc.sasaldodeudorinput,     -- AS saldodeudor,
    oavc.periodicidadinput,      -- AS tdperiodicidad,
    oavc.plazocreditoinput,      -- AS tdplazo,
    oavc.planinput,              -- AS tdplan,
    oavc.primatotalinterfazinput, -- AS primaneto,
    cov.description,             -- AS coberturas,
    cob.covsumaaseguradainput,   -- AS sumaaseguradacobertura,
    cob.covprimanetainput     --  AS primanetacobertura
FROM
         AZTECA_V138.policydco pod
    INNER JOIN AZTECA_V138.agregatedpolicy    aggpo ON ( pod.agregatedobjectid = aggpo.agregatedpolicyid )
    INNER JOIN AZTECA_V138.contextoperation   cntxop ON ( pod.operationpk = cntxop.id )
    INNER JOIN AZTECA_V138.prepolicy          prepo ON ( cntxop.item = prepo.static )
    INNER JOIN AZTECA_V138.eventdco           eve ON ( pod.operationpk = eve.operationpk )
    INNER JOIN AZTECA_V138.eventtype          evttype ON ( eve.eventtypeid = evttype.eventtypeid )
    INNER JOIN AZTECA_V138.product            po ON ( po.productid = aggpo.productid )
    INNER JOIN AZTECA_V138.plan               plan ON ( po.productid = plan.productid )
    INNER JOIN AZTECA_V138.agreginsobjecttype aggin ON ( po.productid = aggin.pro_id
                                             AND plan.planid = aggin.planpk )
    INNER JOIN AZTECA_V138.insuranceobjectdco inobj ON ( pod.operationpk = inobj.operationpk )
    INNER JOIN AZTECA_V138.oavidamaxcredito   oavc ON ( inobj.dcoid = oavc.pk )
    INNER JOIN AZTECA_V138.coveragedco        cov ON ( pod.operationpk = cov.operationpk )
    INNER JOIN AZTECA_V138.cobertura          cob ON ( cov.dcoid = cob.pk )
WHERE
    po.description = 'VidamaxCredito'
    AND evttype.description IN ( 'Cancelar' )
    AND plan.description = 'PLANBasicoNVMXSF'
    AND cntxop.time_stamp BETWEEN to_date('16/08/2021','dd-mm-yy') AND to_date('31/08/2021','dd-mm-yy');

-------------------- CANCELACIONES VIDAMAXCREDITO SEPTIEMBRE - RAFAEL --------------------

SELECT Distinct
    cntxop.id,                    --AS operationpk,
    cntxop.item,                 -- AS polizaid,
    cntxop.time_stamp,
    prepo.numeropolizainput,      --AS NumeroPoliza,
    pod.initialdate,             -- AS fechainicial,
    pod.finishdate,              -- AS fechafinal,
    evttype.description ,        -- AS descripcionevento,
    plan.description,            -- AS nombreplan,
    oavc.grupotarifainput,       -- AS GRUPOTARIFA,
    aggin.description,           -- AS nombreobjetoasegurado,
    oavc.savidamaxinput,         -- AS sumaasegurada,
    oavc.sasaldodeudorinput,     -- AS saldodeudor,
    oavc.periodicidadinput,      -- AS tdperiodicidad,
    oavc.plazocreditoinput,      -- AS tdplazo,
    oavc.planinput,              -- AS tdplan,
    oavc.primatotalinterfazinput, -- AS primaneto,
    cov.description,             -- AS coberturas,
    cob.covsumaaseguradainput,   -- AS sumaaseguradacobertura,
    cob.covprimanetainput     --  AS primanetacobertura
FROM
         AZTECA_V138.policydco pod
    INNER JOIN AZTECA_V138.agregatedpolicy    aggpo ON ( pod.agregatedobjectid = aggpo.agregatedpolicyid )
    INNER JOIN AZTECA_V138.contextoperation   cntxop ON ( pod.operationpk = cntxop.id )
    INNER JOIN AZTECA_V138.prepolicy          prepo ON ( cntxop.item = prepo.static )
    INNER JOIN AZTECA_V138.eventdco           eve ON ( pod.operationpk = eve.operationpk )
    INNER JOIN AZTECA_V138.eventtype          evttype ON ( eve.eventtypeid = evttype.eventtypeid )
    INNER JOIN AZTECA_V138.product            po ON ( po.productid = aggpo.productid )
    INNER JOIN AZTECA_V138.plan               plan ON ( po.productid = plan.productid )
    INNER JOIN AZTECA_V138.agreginsobjecttype aggin ON ( po.productid = aggin.pro_id
                                             AND plan.planid = aggin.planpk )
    INNER JOIN AZTECA_V138.insuranceobjectdco inobj ON ( pod.operationpk = inobj.operationpk )
    INNER JOIN AZTECA_V138.oavidamaxcredito   oavc ON ( inobj.dcoid = oavc.pk )
    INNER JOIN AZTECA_V138.coveragedco        cov ON ( pod.operationpk = cov.operationpk )
    INNER JOIN AZTECA_V138.cobertura          cob ON ( cov.dcoid = cob.pk )
WHERE
    po.description = 'VidamaxCredito'
    AND evttype.description IN ( 'Cancelar' )
    AND plan.description = 'PLANBasicoNVMXSF'
    AND cntxop.time_stamp BETWEEN to_date('1/09/2021','dd-mm-yy') AND to_date('30/09/2021','dd-mm-yy');

-------------------- SINIESTRO FUERA DE VIGENCIA - RAFAEL --------------------

select CLAIMID,CLAIMDATE,POLICYID,POLICYDATE,CLAIMNUMBER,OPERATIONPK,USC_LOGIN from AZTECA_V138.claim where claimnumber = 'VTC1-2023-42';

-------------------- VERSION DE BD AZTECA - DBA CONSIS --------------------

SELECT BANNER,BANNER_FULL,BANNER_LEGACY,CON_ID FROM  V$VERSION;

-------------------- LOTE DE SINIESTROS QUE SALTARON LOS CANDADOS --------------------
select pro.description,prepo.numeropolizainput, cla.claimnumber, cla.claimdate,cla.policydate,prepo.FECHAEMISIONINPUT,cla.operationpk,po.initialdate,po.finishdate 
from AZTECA_V138.claim cla
join AZTECA_V138.policydco po on cla.operationpk = po.operationpk
join AZTECA_V138.agregatedpolicy ag on ag.agregatedpolicyid = po.agregatedobjectid
join AZTECA_V138.product pro on pro.productid = ag.productid
INNER JOIN AZTECA_V138.prepolicy  prepo ON prepo.pk = po.dcoid
where (cla.claimdate < to_date(prepo.FECHAEMISIONINPUT,'dd-mm-yy') or cla.policydate < to_date(prepo.FECHAEMISIONINPUT,'dd-mm-yy'))
and usc_login <> 'migracion';