-- using 'sales' table
/*
SELECT brand, segment, SUM(quantity) FROM sales GROUP BY brand, segment
UNION ALL
SELECT brand, NULL, SUM(quantity) FROM sales GROUP BY brand
UNION ALL
SELECT NULL, segment, SUM(quantity) FROM sales GROUP BY segment
UNION ALL
SELECT NULL, NULL, SUM(quantity) FROM sales;
*/

-- grouping sets clouse
SELECT brand, segment, SUM(quantity) FROM sales GROUP BY
  GROUPING SETS((brand, segment), (brand), (segment), ());

SELECT GROUPING(brand) grouping_brand, GROUPING(segment) grouping_segment, brand, segment, SUM(quantity)
  FROM sales GROUP BY GROUPING SETS((brand), (segment), ()) ORDER BY brand, segment;

SELECT GROUPING(brand) grouping_brand, GROUPING(segment) grouping_segment, brand, segment, SUM(quantity)
  FROM sales GROUP BY GROUPING SETS((brand), (segment), ()) HAVING GROUPING(brand) = 0 ORDER BY brand, segment;
