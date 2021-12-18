/*
 Return a count of bookings for each month, sorted by month
 */
SELECT
  DATE_TRUNC('month', starttime) AS month,
  COUNT(*)
FROM
  bookings
GROUP BY
  month
ORDER BY
  month;
