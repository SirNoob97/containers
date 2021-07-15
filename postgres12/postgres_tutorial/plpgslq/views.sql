CREATE OR REPLACE VIEW customer_master AS
SELECT cu.customer_id AS id,
  cu.first_name || ' ' || cu.last_name AS name,
  a.address,
  a.postal_code AS "zip code",
  a.phone,
  city.city,
  country.country,
  CASE
    WHEN cu.activebool THEN 'active'
    ELSE ''
  END AS notes,
  cu.store_id AS sid,
  cu.email
  FROM customer cu
  INNER JOIN address a USING(address_id)
  INNER JOIN city USING(city_id)
  INNER JOIN country USING(country_id);

CREATE OR REPLACE VIEW usa_city AS
  SELECT city_id, city, country_id FROM city
  WHERE country_id = 103 ORDER BY city
  WITH CHECK OPTION;

CREATE OR REPLACE VIEW city_a AS
  SELECT city_id, city, country_id FROM city
  WHERE city LIKE 'A%';

-- using WITH CASCADED CHECK OPTION
-- operation like this INSERT INTO city_a_usa(city, country_id) VALUES('Houston', 103);
-- will result in an error

-- This is because when we used the WITH CASCADED CHECK OPTION
-- for the city_a_usa view, PostgreSQL checked the view-defining condition
-- of the city_a_usa view and also all the underlying views, in this case,
-- it is the city_a view.
CREATE OR REPLACE VIEW city_a_usa AS
  SELECT city_id, city, country_id FROM city_a
  WHERE country_id = 103
  WITH LOCAL CHECK OPTION;
