SELECT DESCRIPTION FROM PRODUCT PRO 
INNER JOIN PRODUCTPROPERTY propro ON propro.pro_id = PRO.productid AND propro.prp_type = 2;