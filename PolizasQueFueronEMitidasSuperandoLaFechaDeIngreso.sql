SELECT DISTINCT PRE.NUMEROPOLIZAINPUT AS POLIZA/*,(SELECT EDADMAXIMAINPUT FROM INTERSEGURO.DESGTARJETAS) AS EDADMAX,
---trunc((trunc(to_date(PRE.FECHAEMISIONINPUT,'YYYY/MM/DD'))-trunc(to_date(FNACTRAMAINPUT,'YYYY/MM/DD')))/365) as EDAD,
PDT.NUMERODOCTRAMAINPUT,PDT.FNACTRAMAINPUT,PRE.FECHAEMISIONINPUT,PDT.NOMBREUNOTRAMAINPUT,PDT.NOMBREDOSTRAMAINPUT,PDT.APELLIDOUNOTRAMAINPUT,PDT.APELLIDODOSTRAMAINPUT*/
FROM INTERSEGURO.PREPOLICY PRE
--INNER JOIN INTERSEGURO.POLICYDCO PDCO ON PDCO.DCOID=PRE.PK
--INNER JOIN INTERSEGURO.AGREGATEDPOLICY AG ON AG.AGREGATEDPOLICYID = PDCO.AGREGATEDOBJECTID
INNER JOIN INTERSEGURO.POLDESGTARJETAS PDT ON PRE.STATIC = PDT.STATIC
WHERE PRE.FECHAEVENTOANTERIORINPUT IS NULL AND trunc((trunc(to_date(PRE.FECHAEMISIONINPUT,'YYYY/MM/DD'))-trunc(to_date(FNACTRAMAINPUT,'YYYY/MM/DD')))/365)>72--(SELECT EDADMAXIMAINPUT FROM INTERSEGURO.DESGTARJETAS)
--AND 
AG.PRODUCTID = 35447-- AND PDT.STATIC = 87520286
