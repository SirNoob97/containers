/*
 Which combinations of first and last names occur most often?
 What is the ratio of the passengers with such names to the total number of passengers?
 */
SELECT
  passenger_name,
  ROUND(100.0 * cnt / SUM(cnt) OVER(), 2) AS percent
FROM
(
    SELECT
      passenger_name,
      COUNT(*) cnt
    FROM
      tickets
    GROUP BY
      passenger_name
  ) t
ORDER BY
  percent DESC;
