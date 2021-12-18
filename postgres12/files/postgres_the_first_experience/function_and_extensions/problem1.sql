/*
 Find the distance between Kaliningrad (KGD) and Petropavlovsk-Kamchatsky (PKC).
 
 need this extensions: 
 CREATE EXTENSION IF NOT EXISTS cube;
 CREATE EXTENSION IF NOT EXISTS earthdistance;
 */
SELECT
  round((a_from.coordinates <@> a_to.coordinates) * 1.609344)
FROM
  airports a_from,
  airports a_to
WHERE
  a_from.airport_code = 'KGD'
  AND a_to.airport_code = 'PKC';
