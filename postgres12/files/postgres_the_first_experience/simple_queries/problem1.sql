/*
 Who traveled from Moscow (SVO) to Novosibirsk (OVB) on seat 1A yesterday, and when was the ticket
 booked?
 */
SELECT
  t.passenger_name,
  b.book_date
FROM
  bookings b
  JOIN tickets t USING(book_ref)
  JOIN boarding_passes bp USING(ticket_no)
  JOIN flights f USING(flight_id)
WHERE
  f.departure_airport = 'SVO'
  AND f.arrival_airport = 'OVB'
  AND f.scheduled_departure::DATE = bookings.now()::DATE - INTERVAL '2 day'
  AND bp.seat_no = '1A';
