exec  dbms_stats.gather_schema_stats(ownname          => 'INTERSEGURO', -
      estimate_percent => dbms_stats.auto_sample_size, -
      cascade          => true, -
      degree           => 4 -
   )