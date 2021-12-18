/*
 Find the shortest route from Ust-Kut (UKX) to Negungri (CNN) from the flight time point of view (ignoring
 connection time)
 */
WITH RECURSIVE p(
  last_arrival,
  destination,
  hops,
  flights,
  flight_time,
  min_time
) AS (
  SELECT
    a_from.airport_code,
    a_to.airport_code,
    array [ a_from.airport_code ],
    array [ ]:: CHAR(6) [ ],
    INTERVAL '0',
    NULL:: INTERVAL
  FROM
    airports a_from,
    airports a_to
  WHERE
    a_from.airport_code = 'UKX'
    AND a_to.airport_code = 'CNN'
  UNION ALL
  SELECT
    r.arrival_airport,
    p.destination,
    (p.hops || r.arrival_airport):: CHAR(3) [ ],
    (p.flights || r.flight_no):: CHAR(6) [ ],
    p.flight_time + r.duration,
    LEAST(
      p.min_time,
      MIN(p.flight_time + r.duration) FILTER(
        WHERE
          r.arrival_airport = p.destination
      ) OVER()
    )
  FROM
    p
    JOIN routes r ON r.departure_airport = p.last_arrival
  WHERE
    NOT r.arrival_airport = ANY(p.hops)
    AND p.flight_time + r.duration < COALESCE(p.min_time, INTERVAL '1 year')
)
SELECT
  hops,
  flights,
  flight_time
FROM
  (
    SELECT
      hops,
      flights,
      flight_time,
      MIN(min_time) OVER() min_time
    FROM
      p
    WHERE
      p.last_arrival = p.destination
  ) t
WHERE
  flight_time = min_time;
