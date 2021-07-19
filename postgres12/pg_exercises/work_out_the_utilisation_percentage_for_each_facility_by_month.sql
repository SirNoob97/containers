/*
 Work out the utilisation percentage for each facility by month,
 sorted by name and month, rounded to 1 decimal place.
 Opening time is 8am, closing time is 8.30pm.
 You can treat every month as a full month, regardless of if there were some dates the
 club was not open.
 */
SELECT
  name,
  month,
  ROUND(
    (100 * slots) / CAST(
      25 * (
        CAST((month + interval '1 month') AS DATE) - CAST (month AS DATE)
      ) AS NUMERIC
    ),
    1
  ) AS utilisation
FROM
  (
    SELECT
      facs.name AS name,
      date_trunc('month', starttime) AS month,
      SUM(slots) AS slots
    FROM
      cd.bookings bks
      INNER JOIN cd.facilities facs ON bks.facid = facs.facid
    GROUP BY
      facs.facid,
      month
  ) AS inn
ORDER BY
  name,
  month;
