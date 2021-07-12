-- year is a custom type of the dvdrental db
CREATE TYPE film_summary AS (film_id INT, title VARCHAR, release_year year);
CREATE
OR REPLACE FUNCTION get_film_summary(f_id INT) RETURNS film_summary AS
$$
SELECT
  film_id,
  title,
  release_year
FROM
  film
WHERE
  film_id = f_id;
$$
LANGUAGE SQL;
