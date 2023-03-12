
select * from interseguro.STPO_WILDCARDQUOTA
where apo_id in (80068647,80038412, 80038422) and wquo_id in (799,
2723,
5630);

select * from interseguro.STPO_WILDCARDQUOTAHISTORY
where wquo_id in (17201,799,7877,61488,5629,5630,7826,8616,61486,61487,16656,16657,2723,2724,2725,8614,8615,61481,61482,61483,61484,61485)
and wquh_scheduledtype is null;

select * from interseguro.poliza
where numeropoliza in ('141186','141187','141188');

update interseguro.STPO_WILDCARDQUOTAHISTORY set wquh_scheduledtype = 2 
where wquo_id in (799,
2723,
5630);


select * from interseguro.STPO_WILDCARDQUOTAHISTORY
where wquo_id in (
5629,
5630,
7826,
8616,
61486,
61487);

select * from interseguro.STPO_WILDCARDQUOTAHISTORY 
where wquo_id in (799,
2723,
5630);