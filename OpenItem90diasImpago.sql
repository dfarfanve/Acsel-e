SELECT max (op.dateUseRecipent)
FROM INTERSEGURO.OpenItem op INNER JOIN INTERSEGURO.openItemReference ref ON OP.OPENITEMID = REF.OPENITEMID
WHERE ref.policyID = 80063689
      AND op.DTY_ID = 7572
      AND op.status = 'applied'
      AND op.OPM_SUBSTATUS = 'applied';