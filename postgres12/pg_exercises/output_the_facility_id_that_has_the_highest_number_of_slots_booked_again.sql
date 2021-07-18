/*
 Output the facility id that has the highest number of slots booked.
 Ensure that in the event of a tie, all tieing results get output.
 */
SELECT
  facid,
  total
FROM
  (
    SELECT
      facid,
      SUM(slots) AS total,
      RANK() OVER(
        ORDER BY
          SUM(slots) DESC
      ) AS rank
    FROM
      bookings
    GROUP BY
      facid
  ) AS ranked
WHERE
  rank = 1;
