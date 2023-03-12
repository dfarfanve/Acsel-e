-- Consulta 1
select clf_id, ccy_id, cnr_id, clf_amount, clf_type, clf_insured from AZTECA_V138.STCL_FRANCHISE;

-- Consulta 2
select cls_id, cla_id, cls_operationdate, cls_state, dcoid, cot_id, cot_name, cls_substatus, pcrm_id, usc_login
from AZTECA_V138.STCL_STATE ST where ST.CLA_ID = 282196;

-- Consulta 3
select coh_id, claimid, coh_timestamp, workflowuserid, coh_operation, coh_movementtype, coh_movementid, coh_legacytype
from AZTECA_V138.STCL_CLAIMOPERATIONHISTORY STH where STH.CLAIMID = 282196;
