/*
 There is no indication whether the ticket is one-way or round-trip.
 However, you can figure it out by comparing the first point of departure with the last point of
 destination.
 Display airports of departure and destination for each ticket, ignoring connections, and decide whether
 it’s a round-trip ticket.
 */
WITH t AS (
  SELECT
    ticket_no,
    a,
    a [ 1 ] departure,
    a [ CARDINALITY(a) ] last_arrival,
    a [ CARDINALITY(a) / 3 ] middle
  FROM
    (
      SELECT
        t.ticket_no,
        ARRAY_AGG(
          f.departure_airport
          ORDER BY
            f.scheduled_departure
        ) || (
          ARRAY_AGG(
            f.arrival_airport
            ORDER BY
              f.scheduled_departure DESC
          )
        ) [ 1 ] AS a
      FROM
        tickets t
        JOIN ticket_flights tf USING(ticket_no)
        JOIN flights f USING(flight_id)
      GROUP BY
        t.ticket_no
    ) t
)
SELECT
  t.ticket_no,
  t.a,
  t.departure,
  CASE
    WHEN t.departure = t.last_arrival THEN t.middle
    ELSE t.last_arrival
  END arrival,
  (t.departure = t.last_arrival) return_ticket
FROM
  t;
