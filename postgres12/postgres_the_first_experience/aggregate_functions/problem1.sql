/*
 What is the shortest flight duration for each possible flight from Moscow to St. Petersburg,
 and how many times was the flight delayed for more than an hour?
 */
SELECT
  f.flight_no,
  f.scheduled_duration,
  MIN(f.actual_duration),
  MAX(f.actual_duration),
  SUM(
    CASE
      WHEN f.actual_departure > f.scheduled_departure + INTERVAL '1 hour' THEN 1
      ELSE 0
    END
  ) AS delays
FROM
  flights_v f
WHERE
  f.departure_city = 'Moscow'
  AND f.arrival_city = 'St. Petersburg'
  AND f.status = 'Arrived'
GROUP BY
  f.flight_no,
  f.scheduled_duration;
