select ta.DATE_EXEC fecha_ejecucion_cuenta_tecnica, liq.openitemid openitem_liquidacion, dc.DTY_DESCRIPTION tipo_documento_liquidacion, liq.amount monto_liquidacion,
       lccy.DESCRIPTION moneda_liquidacion, prth.NOMBREPREDETERMINADOINPUT reasegurador,
       prod.DESCRIPTION producto, odc.DTY_DESCRIPTION tipo_documento_cedido, opm.amount monto_cedido, opr.OPR_POLICYNUMBER numero_poliza,ccy.DESCRIPTION moneda_cedido,
       REP_FUNCIONES.CURRENCY_RATE( opm.currencyid,liq.CURRENCYID, ta.DATEFROM) tasa_cambio
from interseguro.RI_TECHNICALACCOUNTS ta
  inner join interseguro.RI_TECHACC_IOGENERATED iog on iog.RTA_TECHNICALACCOUNTID = ta.TECHNICALACCOUNTID
  inner join interseguro.openitem liq on liq.openitemid = iog.RTG_OPENITEMID
  inner join interseguro.currency lccy on lccy.CURRENCYID = liq.CURRENCYID
  inner join interseguro.stca_doctype dc on dc.dty_id = liq.dty_id
  inner join interseguro.stte_thirdparty tp on tp.TPT_ID = liq.THIRDPARTYID
  inner join interseguro.prethirdparty prth on prth.pk = tp.IDDCO
  inner join interseguro.product prod on prod.PRODUCTID = iog.PRODUCTID-- and prod.DESCRIPTION = 'VidaEnteraSura'
  inner join interseguro.RI_TECHACC_OISROOTS oir on oir.RTG_OPENITEMID = iog.RTG_OPENITEMID
  inner join interseguro.openitem opm on opm.openitemid = oir.OPM_OPENITEMID
  inner join interseguro.stca_doctype odc on odc.DTY_ID = opm.DTY_ID
  inner join interseguro.currency ccy on ccy.CURRENCYID = opm.CURRENCYID
  inner join interseguro.openitemreference opr on opr.openitemid = opm.openitemid
where trunc(ta.DATEFROM,'MM') = to_date('01/01/2019','DD/MM/YYYY') and opr.OPR_POLICYNUMBER in (?)