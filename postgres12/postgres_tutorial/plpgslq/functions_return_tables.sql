CREATE OR REPLACE FUNCTION get_film(p_pattern VARCHAR, p_year INTEGER)
RETURNS TABLE(
  film_title VARCHAR,
  film_release_year INTEGER
)
LANGUAGE plpgsql
AS $$
DECLARE
  rec RECORD;
BEGIN
  FOR rec IN(
    SELECT title, release_year FROM film
      WHERE title LIKE p_pattern AND release_year = p_year
  ) LOOP
    film_title := UPPER(rec.title);
    film_release_year := rec.release_year;
    RETURN NEXT;
  END LOOP;
END
$$;
