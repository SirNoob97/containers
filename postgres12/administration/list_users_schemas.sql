select * from pg_catalog.pg_namespace where nspacl is null and nspname not like 'pg_%' order by nspname;
