SELECT
    cntxop.id                    AS operationpk,
    cntxop.item                  AS polizaid,
    prepo.numeropolizainput      AS NumeroPoliza,
    pod.initialdate              AS fechainicial,
    pod.finishdate               AS fechafinal,
    evttype.description          AS descripcionevento,
    plan.description             AS nombreplan,
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
         policydco pod
    INNER JOIN agregatedpolicy    aggpo ON ( pod.agregatedobjectid = aggpo.agregatedpolicyid )
    INNER JOIN contextoperation   cntxop ON ( pod.operationpk = cntxop.id )
    INNER JOIN prepolicy          prepo ON ( cntxop.item = prepo.static )
    INNER JOIN eventdco           eve ON ( pod.operationpk = eve.operationpk )
    INNER JOIN eventtype          evttype ON ( eve.eventtypeid = evttype.eventtypeid )
    INNER JOIN product            po ON ( po.productid = aggpo.productid )
    INNER JOIN plan               plan ON ( po.productid = plan.productid )
    INNER JOIN agreginsobjecttype aggin ON ( po.productid = aggin.pro_id
                                             AND plan.planid = aggin.planpk )
    INNER JOIN insuranceobjectdco inobj ON ( pod.operationpk = inobj.operationpk )
    INNER JOIN oavidamaxcredito   oavc ON ( inobj.dcoid = oavc.pk )
    INNER JOIN coveragedco        cov ON ( pod.operationpk = cov.operationpk )
    INNER JOIN cobertura          cob ON ( cov.dcoid = cob.pk )
WHERE
        po.description = 'VidamaxCredito'
    /*AND prepo.numeropolizainput IN ( '420158860001488783', 
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
                                     '420147720001512955' )*/
                                     and rownum <= 50
    AND evttype.description IN ( 'Emitir' )
    AND plan.description = 'PLANBasicoNVMX'
    order by prepo.numeropolizainput;