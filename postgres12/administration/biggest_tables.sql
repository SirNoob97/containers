-- this query returns top 5 bigest tables in the current database
SELECT
  relname AS relation,
  pg_size_pretty(pg_total_relation_size(c.oid)) AS total_size
FROM
  pg_class c
  LEFT JOIN pg_namespace n ON (n.oid = c.relnamespace)
WHERE
  nspname NOT IN ('pg_catalog', 'information_schema')
  AND c.relkind <> 'i'
  AND nspname !~ '^pg_toast'
ORDER BY
  pg_total_relation_size(c.oid) desc
LIMIT 5;
