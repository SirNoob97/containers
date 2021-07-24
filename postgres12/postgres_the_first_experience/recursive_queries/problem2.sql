/*
 What is the maximum number of connections that can be required to get from any airport to any other
 airport?
 */
WITH RECURSIVE p(departure, last_arrival, destination, hops, found) AS (
  SELECT
    a_from.airport_code,
    a_from.airport_code,
    a_to.airport_code,
    array [ a_from.airport_code ],
    a_from.airport_code = a_to.airport_code
  FROM
    airports a_from,
    airports a_to
  UNION ALL
  SELECT
    p.departure,
    r.arrival_airport,
    p.destination,
    (p.hops || r.arrival_airport):: CHAR(3) [ ],
    BOOL_OR(r.arrival_airport = p.destination) OVER(PARTITION BY p.departure, p.destination)
  FROM
    p
    JOIN routes r ON r.departure_airport = p.last_arrival
  WHERE
    NOT r.arrival_airport = ANY(p.hops)
    AND NOT p.found
)
SELECT
  MAX(CARDINALITY(hops) -1)
FROM
  p
WHERE
  p.last_arrival = p.destination;
