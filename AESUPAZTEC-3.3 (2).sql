----------------------------------CONSULTA #1---------------------------------------------------
SELECT CLAIMID,CLAIMDATE,POLICYID,POLICYDATE,TOTALAMOUNT,STATE,EVENTCLAIMID,CLAIMNUMBER,CLAIMNOTIFICATIONID,EXCESSCLAIMEVENTID,SUBSTATE,BOF_ID,OPERATIONPK,USC_LOGIN,CLA_SUBSTATUS
FROM AZTECA_V138.CLAIM WHERE CLAIMNUMBER = 'MTAZ-2021-8607';

----------------------------------CONSULTA #2---------------------------------------------------
SELECT CLAIMPAYMENTID,CLAIMID,CLAIMPAYMENTDATE,COVERAGEDESCRIPTION,RESERVETYPE,THIRDPARTYID,BENEFICIARY,STATE,AMOUNT,PAIDAMOUNT,DONEBY,RESERVECURRENCYID,PAIDCURRENCYID,EXCHANGERATE,DEDUCTIBLEPERCENTAGE,DEDUCTIBLEREFERENCE,ISDEDUCTIBLEAPPLIED,DEDUCTIBLEAMOUNT,ISPENALTYAPPLIED,PENALTYPERCENTAGE,ISREFUNDAPPLIED,REFUNDPERCENTAGE,ISTOTALPAYMENT,CPY_FRANCHISEAMOUNT
FROM AZTECA_V138.CLAIMPAYMENT WHERE CLAIMID = (SELECT CLAIMID FROM AZTECA_V138.CLAIM WHERE CLAIMNUMBER = 'MTAZ-2021-8607');

----------------------------------CONSULTA #3---------------------------------------------------

SELECT NOT_ID,POR_ID, CPV_ID FROM AZTECA_V138.STNO_PAYMENTNOTIFICATION WHERE POR_ID IN (435703,435704);

----------------------------------CONSULTA #4---------------------------------------------------

SELECT SNOT.NOT_ID,SNOT.NOC_ID,SNOT.NOT_TITLE,SNOT.NOT_BODY,SNOT.NOC_DATE,SNOT.USC_LOGIN,SNOT.USC_LOGINASSIGNED,SNOT.NOT_STATUS,SNOT.COR_ID,SNOT.APO_ID,SNOT.NOT_DUEDATE,SNOT.DCO_ID,SNOT.STATE_DCO_ID
FROM AZTECA_V138.STNO_NOTIFICATION SNOT
INNER JOIN AZTECA_V138.STNO_PAYMENTNOTIFICATION PNOT ON PNOT.NOT_ID = SNOT.NOT_ID  WHERE POR_ID IN (435703,435704);

----------------------------------CONSULTA #5---------------------------------------------------

SELECT PAYMENTORDERID,DATEPAYMENTORDER,COMMITMENTDATE,FKRESERVE,RESERVETYPE,THIRDPARTYID,ROL_ID,CPY_ID,BENEFICIARY,REASON,STATE,TYPE,AMOUNT,DONEBY,PARTICIPATIONPERCENTAGE,DEDUCTIBLEPERCENTAGE,DEDUCTIBLEREFERENCE,ISDEDUCTIBLEAPPLIED,DEDUCTIBLEAMOUNT,ISPENALTYAPPLIED,PENALTYPERCENTAGE,ISREFUNDAPPLIED,REFUNDPERCENTAGE,ISTOTALPAYMENT,DISTRIBUTIONAMOUNT,POR_OPERATIONDATE,POR_STARTDATE,COVERAGEDESC,POR_ONHOLD,CRBF_ID,POR_ENDDATE,POR_NUMBER,POR_BENEFICIARY_ID,POR_BRANCH,POR_DEFAULTDEDUCTIBLE,POR_FRANCHISEAMOUNT,POR_ADDITIONALINFORMATION,POR_DEDUCTIBLETYPE,POR_FINAL,POR_ITEMRESERVE,POR_GENERATEPREMIUMDEPOSIT,POR_PARTAMOUNT,POR_AUTORIZED
FROM AZTECA_V138.PAYMENTORDER WHERE PAYMENTORDERID IN (435703,435704);