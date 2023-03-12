select * from interseguro.openitem
where openitemid in (3973370043,
3973370042);

select * from interseguro.stca_openitemhistory where opm_id in
(3986237388);


select * from interseguro.contextoperation
where id = 197674480;

SELECT E.DESCRIPTION, CO.*
FROM INTERSEGURO.CONTEXTOPERATION CO
         INNER JOIN INTERSEGURO.POLICYDCO PDCO on CO.ID = PDCO.OPERATIONPK
         INNER JOIN INTERSEGURO.EVENTDCO EDCO on CO.ID = EDCO.OPERATIONPK
         INNER JOIN INTERSEGURO.EVENTTYPE E on EDCO.EVENTTYPEID = E.EVENTTYPEID
WHERE CO.ITEM = 88977199
  AND CO.STATUS IN (2,7)
ORDER BY CO.AUDITDATE DESC;

select * from INTERSEGURO.OPENITEM
where operationpk = 181725059;


