select
  info.* from
  ( select pp.numeropolizainput,
      et.DESCRIPTION,
      ctx.user_name,
      ctx.id,
      ur.periodopagoprimaveinput,
      (select min(inctx.time_stamp) from interseguro.contextoperation inctx where inctx.item = ctx.item and inctx.STATUS = 2) as MINIMA,
      ctx.auditdate,
      MIGRATION_UTILS.getNextPremiumGenerationDate(pd.INITIALDATE , ctx.TIME_STAMP ,1 , 12) next,
      pol.FECHAPROXGENPRIMAVIDAINPUT,
      ctx.time_Stamp,
      ctx.item
    from interseguro.prepolicy pp
      inner join interseguro.policydco pd on pd.dcoid = pp.pk
      inner join INTERSEGURO.POLVIDAENTERASURA pol on pol.pk = pp.pk
      inner join interseguro.contextoperation ctx on ctx.id = pd.operationpk and ctx.status = 2-- and ctx.user_name <> 'migration'
                                                     and ctx.time_stamp = (select max(inctx.time_stamp) from interseguro.contextoperation inctx where inctx.item = ctx.item and inctx.STATUS = 2)
      left join interseguro.RISKUNITDCO rdco on rdco.operationpk = pd.operationpk
      inner join interseguro.URVIDAENTERASURA ur on ur.pk = rdco.dcoid
      inner join interseguro.eventdco ed on ed.operationpk = ctx.id
      inner join interseguro.eventtype et on et.EVENTTYPEID = ed.EVENTTYPEID and et.DESCRIPTION in ('Renovar','Emitir')
      inner join interseguro.state st on st.stateid = pd.stateid and st.description = 'Vigente'
    --where pp.numeropolizainput = '106205'
    order by ctx.time_Stamp desc
  ) info where next <>   FECHAPROXGENPRIMAVIDAINPUT;