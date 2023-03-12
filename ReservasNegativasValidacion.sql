SELECT count(*), to_number(COVRESERVARIESGOVALUE,'999999999999.9999999999999') COVRESERVARIESGO 
FROM interseguro.EXT_RISKRESERVEJOB RRJ 
inner join interseguro.openitem opm on opm.openitemid = rrj.openitemid 
inner join interseguro.coveragedco cd on cd.operationpk = opm.operationpk 
inner join interseguro.cobertura cb on cb.pk = cd.dcoid and cb.COVRESERVARIESGOINPUT is not null 
WHERE RRJ.PRO_ID IN (48779) 
and rrj.rrj_riskreserve < 0 
group by COVRESERVARIESGOVALUE;