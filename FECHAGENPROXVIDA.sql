select
  info.*,(select max(opm.DATEUSERECIPENT) from interseguro.openitem opm
  inner join interseguro.openitemreference opr on opr.openitemid = opm.openitemid
where opr.policyid = info.item and opm.dty_id = 7572 and opm.status in ('active','applied')) last_opm from
  ( select pp.numeropolizainput,
      et.DESCRIPTION,
      ctx.user_name,
      ctx.id,
      ur.periodopagoprimainput,
      (select min(inctx.time_stamp) from interseguro.contextoperation inctx where inctx.item = ctx.item and inctx.STATUS = 2) as MINIMA,
      ctx.auditdate,
      MIGRATION_UTILS.getNextPremiumGenerationDate(pd.INITIALDATE , ctx.TIME_STAMP ,1 , 12) next,
      pol.FECHAPROXGENPRIMAVIDAINPUT,
      pp.FECHAPROXIMAGENPRIMAINPUT,
      -- ctx.time_Stamp,
      ctx.item,
      POL.PK AS CLAVE,
      'UPDATE INTERSEGURO.POLEDUCGARANTIZADAPLUSNEW SET FECHAPROXGENPRIMAINPUT = TO_DATE ('''|| MIGRATION_UTILS.getNextPremiumGenerationDate(pd.INITIALDATE , ctx.TIME_STAMP ,1 , 12) ||''', ''YYYY-MM-DD'') WHERE PK = ' || POL.PK || ';' AS QUERY
    from interseguro.prepolicy pp
      inner join interseguro.policydco pd on pd.dcoid = pp.pk
      --inner join INTERSEGURO.POLVIDAENTERASURA pol on pol.pk = pp.pk
      --inner join INTERSEGURO.POLTEMPGARANTIZADO100 pol on pol.pk = pp.pk
      --inner join INTERSEGURO.POLVIDAENTERA pol on pol.pk = pp.pk
      --inner join INTERSEGURO.POLSEGUNDOASEGURADOSURA pol on pol.pk = pp.pk
      --inner join INTERSEGURO.POLTEMPGARANTIZADO100 pol on pol.pk = pp.pk
      --inner join INTERSEGURO.POLTEMPGARANTIZADO75 pol on pol.pk = pp.pk
      --inner join INTERSEGURO.POLDOTALTRIPLECREC pol on pol.pk = pp.pk
      --inner join INTERSEGURO.POLDOTALDOBLECAPITAL pol on pol.pk = pp.pk
      --inner join INTERSEGURO.POLDOTALDOBLECREC pol on pol.pk = pp.pk
      --inner join INTERSEGURO.POLDOTALSIMPLESURA pol on pol.pk = pp.pk
      --inner join INTERSEGURO.POLDOTALSIMPLE pol on pol.pk = pp.pk
      --inner join INTERSEGURO.POLEDUCGARANTIZADA pol on pol.pk = pp.pk
      --inner join INTERSEGURO.POLEDUCGARANTIZADAPLUS pol on pol.pk = pp.pk
      --inner join INTERSEGURO.POLTEMPORALSURA pol on pol.pk = pp.pk
      --inner join INTERSEGURO.POLVIDAENTERA pol on pol.pk = pp.pk
      inner join INTERSEGURO.POLEDUCGARANTIZADAPLUSNEW pol on pol.pk = pp.pk
      inner join interseguro.contextoperation ctx on ctx.id = pd.operationpk and ctx.status = 2-- and ctx.user_name <> 'migration'
                                                     and ctx.time_stamp = (select max(inctx.time_stamp) from interseguro.contextoperation inctx where inctx.item = ctx.item and inctx.STATUS = 2)
      left join interseguro.RISKUNITDCO rdco on rdco.operationpk = pd.operationpk
      --inner join interseguro.URSIEMPRESEGURO ur on ur.pk = rdco.dcoid
      --inner join interseguro.URVIDATOTALPROTEGIDA ur on ur.pk = rdco.dcoid
      --inner join interseguro.URVIDAENTERASURA ur on ur.pk = rdco.dcoid
      --inner join interseguro.URTEMPGARANTIZADO100 ur on ur.pk = rdco.dcoid
      --inner join interseguro.URVIDAENTERA ur on ur.pk = rdco.dcoid
      --inner join interseguro.UREDUCGARANTIZADA ur on ur.pk = rdco.dcoid
      --inner join interseguro.UREDUCGARANTIZADAPLUS ur on ur.pk = rdco.dcoid
      inner join interseguro.UREDUCGARANTIZADAPLUSNEW ur on ur.pk = rdco.dcoid
      --inner join interseguro.URTEMPORALSURA ur on ur.pk = rdco.dcoid
      --inner join interseguro.URDOTALSIMPLE ur on ur.pk = rdco.dcoid
      --inner join interseguro.URDOTALSIMPLESURA ur on ur.pk = rdco.dcoid
      --inner join interseguro.URDOTALDOBLECREC ur on ur.pk = rdco.dcoid
      --inner join interseguro.URDOTALDOBLECAPITAL ur on ur.pk = rdco.dcoid
      --inner join interseguro.URDOTALTRIPLECREC ur on ur.pk = rdco.dcoid
      --inner join interseguro.URTEMPGARANTIZADO75 ur on ur.pk = rdco.dcoid
      --inner join interseguro.URTEMPGARANTIZADO100 ur on ur.pk = rdco.dcoid
      --inner join interseguro.URSEGUNDOASEGURADOSURA ur on ur.pk = rdco.dcoid
      inner join interseguro.eventdco ed on ed.operationpk = ctx.id
      inner join interseguro.eventtype et on et.EVENTTYPEID = ed.EVENTTYPEID --and et.DESCRIPTION in ('GenerarPrima','Emitir')
      inner join interseguro.state st on st.stateid = pd.stateid and st.description = 'Vigente'
    --where pp.numeropolizainput = '106205'
    order by ctx.time_Stamp desc
  ) info where next <>  /*FECHAPROXIMAGENPRIMAINPUT*/  FECHAPROXGENPRIMAVIDAINPUT;