declare
  v_claimid number;
  v_claimnumber varchar2(100) := 'VTC1-2023-42';
  v_cnr_id number;
begin

  Insert into claim (CLAIMID,CLAIMDATE,POLICYID,POLICYDATE,TOTALAMOUNT,STATE,EVENTCLAIMID,CLAIMNUMBER,CLAIMNOTIFICATIONID,EXCESSCLAIMEVENTID,SUBSTATE,BOF_ID,OPERATIONPK,USC_LOGIN,CLA_SUBSTATUS) 
  values ('282196',to_date('23/02/01','DD/MM/RR'),'183474759',to_date('23/01/28','DD/MM/RR'),'0','1','23','VTC1-2023-42',null,null,null,'0','93340789','10032191',null);

  for cl in( select claimid  from claim where claimnumber =  v_claimnumber) loop
    v_claimid := cl.claimid;

    for i in (select * from claimnormalreserve where claiminsuranceobjectid in
        (select claiminsuranceobjectid from CLAIMINSURANCEOBJECT where claimriskunitid in
                                            (select claimriskunitid from claimriskunit where claimid= v_claimid))) loop
      v_cnr_id := i.CLAIMNORMALRESERVEDID;

      for dcl in (select * from STRI_OPHISTDETAILCLAIM where cnr_id = v_cnr_id) loop

        delete from STRI_OPHISTDETAILCLAIM where opm_id = dcl.opm_id;
        delete from openitem where openitemid =  dcl.opm_id;

      end loop;

      delete from STRI_OPHISTDETAILCLAIM where cnr_id = v_cnr_id;
      delete from STCL_RESERVESTATE where cnr_id = v_cnr_id;
      delete from CLAIMREQUISITE where cnr_id = v_cnr_id;

      for i in (select claimpaymentid, claimid  from claimpayment where claimpaymentid in
                                                     (select cpy_id from paymentorder where fkreserve = v_cnr_id)) loop

        delete from STCL_CLAIMPAYMENTRISKUNIT where claimpaymentid = i.claimpaymentid;

        delete from entry where pk in (select ecp_entryid from STEN_ENTRYCLAIMPAYMENT where cpy_id in
                                                                (select claimpaymentid from claimpayment where claimpaymentid = i.claimpaymentid));

        delete from STEN_ENTRYCLAIMPAYMENT where cpy_id in (select claimpaymentid from claimpayment where claimid =i.claimid);
  
      end loop;
	   
      delete STAD_CLAIMCONTEXT where pod_id in (select paymentorderid from paymentorder where crbf_id in
                                                                          (select crbf_id from STCL_CLAIMRESERVEBENEFIT crb where CRB.CNR_ID = v_cnr_id));
      delete STCL_PAYMENTSTATE where por_id in (select paymentorderid from paymentorder where crbf_id in
                                                                          (select crbf_id from STCL_CLAIMRESERVEBENEFIT crb where CRB.CNR_ID = v_cnr_id));

      delete from RI_CLAIMOPERATIONS where por_id in (select paymentorderid from paymentorder where crbf_id in
                                                                                  (select crbf_id from STCL_CLAIMRESERVEBENEFIT crb where CRB.CNR_ID = v_cnr_id));
      
      delete from STCA_CLAIMBENEFICIARY where crbf_id in (select crbf_id from STCL_CLAIMRESERVEBENEFIT crb where CRB.CNR_ID = v_cnr_id);

      delete from STHC_ENDORSEMENTLETTER where cnr_id = v_cnr_id;
      delete from STCL_COVERAGEINVOICEdetail cd where cd.COVI_INVOICE in (select COVI_INVOICE from STCL_COVERAGEINVOICE where CRBF_ID in
                                                                                                  (select CRB.CRBF_ID from STCL_CLAIMRESERVEBENEFIT crb where CRB.CNR_ID = v_cnr_id));

      delete from STCL_COVERAGEINVOICE where CRBF_ID in (select CRB.CRBF_ID from STCL_CLAIMRESERVEBENEFIT crb where CRB.CNR_ID = v_cnr_id);
      delete from STCA_CLAIMBENEFICIARY crbb where CRBB.CRBF_ID in (select CRB.CRBF_ID from STCL_CLAIMRESERVEBENEFIT crb where CRB.CNR_ID = v_cnr_id);
      delete from STCL_PAYMENTSTATE where por_id in (select paymentorderid from paymentorder where fkreserve = v_cnr_id);
      delete from STAD_CLAIMCONTEXT where pod_id in (select paymentorderid from paymentorder where fkreserve = v_cnr_id);
      for por in (select opm_id from STCL_PAYMENTLIQUIDATION where
          por_id in (select paymentorderid from paymentorder where fkreserve = v_cnr_id)) loop
        
        delete from STCL_PAYMENTLIQUIDATION where opm_id = por.opm_id;
        delete EXT_INTERFPAYMENTMOVEMENT where openitemid = por.opm_id;
        delete STCA_OPENITEMLIQINFO where opm_id = por.opm_id;
        delete from openitem where openitemid = por.opm_id;

      end loop;

	    delete from paymentorder where crbf_id in (select crbf_id from STCL_CLAIMRESERVEBENEFIT crb where CRB.CNR_ID = v_cnr_id);
      delete from STCL_CLAIMRESERVEBENEFIT crb where CRB.CNR_ID = v_cnr_id;
      delete from RI_CLAIMOPERATIONDETAILS where claimoperationid in
                                                 (select claimoperationid from RI_CLAIMOPERATIONS where por_id in 
                                                                              (select paymentorderid from paymentorder where fkreserve = v_cnr_id));

      delete RI_CLAIMOPERATIONS where por_id in (select paymentorderid from paymentorder where fkreserve = v_cnr_id);
      delete from PAYMENTORDERDETAIL where  paymentorderid in (select paymentorderid from paymentorder where fkreserve = v_cnr_id);
      delete from STCL_PAYMENTACCOUNT where por_id in (select paymentorderid from paymentorder where fkreserve = v_cnr_id);
      delete from paymentorder where fkreserve = v_cnr_id;

      delete from RI_CLAIMOPERATIONDETAILS where claimoperationid in
                                                 (select claimoperationid from RI_CLAIMOPERATIONS where cra_id in 
                                                                              (select claimreserveadjustid  from CLAIMRESERVEADJUST where claimreserveid = v_cnr_id));

      delete RI_CLAIMOPERATIONS where cra_id in (select claimreserveadjustid  from CLAIMRESERVEADJUST where claimreserveid = v_cnr_id);
      DELETE FROM STAD_CLAIMCONTEXT WHERE CLA_ID IN (select claimid  from claim where claimnumber = v_claimnumber);
      delete from CLAIMRESERVEADJUST where claimreserveid = v_cnr_id;
      delete from claimnormalreserve where CLAIMNORMALRESERVEDID = v_cnr_id;

    end loop;

	  delete from STCL_PAYMENTACCOUNT WHERE POR_ID IN (SELECT PAYMENTORDERID FROM PAYMENTORDER where CPY_ID in (select claimpaymentid  from claimpayment where claimid =  v_claimid));
    delete CLAIMRESERVEBYCONCEPT where CLAIMINSURANCEOBJECTID in (select CLAIMINSURANCEOBJECTID from CLAIMINSURANCEOBJECT where claimriskunitid in
                                                                                                    (select claimriskunitid from claimriskunit where claimid= v_claimid));
    delete from CLAIMINSURANCEOBJECT where claimriskunitid in (select claimriskunitid from claimriskunit where claimid= v_claimid);
    delete from STCL_CLAIMPAYMENTRISKUNIT where claimriskunitid in (select claimriskunitid from claimriskunit where claimid= v_claimid);
    delete from claimriskunit where claimid= v_claimid;
    delete from STAD_CLAIMCONTEXT where cla_id = v_claimid;
    delete from STCL_CLAIMOPERATIONHISTORY where claimid =v_claimid;
    delete from STRP_CLAIMLETTERHISTORY where claimid =v_claimid;
    delete from STCL_STATE where CLA_ID =v_claimid;
    delete from PAYMENTORDER where CPY_ID in (select claimpaymentid  from claimpayment where claimid =  v_claimid);
    delete from CLAIMPAYMENT where claimid =v_claimid;
    --delete from claim where claimid =v_claimid;
  
    --commit;
  end loop;
end;