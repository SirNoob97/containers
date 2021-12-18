/*
 For each month of the year in 2012, output the number of days in that month.
 Format the output as an integer column containing the month of the year,
 and a second column containing an interval data type.
 */
SELECT
  EXTRACT(
    'month'
    FROM
      cal.month
  ) AS month,
  (cal.month + interval '1 month') - cal.month AS length
FROM
  (
    SELECT
      GENERATE_SERIES(
        TIMESTAMP '2012-01-01',
        TIMESTAMP '2012-12-01',
        INTERVAL '1 month'
      ) AS month
  ) cal
ORDER BY
  month;
