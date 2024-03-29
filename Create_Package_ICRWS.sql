create or replace PACKAGE BODY          ICR_WS /* INCREASE CLAIM RESERVA WEB SERVICE */
AS
    FUNCTION GETCLAIMOPK (CLNUMBER VARCHAR)
        RETURN NUMBER
    AS
        OPK   NUMBER;
    BEGIN
        SELECT OPERATIONPK
          INTO OPK
          FROM CLAIM
         WHERE CLAIMNUMBER = CLNUMBER;

        RETURN OPK;
    END;


    FUNCTION GETENDORSEMENTOPK (CLNUMBER VARCHAR)
        RETURN NUMBER
    AS
        OPK   NUMBER;
    BEGIN
        SELECT MAX (CT.ID)
          INTO OPK
          FROM CLAIM  CL
               INNER JOIN CONTEXTOPERATION CT
                   ON CL.POLICYID = CT.ITEM AND CT.STATUS = 2
               INNER JOIN EVENTDCO ED
                   ON CT.ID = ED.OPERATIONPK AND ED.POLICYPK = CT.ITEM
               INNER JOIN EVENTTYPE ET ON ET.EVENTTYPEID = ED.EVENTTYPEID /* AND ET.DESCRIPTION = 'Endosar'*/
               INNER JOIN CONFIGURABLEOBJECTTYPE COT
                   ON COT.CONFIGURABLEOBJECTTYPEID = ET.EVENTFORMTYPEID
         WHERE     CLAIMNUMBER = CLNUMBER
               AND TRUNC(CT.EFFECTIVE_DATE <= CL.POLICYDATE;

        RETURN OPK;
    END;


    FUNCTION OPSWITCH (CLNUMBER VARCHAR)
        RETURN VARCHAR
    AS
        OLDOPK    NUMBER := GETCLAIMOPK (CLNUMBER);
        NEWOPK    NUMBER := GETENDORSEMENTOPK (CLNUMBER);
        CLID      NUMBER;
        CRUID     NUMBER;
        CIOID     NUMBER;
    BEGIN
        IF (NEWOPK <> OLDOPK)  THEN
            SELECT CLAIMID
              INTO CLID
              FROM CLAIM
             WHERE CLAIMNUMBER = CLNUMBER;

            SELECT CLAIMRISKUNITID
              INTO CRUID
              FROM CLAIMRISKUNIT
             WHERE CLAIMID = CLID;

            SELECT CLAIMINSURANCEOBJECTID
              INTO CIOID
              FROM CLAIMINSURANCEOBJECT
             WHERE CLAIMRISKUNITID = CRUID;

            UPDATE CLAIM
               SET OPERATIONPK = NEWOPK
             WHERE CLAIMID = CLID;

            UPDATE CLAIMRISKUNIT
               SET OPERATIONPK = NEWOPK
             WHERE CLAIMID = CLID;

            UPDATE CLAIMINSURANCEOBJECT
               SET OPERATIONPK = NEWOPK
             WHERE CLAIMRISKUNITID = CRUID;

            UPDATE CLAIMNORMALRESERVE
               SET OPERATIONPK = NEWOPK
             WHERE CLAIMINSURANCEOBJECTID = CIOID;
        END IF;
        COMMIT;
        RETURN 'TRUE';
		EXCEPTION
		WHEN OTHERS THEN
		ROLLBACK;
		DBMS_OUTPUT.PUT_LINE (SQLERRM);
        DBMS_OUTPUT.PUT_LINE (SQLCODE);
		RETURN 'FALSE';
		
    END;

    FUNCTION ORIGINLOG (CLNUMBER VARCHAR, USERNAME VARCHAR, TRX VARCHAR, SQUO VARCHAR)
        RETURN VARCHAR
    AS
    BEGIN
        INSERT INTO STAD_ICR_LOG (STAD_ICR_LOGID,
                                   CLAIMID,
                                   CLAIMRISKUNITID,
								   CLAIMINSURANCEOBJECTID,
								   CLAIMNORMALRESERVEDID,
								   OPK,
								   RESERVELIMIT,
								   MAXPAYMENTAMOUNT,
								   CREATEDBY,
								   TRXTYPE,
								   STATUS)
            (SELECT SQ_ICR_LOG.nextval, 
                    CL.CLAIMID,
                    CRU.CLAIMRISKUNITID,
                    CIO.CLAIMINSURANCEOBJECTID,
                    CNR.CLAIMNORMALRESERVEDID,
                    CL.OPERATIONPK,
                    CNR.RESERVELIMIT,
                    CNR.CNR_MAXPAYMENTAMOUNT,
                    USERNAME,
					TRX,
					SQUO
               FROM CLAIM  CL
                    JOIN CLAIMRISKUNIT CRU ON CL.CLAIMID = CRU.CLAIMID
                    JOIN CLAIMINSURANCEOBJECT CIO
                        ON CRU.CLAIMRISKUNITID = CIO.CLAIMRISKUNITID
                    JOIN CLAIMNORMALRESERVE CNR
                        ON CIO.CLAIMINSURANCEOBJECTID =
                           CNR.CLAIMINSURANCEOBJECTID
              WHERE CL.CLAIMNUMBER = CLNUMBER);
        COMMIT;
        RETURN 'TRUE';
        
		EXCEPTION
		WHEN OTHERS THEN
		ROLLBACK;
		DBMS_OUTPUT.PUT_LINE (SQLERRM);
        DBMS_OUTPUT.PUT_LINE (SQLCODE);
		RETURN 'FALSE';
    END;
    
    FUNCTION INCREASELOG (CLID NUMBER, CNRID NUMBER, CRAID NUMBER, NEWLIMIT NUMBER, USERNAME VARCHAR, TRX VARCHAR, SQUO VARCHAR)
        RETURN VARCHAR
    AS
	MAXPA NUMBER;
   BEGIN
	   SELECT SUM(decode(CRA.type,'INCREASE',CRA.amount,'INITIAL',CRA.amount,'DECREASE',CRA.AMOUNT*(-1)))
	   INTO MAXPA 
	   FROM CLAIMRESERVEADJUST CRA
	   WHERE CRA.CLAIMRESERVEID = CNRID;
	   
	   UPDATE CLAIMNORMALRESERVE 
	   SET RESERVELIMIT = NEWLIMIT, CNR_MAXPAYMENTAMOUNT = MAXPA 
	   WHERE CLAIMNORMALRESERVEDID = CNRID;

	   
        INSERT INTO STAD_ICR_LOG (STAD_ICR_LOGID,
                                   CLAIMID,
                                   CLAIMRISKUNITID,
								   CLAIMINSURANCEOBJECTID,
								   CLAIMNORMALRESERVEDID,
								   CLAIMRESERVEADJUSTID,
								   OPK,
								   RESERVELIMIT,
								   MAXPAYMENTAMOUNT,
								   CREATEDBY,
								   TRXTYPE,
								   STATUS)
            (SELECT SQ_ICR_LOG.nextval, 
                    CL.CLAIMID,
                    CRU.CLAIMRISKUNITID,
                    CIO.CLAIMINSURANCEOBJECTID,
                    CNRID,
					CRAID,
                    CL.OPERATIONPK,
                    NEWLIMIT,
                    MAXPA,
                    USERNAME,
					TRX,
					SQUO
               FROM CLAIM  CL
                    JOIN CLAIMRISKUNIT CRU ON CL.CLAIMID = CRU.CLAIMID
                    JOIN CLAIMINSURANCEOBJECT CIO ON CRU.CLAIMRISKUNITID = CIO.CLAIMRISKUNITID
                    JOIN CLAIMNORMALRESERVE CNR ON CIO.CLAIMINSURANCEOBJECTID = CNR.CLAIMINSURANCEOBJECTID
              WHERE CL.CLAIMID = CLID AND CNR.CLAIMNORMALRESERVEDID = CNRID);
              
        COMMIT;
        RETURN 'TRUE';
        
		EXCEPTION
		WHEN OTHERS THEN
		ROLLBACK;
		DBMS_OUTPUT.PUT_LINE (SQLERRM);
        DBMS_OUTPUT.PUT_LINE (SQLCODE);
		RETURN 'FALSE';
    END;
     FUNCTION ERRORLOG (CLID NUMBER, USERNAME VARCHAR, TRX VARCHAR, SQUO VARCHAR)
        RETURN VARCHAR
    AS
   BEGIN
	  
        INSERT INTO STAD_ICR_LOG (STAD_ICR_LOGID,
                                   CLAIMID,
                                   CLAIMRISKUNITID,
								   CLAIMINSURANCEOBJECTID,
								   CLAIMNORMALRESERVEDID,
								   CLAIMRESERVEADJUSTID,
								   OPK,
								   CREATEDBY,
								   TRXTYPE,
								   STATUS)
            (SELECT SQ_ICR_LOG.nextval, 
                    CL.CLAIMID,
                    CRU.CLAIMRISKUNITID,
                    CIO.CLAIMINSURANCEOBJECTID,
                    CNR.CLAIMNORMALRESERVEDID,
					NULL,
                    CL.OPERATIONPK,
                    USERNAME,
					TRX,
					SQUO
               FROM CLAIM  CL
                    JOIN CLAIMRISKUNIT CRU ON CL.CLAIMID = CRU.CLAIMID
                    JOIN CLAIMINSURANCEOBJECT CIO ON CRU.CLAIMRISKUNITID = CIO.CLAIMRISKUNITID
                    JOIN CLAIMNORMALRESERVE CNR ON CIO.CLAIMINSURANCEOBJECTID = CNR.CLAIMINSURANCEOBJECTID
              WHERE CL.CLAIMID = CLID );
              
        COMMIT;
        RETURN 'TRUE';
        
		EXCEPTION
		WHEN OTHERS THEN
		ROLLBACK;
		DBMS_OUTPUT.PUT_LINE (SQLERRM);
        DBMS_OUTPUT.PUT_LINE (SQLCODE);
		RETURN 'FALSE';
    END;
END ICR_WS;