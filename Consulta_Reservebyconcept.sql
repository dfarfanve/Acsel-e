


--------------consulta 1-----------------MTEM-2023-225
select cl.CLAIMRESERVEBYCONCEPTID,cl.CLAIMINSURANCEOBJECTID,cl.CLAIMRESERVECONCEPTID,cl.CURRENCYID,cl.DATECLAIMRESERVEBYCONCEPT,cl.DESCRIPTION,
cl.DONEBY,cl.CNR_ID,cl.LEGACYTYPE
from AZTECA_V138.ClaimReserveByConcept cl where cnr_id=449633;

--------------consulta 2-----------------
select cra.CLAIMRESERVEADJUSTID,cra.CLAIMRESERVEID,cra.DATECLAIMRESERVEADJUSTID,cra.DESCRIPTION,cra.REASON,cra.TYPE,cra.CRA_STATUS,cra.AMOUNT,
cra.DONEBY,cra.CCY_ID,cra.CRA_EXCHANGEAMOUNT,cra.CRA_ORIGINADJUST,cra.CRA_TYPE,cra.REASON_ID
from AZTECA_V138.CLAIMRESERVEADJUST cra where CLAIMRESERVEID=450441;

--------------consulta 3------------------MTEM-2023-81
select cl.CLAIMRESERVEBYCONCEPTID,cl.CLAIMINSURANCEOBJECTID,cl.CLAIMRESERVECONCEPTID,cl.CURRENCYID,cl.DATECLAIMRESERVEBYCONCEPT,cl.DESCRIPTION,
cl.DONEBY,cl.CNR_ID,cl.LEGACYTYPE
from AZTECA_V138.ClaimReserveByConcept cl where cnr_id=448438;

--------------consulta 4-------------------
select cra.CLAIMRESERVEADJUSTID,cra.CLAIMRESERVEID,cra.DATECLAIMRESERVEADJUSTID,cra.DESCRIPTION,cra.REASON,cra.TYPE,cra.CRA_STATUS,cra.AMOUNT,
cra.DONEBY,cra.CCY_ID,cra.CRA_EXCHANGEAMOUNT,cra.CRA_ORIGINADJUST,cra.CRA_TYPE,cra.REASON_ID
from AZTECA_V138.CLAIMRESERVEADJUST cra where CLAIMRESERVEID=449765;

--------------consulta 5--------------------------
select ht.COH_ID,ht.CLAIMID,ht.COH_TIMESTAMP,ht.WORKFLOWUSERID,ht.COH_OPERATION,ht.COH_MOVEMENTTYPE,ht.COH_MOVEMENTID,ht.COH_LEGACYTYPE
from AZTECA_V138.STCL_CLAIMOPERATIONHISTORY ht where claimid=280886;

---------------consulta 6--------------------
select ht.COH_ID,ht.CLAIMID,ht.COH_TIMESTAMP,ht.WORKFLOWUSERID,ht.COH_OPERATION,ht.COH_MOVEMENTTYPE,ht.COH_MOVEMENTID,ht.COH_LEGACYTYPE
from AZTECA_V138.STCL_CLAIMOPERATIONHISTORY ht where claimid=280249;
