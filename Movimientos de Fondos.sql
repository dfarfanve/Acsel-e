select (select PP.NUMEROPOLIZAINPUT from APP_VIDA.PREPOLICY PP where  AP.AGREGATEDPOLICYID= PP.STATIC and rownum=1 and pp.NUMEROPOLIZAINPUT is not null) poliza,
FA.LFA_DESCRIPTION CUENTA, FT.LFT_DESCRIPTION PORTAFOLIO ,
     FMP.FMP_DESCPROPERTY, FMP.FMP_CONCEPT, FMP.FMP_AMOUNT, FMP.FMP_DATEOPERATION
from APP_VIDA.PRODUCT P
 JOIN APP_VIDA.PREPRODUCT PP ON P.PRODUCTID = PP.STATIC
 JOIN APP_VIDA.AGREGATEDPOLICY AP ON P.PRODUCTID = AP.PRODUCTID
 JOIN APP_VIDA.STLI_FUNDMOVEMENTPOLICY FMP ON AP.AGREGATEDPOLICYID = FMP.APO_ID
 JOIN APP_VIDA.STLI_FUNDACCOUNT FA ON FMP.LFA_ID = FA.LFA_ID
JOIN APP_VIDA.STLI_FUNDTYPE FT ON FMP.LFT_ID = FT.LFT_ID
WHERE P.DESCRIPTION = 'FlexiVida' 
AND  FMP.FMP_STATUS=2
ORDER BY FMP.APO_ID,  FA.LFA_DESCRIPTION , FT.LFT_DESCRIPTION, FMP.FMP_ID,  FMP.FMP_DATEOPERATION;