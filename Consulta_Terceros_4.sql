set sqlformat csv
set echo off
set feedback off

spool \\10.54.66.107\adn\ACSEL\ConsultasCONSIS\Consulta_Terceros_4.csv

--SIN NOT NULL
--Muestra todos los registros para los terceros repetidos por RFCINPUT y que tengan polizas asociadas (aplicadas)
SELECT NP1.STATIC,
NP1.CLIENTEUNICOBAZINPUT,
       NP1.CLIENTEUNICOTDAINPUT,
       NP1.CURPINPUT,
       NP1.RFCINPUT,
       NP1.NOMBREINPUT,
       NP1.APELLIDOPATERNOINPUT,
       NP1.APELLIDOMATERNOINPUT,
       NP1.BIRTHDATEINPUT
FROM AZTECA_V138.NATURALPERSON NP1
WHERE EXISTS(
              select NP.RFCINPUT
              from AZTECA_V138.NATURALPERSON NP
              WHERE NP.RFCINPUT = NP1.RFCINPUT
                AND --estan en polizas aplicadas
                  (EXISTS(select 1
                          from AZTECA_V138.STPO_POLICYPARTICIPATION pp,
                               AZTECA_V138.CONTEXTOPERATION ctx
                          where pp.OPERATIONPK = ctx.ID
                            and pp.THIRDPARTYID = np.static
                            and ctx.STATUS = 2)
                      OR EXISTS(select 1
                                from AZTECA_V138.STPO_INSOBJPARTICIPATION op,
                                     AZTECA_V138.CONTEXTOPERATION ctx
                                where op.OPERATIONPK = ctx.ID
                                  and op.THIRDPARTYID = np.static
                                  and ctx.STATUS = 2)
                      )
              GROUP BY NP.RFCINPUT
              HAVING COUNT(NP.RFCINPUT) > 1
          );
---

spool off

set sqlformat csv
set echo off
set feedback off