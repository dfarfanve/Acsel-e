/******   JobsCierreMes.sql **********************/
/* Obtiene los procesos ejecutados para el cierre de mes ordenados 
 * por ejecución con su fecha y hora de inicio y fecha de finalización.
 * 
 * @Parametro #1: Fecha Inicial
 * @Parametro #1: Fecha Final 
 * @author Consis International (CON)
 */
SELECT C.JSA_ID,C.JSA_DESCRIPTION,P.JSP_INITIALDATE,P.JSP_FINALDATE
FROM INTERSEGURO.STJS_PROCESS P
       INNER JOIN INTERSEGURO.STJS_APPOINTMENTPROCESS A ON A.JSP_ID = P.JSP_ID
       INNER JOIN INTERSEGURO.STJS_APPOINTMENT C ON A.JSA_ID = C.JSA_ID
WHERE TO_CHAR(P.JSP_INITIALDATE, 'YYYY-MM-DD HH24:Mi:SS') >= ? /* '2019-02-01 00:00:00' */
AND TO_CHAR(P.JSP_FINALDATE, 'YYYY-MM-DD HH24:Mi:SS') <= ? /* '2019-02-01 13:00:00' */
ORDER BY P.JSP_INITIALDATE,P.JSP_FINALDATE ASC;
