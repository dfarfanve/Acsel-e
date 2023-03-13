update AZTECA_V138.stno_notification set NOT_STATUS = 3 where not_id IN (Select snot.not_id from AZTECA_V138.stno_notification snot
inner join AZTECA_V138.stno_paymentnotification pnot on pnot.not_id = snot.not_id where pnot.por_id = 375701);
COMMIT;

update AZTECA_V138.stcl_paymentstate set pst_operationdate = to_date('04-08-2021', 'DD-MM-YYYY') where pst_id IN (select pst_id from AZTECA_V138.stcl_paymentstate where por_id = 376963 and pst_state = 1);

select PAYNOT.POR_ID, NOTI.USC_LOGINASSIGNED, NOTI.* from AZTECA_V138.STNO_NOTIFICATION noti
inner join AZTECA_V138.STNO_PAYMENTNOTIFICATION PAYNOT ON PAYNOT.NOT_ID = NOTI.NOT_ID;