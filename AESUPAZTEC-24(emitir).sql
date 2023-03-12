
SELECT
    cntxop.id                    AS operationpk,
    cntxop.item                  AS polizaid,
    prepo.numeropolizainput      AS NumeroPoliza,
    pod.initialdate              AS fechainicial,
    pod.finishdate               AS fechafinal,
    evttype.description          AS descripcionevento,
    plan.description             AS nombreplan,
    oavc.grupotarifainput        AS GRUPOTARIFA,
    aggin.description            AS nombreobjetoasegurado,
    oavc.sasaldodeudorinput      AS saldodeudor,
    oavc.periodicidadinput       AS tdperiodicidad,
    oavc.plazocreditoinput       AS tdplazo,
    oavc.planinput               AS tdplan,
    oavc.savidamaxinput          AS sumaasegurada,
    oavc.primatotalinterfazinput AS primaneto,
    cov.description              AS coberturas,
    cob.covsumaaseguradainput    AS sumaaseguradacobertura,
    cob.covprimanetainput        AS primanetacobertura
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
    AND prepo.numeropolizainput IN ( '420158860001488783',
                                    '420956840000435353',
                                    '420951750002394516',
                                    '420105180009332289',
                                    '420120010007385621',
                                    '420181380009045570',
                                    '420102590006150310',
                                    '420106600005856390',
                                    '420181380009055755',
                                    '420161340001831807',
                                    '420161690021701577',
                                    '420132690014890985',
                                    '420120840006424882',
                                    '420158390002046767',
                                    '420125320018558696',
                                    '420158780001677479',
                                    '420117790022631447',
                                    '420147720001512955',
                                    '420154870015965997',
                                    '420143780017732504',
                                    '420120040007328153',
                                    '420186240004456108',
                                    '420172360010004776',
                                    '423947810001155360',
                                    '420158390002053106',
                                    '420120020005229446',
                                    '420904290002132421',
                                    '420161030002468301',
                                    '420141770002057411',
                                    '420907550001344354',
                                    '420959070001344659',
                                    '420134760011938469',
                                    '420162370012970888',
                                    '420171000018415912',
                                    '420172360010019886',
                                    '420120740005194437',
                                    '420147500006523449',
                                    '420152120019276922',
                                    '420127230007113727',
                                    '420138870012910948',
                                    '420160920004827861',
                                    '420182770007288558',
                                    '420110540014718590',
                                    '420122180004361617',
                                    '420160170012811609',
                                    '420186790004051913',
                                    '420124350009201399',
                                    '420139680007855168',
                                    '420140760001524975',
                                    '420161890001805386')
    AND evttype.description IN ( 'Emitir' )
    AND plan.description = 'PLANBasicoNVMX'
    order by prepo.numeropolizainput;