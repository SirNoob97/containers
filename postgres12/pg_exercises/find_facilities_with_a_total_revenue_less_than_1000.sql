/*
 Produce a list of facilities with a total revenue less than 1000.
 Produce an output table consisting of facility name and revenue, sorted by revenue.
 Remember that there's a different cost for guests and members!
 */
SELECT
  *
FROM
  (
    SELECT
      name,
      SUM(
        CASE
          WHEN memid = 0 THEN guestcost * slots
          ELSE membercost * slots
        end
      ) AS revenue
    FROM
      facilities
      INNER JOIN bookings USING(facid)
    GROUP BY
      name
    ORDER BY
      revenue
  ) AS res
WHERE
  res.revenue < 1000;
