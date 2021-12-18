/*
 Find the downward recommendation chain for member ID 1: that is,
 the members they recommended, the members those members recommended, and so on.
 Return member ID and name, and order by ascending member id.
 */
WITH RECURSIVE recurs AS (
  SELECT
    memid
  FROM
    members
  WHERE
    recommendedby = 1
  UNION ALL
  SELECT
    m.memid
  FROM
    members m
    INNER JOIN recurs r ON r.memid = m.recommendedby
)
SELECT
  r.memid,
  m.firstname,
  m.surname
FROM
  recurs r
  INNER JOIN members m ON m.memid = r.memid
ORDER BY
  memid;
