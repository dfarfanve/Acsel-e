/* RECUPERA LAS OPERACIONES DUPLICADAS POR POLIZA */
create table oper_dup as (
SELECT 
TRUNC(ct.TIME_STAMP,'DD') TIME_STAMP,
PP.NUMEROPOLIZAINPUT policynumber,
PDCO.AGREGATEDOBJECTID policyid ,
MIN(pdco.operationpk) minOperationPk,
REPLACE(LISTAGG(PDCO.OPERATIONPK, ',') WITHIN GROUP (ORDER BY pdco.operationpk DESC),',' || MIN(pdco.operationpk),'') oper_todel
FROM INTERSEGURO.POLICYDCO PDCO
JOIN INTERSEGURO.PREPOLICY PP ON PDCO.DCOID=PP.PK
join interseguro.contextoperation ct on PDCO.OPERATIONPK=CT.ID and ct.status=2
join INTERSEGURO.EVENTDCO edco on PDCO.IDDCOEVENT=EDCO.IDDCOEVENT
join INTERSEGURO.EVENTTYPE et  on EDCO.EVENTTYPEID=ET.EVENTTYPEID
where ET.DESCRIPTION='Renovar'
and EXTRACT(YEAR from ct.time_stamp)='2018'
and PP.NUMEROPOLIZAINPUT IN ('900040575')
group by TRUNC(ct.TIME_STAMP,'DD'),PDCO.AGREGATEDOBJECTID, PP.NUMEROPOLIZAINPUT
having COUNT(*)>1);

/*CREACION DE INDICES */
create index idx_tmp_deloper_1 on oper_dup (policyid);
create index idx_tmp_deloper_2 on oper_dup (minOperationPk);
create index idx_tmp_deloper_3 on oper_dup (policynumber);


/* UNIFICAR OPERACIONES DUPLICADAS EN LA OPERACION CORRECTA */
begin
    for pol in (select * from oper_dup) loop
            merge into interseguro.openitem oopm using 
                (select o.operationpk ,O.OPENITEMID,o.status,O.DOCDATE from 
                    interseguro.openitem o 
                    inner join (select trim(regexp_substr(pol.oper_todel, '(.*?)(,|$)', 1, level, null, 1)) operationpk
                    from dual connect by level <= regexp_count(pol.oper_todel, ',')+1) oper on o.operationpk = oper.operationpk  
                 where  o.dty_id=7572 and status='applied') iopm
            on (iopm.openitemid = oopm.openitemid)
            when matched then update set oopm.operationpk  = pol.minOperationPk;
            if sql%rowcount > 0 then
            dbms_output.put_line ('oper='||pol.minOperationPk||' updated='||sql%rowcount);
            end if;
        end loop;
end;

/* CREAR TABLA DE OPERACIONES PARA SER ELIMINADAS POST-UNIFICAR */
create table opm_todel as
select opm.openitemid,opm.operationpk, OPR.OPR_POLICYNUMBER  from oper_dup tmp
inner join interseguro.openitem opm on opm.operationpk = tmp.minoperationpk
and opm.dty_id  =7572 and opm.status = 'active'
inner join interseguro.openitemreference opr on opr.openitemid = opm.openitemid
where exists (select 1 from interseguro.openitem op
        inner join interseguro.openitemreference re on re.openitemid = op.openitemid
            where re.policyid = opr.policyid and op.dty_id = 7572 and op.status = 'applied'
                    and op.docdate = opm.docdate);

/* BACKUP DE OPENITEMS DE OPERACIONES*/                    
create table tmp_openitems_deleted_backup as
select o.* from oper_dup tmp
inner join interseguro.openitem o on (tmp.minoperationpk = o.operationpk or tmp.oper_todel = o.operationpk)
where o.dty_id=7572;

/*ELIMINACION DE OPENITEMS STATUS ACTIVE*/    
DELETE FROM interseguro.openitem op_base where op_base.openitemid in (select openitemid from opm_todel);    

