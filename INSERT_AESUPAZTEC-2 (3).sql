delete from AZTECA_V138.PAYMENTORDER where FKRESERVE = 176895 and AMOUNT = 9704.02 and DONEBY = 'system'; -- se borra por estar mal insertado, se inserto con Foreing Key de la BD desarrollo

INSERT INTO AZTECA_V138.PAYMENTORDER (PAYMENTORDERID, DATEPAYMENTORDER, COMMITMENTDATE, FKRESERVE, RESERVETYPE, THIRDPARTYID, ROL_ID, CPY_ID, BENEFICIARY, REASON, STATE, TYPE, AMOUNT, DONEBY, PARTICIPATIONPERCENTAGE, DEDUCTIBLEPERCENTAGE, DEDUCTIBLEREFERENCE, ISDEDUCTIBLEAPPLIED, DEDUCTIBLEAMOUNT, ISPENALTYAPPLIED, PENALTYPERCENTAGE, ISREFUNDAPPLIED, REFUNDPERCENTAGE, ISTOTALPAYMENT, DISTRIBUTIONAMOUNT, POR_OPERATIONDATE, POR_STARTDATE, COVERAGEDESC, POR_ONHOLD, CRBF_ID, POR_ENDDATE, POR_NUMBER, POR_BENEFICIARY_ID, POR_BRANCH, POR_DEFAULTDEDUCTIBLE, POR_FRANCHISEAMOUNT, POR_ADDITIONALINFORMATION, POR_DEDUCTIBLETYPE, POR_FINAL, POR_ITEMRESERVE, POR_GENERATEPREMIUMDEPOSIT, POR_PARTAMOUNT, POR_AUTORIZED)
VALUES (AZTECA_V138.SQ_PAYMENTORDER.nextval, TIMESTAMP '2023-01-25 12:00:00', DATE '2023-01-25', 442733, 0, 672907, 6868, 38440, 'BANCO AZTECA SA  DE CV', null,
        0, 0, 9704.02, 'system', 0, 0, null, 1, 0, 0, 0, 1, 1, 0, 0, TIMESTAMP '2023-01-25 12:00:00', DATE '2023-01-25',
        'Cobertura Básica por Fallecimiento', 0, null, DATE '2023-01-25', 1, 672907, 460, 0.00000, 0.00000, null, null, 0, null, 0, 0.00000, 0);