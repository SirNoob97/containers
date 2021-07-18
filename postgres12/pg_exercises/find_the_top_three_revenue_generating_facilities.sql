/*
 Produce a list of the top three revenue generating facilities (including ties).
 Output facility name and rank, sorted by rank and facility name.
 */
SELECT
  *
FROM
  (
    SELECT
      f.name,
      RANK() OVER(
        ORDER BY
          SUM(
            CASE
              WHEN b.memid = 0 THEN f.guestcost * b.slots
              ELSE f.membercost * b.slots
            END
          ) DESC
      ) AS ranked
    FROM
      facilities f
      INNER JOIN bookings b USING(facid)
    GROUP BY
      f.name
  ) AS r
WHERE
  r.ranked <= 3;
