SELECT MACHINE,PROGRAM,STATUS, COUNT(*) CONEXIONES FROM V$SESSION
WHERE STATUS = 'ACTIVE'
GROUP BY MACHINE,PROGRAM,STATUS 
ORDER BY 4 DESC;