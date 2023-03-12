--Eliminar orden de pago pendiente
declare
    v_por_id number := 1471741    ;
begin    
delete from STCL_PAYMENTSTATE where por_id = v_por_id;
delete from STAD_CLAIMCONTEXT where pod_id = v_por_id;
for i in (select claimpaymentid  from claimpayment where claimpaymentid in (select cpy_id from paymentorder where paymentorderid = v_por_id)) loop
    update paymentorder set cpy_id = null where cpy_id = i.claimpaymentid; 
    delete from STCL_CLAIMPAYMENTRISKUNIT where claimpaymentid = i.claimpaymentid;
    
    delete from entry where pk in (select ecp_entryid from STEN_ENTRYCLAIMPAYMENT where cpy_id = i.claimpaymentid);
    delete from STEN_ENTRYCLAIMPAYMENT where cpy_id = i.claimpaymentid;
    delete from claimpayment where claimpaymentid = i.claimpaymentid; 
end loop;
--delete from openitem where openitemid in (select opm_id from STCL_PAYMENTLIQUIDATION where por_id = v_por_id);
delete from STCL_PAYMENTLIQUIDATION where por_id = v_por_id;
delete STRI_OPHISTDETAILCLAIM where claimoperationdetailid in
(select claimoperationdetailid from RI_CLAIMOPERATIONDETAILS where claimoperationid in (select claimoperationid from
 RI_CLAIMOPERATIONS where por_id = v_por_id));
delete RI_CLAIMOPERATIONDETAILS where claimoperationid in (select claimoperationid from RI_CLAIMOPERATIONS where por_id = v_por_id);
delete RI_CLAIMOPERATIONS where por_id = v_por_id;
delete from STCL_COVERAGEINVOICEPAYMENT  where paymentorderid= v_por_id;
delete from paymentorder where paymentorderid = v_por_id;
--delete from STRP_LETTERCONTENT where lth_id in
--(select lth_id from STRP_CLAIMLETTERHISTORY clh where CLH.CPLTH_CLAIMNUMBER = '0330000008626');
--delete from STRP_CLAIMLETTERHISTORY clh where CLH.CPLTH_CLAIMNUMBER = '273729358';
commit;
end;

-- Aprobado a pendiente
declare
    v_por_id number := 1471338    ;
begin    
delete from STCL_PAYMENTSTATE where por_id = v_por_id and pst_state <> 0;
delete from STAD_CLAIMCONTEXT where pod_id = v_por_id;
for i in (select claimpaymentid  from claimpayment where claimpaymentid in (select cpy_id from paymentorder where paymentorderid = v_por_id)) loop
    update paymentorder set cpy_id = null where cpy_id = i.claimpaymentid; 
    delete from STCL_CLAIMPAYMENTRISKUNIT where claimpaymentid = i.claimpaymentid; 
     delete from entry where pk in (select ecp_entryid from STEN_ENTRYCLAIMPAYMENT where cpy_id = i.claimpaymentid);
    delete from STEN_ENTRYCLAIMPAYMENT where cpy_id = i.claimpaymentid;
    delete from claimpayment where claimpaymentid = i.claimpaymentid; 
end loop;
update paymentorder set state = 0 where paymentorderid = v_por_id;
--delete from STRP_LETTERCONTENT where lth_id in
--(select lth_id from STRP_CLAIMLETTERHISTORY clh where CLH.CPLTH_CLAIMNUMBER = '0330000008626');
--delete from STRP_CLAIMLETTERHISTORY clh where CLH.CPLTH_CLAIMNUMBER = '273729358';
commit;
end;

-- Cancelado a aprobado
declare
    v_por_id number := 1458151      ;
    v_opm_id number;
begin    
select max(opm_id) into v_opm_id from STCL_PAYMENTLIQUIDATION where por_id = v_por_id;
delete from STCL_PAYMENTLIQUIDATION where por_id = v_por_id;
if v_opm_id is not null then 
delete from openitem where openitemid =v_opm_id;
end if;
delete from STCL_PAYMENTSTATE where por_id = v_por_id and pst_state =3;
update claimpayment 
set (state, PAIDAMOUNT, AMOUNT) =
(select 0,AMOUNT,AMOUNT from paymentorder where paymentorderid = v_por_id)
 where claimpaymentid = (select cpy_id from paymentorder where paymentorderid = v_por_id); 
update paymentorder set state = 4 where paymentorderid = v_por_id;
commit;
end;


-- Pagado a aprobado
declare
    v_por_id number := 1530660      ;
    v_opm_id number;
begin    
select max(opm_id) into v_opm_id from STCL_PAYMENTLIQUIDATION where por_id = v_por_id;
delete from STCL_PAYMENTLIQUIDATION where por_id = v_por_id;
if v_opm_id is not null then 
delete EXT_INTERFPAYMENTMOVEMENT where openitemid =v_opm_id;
delete from openitem where openitemid =v_opm_id;
end if;
delete from STCL_PAYMENTSTATE where por_id = v_por_id and pst_state =1;
update claimpayment 
set (state, PAIDAMOUNT, AMOUNT) =
(select 0,AMOUNT,AMOUNT from paymentorder where paymentorderid = v_por_id)
 where claimpaymentid = (select cpy_id from paymentorder where paymentorderid = v_por_id); 
update paymentorder set state = 4 where paymentorderid = v_por_id;
commit;
end;
