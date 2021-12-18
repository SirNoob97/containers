/*
 How many people can be included into a single booking according to the available data?
 */
SELECT
  tt.cnt,
  COUNT(*)
FROM
  (
    SELECT
      t.book_ref,
      COUNT(*) cnt
    FROM
      tickets t
    GROUP BY
      t.book_ref
  ) tt
GROUP BY
  tt.cnt
ORDER BY
  tt.cnt;
