/*
 How can you get from Ust-Kut(UKX) to Neryungri(CNN) with the minimal number of connections,
 and what will the flight time be?

 Explanation: https://habr.com/en/company/postgrespro/blog/490228/
 */
WITH RECURSIVE p(
  last_arrival,
  destination,
  hops,
  flights,
  flight_time,
  found
) AS (
  SELECT
    a_from.airport_code,
    a_to.airport_code,
    array [ a_from.airport_code ],
    array [ ]:: char(6) [ ],
    INTERVAL '0',
    a_from.airport_code = a_to.airport_code
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
    bool_or(r.arrival_airport = p.destination) OVER()
  FROM
    p
    JOIN routes r ON r.departure_airport = p.last_arrival
  WHERE
    NOT r.arrival_airport = ANY(p.hops)
    AND NOT p.found
)
SELECT
  hops,
  flights,
  flight_time
FROM
  p
WHERE
  p.last_arrival = p.destination;
