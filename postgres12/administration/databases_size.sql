-- this query returns the size of each database in the current server
SELECT
  pg_database.datname,
  pg_size_pretty(pg_database_size(pg_database.datname)) AS size
FROM
  pg_database;
