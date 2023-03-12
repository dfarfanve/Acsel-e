SELECT A.inst_id,A.SID AS SID___,B.serial#,
   CASE WHEN SUBSTr(B.program,1,7) = 'PSAESRV' THEN 'A.Engine'
         WHEN SUBSTr(B.program,1,3) = 'sqr' THEN 'SQR'
         WHEN SUBSTr(B.program,1,3) = 'PSAPPSRV' THEN 'Online'
         WHEN Nvl(PNLG.PNLGRPNAME,' ') <> ' ' THEN 'Menu –> OnLine'
         WHEN SUBSTr(B.program,1,8) = 'PSSUBDSP' THEN 'Peoplesoft -> Mensajeria'
         else 'OTHER'
   END AS TIPO_PROCESO
   , A.sql_text , A.sql_fulltext , A.first_load_time , To_Char(SYSDATE,'YYYY-MM-DD/hh24:mi:ss') ,B.terminal, B.program , B.machine ,B.osuser ,b.module, B.action, B.client_info
from Gv$sqlarea A
   , Gv$session B LEFT JOIN PSPNLGRPDEFN PNLG ON PNLG.PNLGRPNAME = B.MODULE
where A.users_executing > 0
AND A.inst_id = B.inst_id
and A.address = B.sql_address
AND A.sql_id = B.sql_id
AND B.status = 'ACTIVE'
AND NOT (A.sql_fulltext LIKE '%Gv$sqlarea%')
ORDER BY first_load_time