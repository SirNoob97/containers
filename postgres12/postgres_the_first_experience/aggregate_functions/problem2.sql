/*
 Find the most disciplined passengers who checked in first for all their flights.
 Take into account only those passengers who took at least two flights.
 */
SELECT
  t.passenger_name,
  t.ticket_no
FROM
  tickets t
  JOIN boarding_passes bp USING(ticket_no)
GROUP BY
  t.passenger_name,
  t.ticket_no
HAVING
  MAX(bp.boarding_no) = 1
  AND COUNT(*) > 1;
