/*
 How many seats remained free on flight PG0404 yesterday?
 */
SELECT
  COUNT(*)
FROM
  flights f
  JOIN seats s USING(aircraft_code)
WHERE
  f.flight_no = 'PG0404'
  AND f.scheduled_departure::DATE = bookings.now()::DATE - INTERVAL '1 day'
  AND NOT EXISTS(
    SELECT
      NULL
    FROM
      boarding_passes bp
    WHERE
      bp.flight_id = f.flight_id
      AND bp.seat_no = s.seat_no
  );
