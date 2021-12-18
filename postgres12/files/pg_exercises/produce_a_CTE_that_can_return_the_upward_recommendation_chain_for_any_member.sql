/*
 Produce a CTE that can return the upward recommendation chain for any member.
 You should be able to select recommender from recommenders where member=x.
 Demonstrate it by getting the chains for members 12 and 22.
 Results table should have member and recommender, ordered by member ascending,
 recommender descending.
 */
WITH RECURSIVE recurs AS (
  SELECT
    memid,
    recommendedby
  FROM
    members
  UNION ALL
  SELECT
    r.memid,
    m.recommendedby
  FROM
    members m
    INNER JOIN recurs r ON m.memid = r.recommendedby
)
SELECT
  r.memid,
  r.recommendedby,
  m.firstname,
  m.surname
FROM
  recurs r
  INNER JOIN members m ON m.memid = r.recommendedby
WHERE
  r.memid = 12
  OR r.memid = 22
ORDER BY
  memid,
  recommendedby desc;
