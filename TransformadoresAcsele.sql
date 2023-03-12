select otd.FECHAINPUT, otd.FECHAVALUE, sq_help.get_sq('SQ_DCO') pk, tf.DESCRIPTION PLANEXTRACASHINPUT, tf.value||'.0' PLANEXTRACASHVALUE,
  otd.STATIC, otd.STATUS, otd.TASABRUTAINPUT, otd.TASABRUTAVALUE,
  otd.TASANETAINPUT, otd.TASANETAVALUE from interseguro.property prop
  inner join interseguro.transformadorfila tf on tf.propertyid = prop.propertyid
  inner join interseguro.TDPrimaReasegExtracash otd on otd.PLANEXTRACASHINPUT = tf.DESCRIPTION||'V2'
where prop.simbolo = 'PlanExtracash'
      and not exists (select 1 from interseguro.TDPrimaReasegExtracash td where td.PLANEXTRACASHINPUT = tf.DESCRIPTION);

select
  otd.CUOTAPLANEXTRACASHINPUT, otd.CUOTAPLANEXTRACASHVALUE, otd.FECHAINPUT, otd.FECHAVALUE,sq_help.get_sq('SQ_DCO')  PK,
                                                                                           tf.DESCRIPTION PLANEXTRACASHINPUT, tf.value||'.0' PLANEXTRACASHVALUE,  otd.STATIC, otd.STATUS
from interseguro.property prop
  inner join interseguro.transformadorfila tf on tf.propertyid = prop.propertyid
  inner join interseguro.TDCuotaExtracash otd on otd.PLANEXTRACASHINPUT = tf.DESCRIPTION||'V2'
where prop.simbolo = 'PlanExtracash'
      and not exists (select 1 from interseguro.TDCuotaExtracash td where td.PLANEXTRACASHINPUT = tf.DESCRIPTION);
