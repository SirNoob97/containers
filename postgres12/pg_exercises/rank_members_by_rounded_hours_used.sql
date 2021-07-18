/*
 Produce a list of members (including guests), along with the number of hours
 they've booked in facilities, rounded to the nearest ten hours.
 Rank them by this rounded figure, producing output of first name, surname,
 rounded hours, rank. Sort by rank, surname, and first name.
 */
SELECT
  m.firstname,
  m.surname,
  ROUND(SUM(b.slots) * 0.5, -1) AS hours,
  RANK() OVER(
    ORDER BY
      ROUND(SUM(b.slots) * 0.5, -1) DESC
  ) AS ranked
FROM
  members m
  INNER JOIN bookings b USING(memid)
GROUP BY
  memid
ORDER BY
  ranked,
  surname,
  firstname;
