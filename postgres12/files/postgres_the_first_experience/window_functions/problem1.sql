/*
 For each ticket, display all the included flight segments, together with connection time.
 Limit the result to the tickets booked a week ago.
 */
SELECT
  tf.ticket_no,
  f.departure_airport,
  f.arrival_airport,
  f.scheduled_arrival,
  LEAD(f.scheduled_departure) OVER w AS next_departure,
  LEAD(f.scheduled_departure) OVER w - f.scheduled_departure AS gap
FROM
  bookings b
  JOIN tickets t USING(book_ref)
  JOIN ticket_flights tf USING(ticket_no)
  JOIN flights f USING(flight_id)
WHERE
  b.book_date = bookings.now()::DATE - INTERVAL '7 days' WINDOW w AS (
    PARTITION BY tf.ticket_no
    ORDER BY
      f.scheduled_departure
  );
