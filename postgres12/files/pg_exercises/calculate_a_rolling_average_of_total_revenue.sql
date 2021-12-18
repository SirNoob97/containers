/*
 For each day in August 2012, calculate a rolling average of total revenue
 over the previous 15 days.
 Output should contain date and revenue columns, sorted by the date.
 Remember to account for the possibility of a day having zero revenue.
 */
SELECT
  d.day AS date,
  (
    SELECT
      SUM(
        CASE
          WHEN b.memid = 0 THEN b.slots * f.guestcost
          ELSE b.slots * f.membercost
        END
      )
    FROM
      bookings b
      INNER JOIN facilities f USING(facid)
    WHERE
      b.starttime >= d.day - interval '14d'
      AND b.starttime < d.day + interval '1d'
  ) / 15 AS revenue
FROM
  (
    SELECT
      GENERATE_SERIES('2012-08-01', '2012-08-31', INTERVAL '1D')::DATE AS day
  ) AS d
GROUP BY
  d.day
ORDER BY
  date;
