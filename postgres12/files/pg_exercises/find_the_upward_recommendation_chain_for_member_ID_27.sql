/*
 Find the upward recommendation chain for member ID 27: that is,
 the member who recommended them, and the member who recommended that member, and so on.
 Return member ID, first name, and surname. Order by descending member id.
 */
WITH RECURSIVE recommendeds AS (
  SELECT
    recommendedby
  FROM
    members
  WHERE
    memid = 27
  UNION ALL
  SELECT
    m.recommendedby
  FROM
    members m
    INNER JOIN recommendeds r ON m.memid = r.recommendedby
)
SELECT
  r.recommendedby,
  m.firstname,
  m.surname
FROM
  recommendeds r
  INNER JOIN members m ON r.recommendedby = m.memid
ORDER BY
  memid desc;
