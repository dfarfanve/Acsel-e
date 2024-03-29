SELECT SNOT.NOT_ID,
SNOT.NOC_ID,
SNOT.NOT_TITLE,
SNOT.NOT_BODY,
SNOT.NOC_DATE,
SNOT.USC_LOGIN,
SNOT.USC_LOGINASSIGNED,
SNOT.NOT_STATUS,
PO.PAYMENTORDERID,
PO.DATEPAYMENTORDER,
PO.COMMITMENTDATE,
PO.FKRESERVE,
PO.RESERVETYPE,
PO.STATE,
PO.TYPE,
PO.AMOUNT,
PO.DONEBY,
PO.POR_OPERATIONDATE,
PO.POR_STARTDATE,
PO.COVERAGEDESC,
PO.POR_ONHOLD,
PO.POR_ENDDATE,
PO.POR_NUMBER,
PO.POR_PARTAMOUNT,
PO.POR_AUTORIZED,
PS.PST_STATE,
PS.PST_ACTIONHISTORYUSER
FROM AZTECA_V138.STNO_NOTIFICATION SNOT
JOIN AZTECA_V138.STNO_PAYMENTNOTIFICATION PNOT ON PNOT.NOT_ID = SNOT.NOT_ID
JOIN AZTECA_V138.STCL_PAYMENTSTATE PS ON PS.POR_ID = PNOT.POR_ID
JOIN AZTECA_V138.PAYMENTORDER PO ON PNOT.POR_ID = PO.PAYMENTORDERID
WHERE SNOT.USC_LOGINASSIGNED = '719954';    