--------------CONSULTA 1-----------------------
select CR.CLAIMREQUISITEID,CR.CLAIMID,CR.DESCRIPTION,CR.MANDATORY,CR.CHECKED,CR.DONEBY,CR.CHECKDATETIME,CR.CNR_ID,CR.CR_COMMENT
FROM AZTECA_V138.CLAIMREQUISITE CR 
WHERE CR.CNR_ID = 438826;

---------------CONSULTA 2------------------------
select STC.RST_ID,STC.CNR_ID,STC.RST_OPERATIONDATE,STC.RST_STATE,STC.DCO_ID,STC.COT_ID
FROM AZTECA_V138.STCL_RESERVESTATE STC WHERE STC.CNR_ID =438826;

------------------CONSULTA 3-----------------------
select CRA.CLAIMRESERVEADJUSTID,CRA.CLAIMRESERVEID,CRA.DATECLAIMRESERVEADJUSTID,CRA.DESCRIPTION,CRA.REASON,
CRA.TYPE,CRA.CRA_STATUS,CRA.AMOUNT,CRA.DONEBY,CRA.CCY_ID,CRA.CRA_EXCHANGEAMOUNT,CRA.CRA_ORIGINADJUST,CRA.CRA_TYPE,CRA.REASON_ID
FROM AZTECA_V138.CLAIMRESERVEADJUST CRA
WHERE  CRA.CLAIMRESERVEID=438826;