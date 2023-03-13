SELECT 
CL.CLAIMNUMBER, 
CRU.CLAIMRISKUNITID,
CRU.OPERATIONPK,
CIO.CLAIMINSURANCEOBJECTID,
CIO.DESCRIPTION, 
CIO.DAMAGEDCOID,
CIO.DAMAGEDCOTEMPLATE,
CNR.CLAIMNORMALRESERVEDID,
CNR.DESCRIPTION,
CNR.RESERVELIMIT,
CNR.CNR_MAXPAYMENTAMOUNT,
PO.DATEPAYMENTORDER,
PO.BENEFICIARY,
PO.DONEBY,
PA.PACC_ID,
PA.POR_ID,
PA.PACC_ACCOUNT,
PA.PACC_BANK,
PA.PACC_BANK_VALUE
FROM AZTECA_V138.CLAIM  CL
JOIN AZTECA_V138.CLAIMRISKUNIT CRU ON CL.CLAIMID = CRU.CLAIMID
JOIN AZTECA_V138.CLAIMINSURANCEOBJECT CIO ON CRU.CLAIMRISKUNITID = CIO.CLAIMRISKUNITID
JOIN AZTECA_V138.CLAIMNORMALRESERVE CNR ON CIO.CLAIMINSURANCEOBJECTID = CNR.CLAIMINSURANCEOBJECTID
JOIN AZTECA_V138.PAYMENTORDER PO ON PO.FKRESERVE = CNR.CLAIMNORMALRESERVEDID
JOIN AZTECA_V138.STCL_PAYMENTACCOUNT PA ON PA.POR_ID = PO.PAYMENTORDERID
WHERE PO.PAYMENTORDERID IN (434524, 444373);