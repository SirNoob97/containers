/*
 Solve the previous problem for first names and last names separately.
 */
/*
 Conclusion: do not use a single text field for different values if you are going to use them separately;
 in scientific terms, it is called “first normal form.”
 */
WITH p AS (
  SELECT
    LEFT(passenger_name, POSITION(' ' IN passenger_name)) AS passenger_name
  FROM
    tickets
)
SELECT
  passenger_name,
  ROUND(100.0 * cnt / SUM(cnt) OVER(), 2) AS percent
FROM
  (
    SELECT
      passenger_name,
      COUNT(*) cnt
    FROM
      p
    GROUP BY
      passenger_name
  ) t
ORDER BY
  percent DESC;
