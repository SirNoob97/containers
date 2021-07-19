SELECT
  (DATE_TRUNC('month', ts.testts) + INTERVAL '1 month') - DATE_TRUNC('day', ts.testts) AS remaining
FROM
  (
    SELECT
      TIMESTAMP '2012-02-11 01:00:00' AS testts
  ) ts;
