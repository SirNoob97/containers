/*
 Find the pairs of airports with inbound and outbound flights departing on different days of the week.
 */
SELECT
  r1.departure_airport,
  r1.arrival_airport,
  r1.days_of_week dow,
  r2.days_of_week dow_back
FROM
  routes r1
  JOIN routes r2 ON r1.arrival_airport = r2.departure_airport
  AND r2.arrival_airport = r1.departure_airport
WHERE
  NOT(r1.days_of_week && r2.days_of_week);
