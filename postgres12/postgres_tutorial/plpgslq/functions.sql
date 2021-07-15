CREATE OR REPLACE FUNCTION get_film_count(len_from INT, lent_to INT)
RETURNS INT
LANGUAGE plpgsql
AS
$$
DECLARE
  film_count INTEGER;
BEGIN
  SELECT COUNT(*) INTO film_count FROM film WHERE length BETWEEN len_from AND lent_to;
  RETURN film_count;
END
$$;

-- IN parameters mode(default)
CREATE OR REPLACE FUNCTION find_film_by_id(p_film_id INT)
RETURNS VARCHAR
LANGUAGE plpgsql
AS $$
DECLARE
  film_title film.title%TYPE;
BEGIN
  SELECT title INTO film_title FROM film WHERE film_id = p_film_id;

  IF NOT found THEN
    RAISE NOTICE 'Film with id % not found', p_film_id;
  END IF;

  RETURN film_title;
END
$$;

-- OUT parameters mode
CREATE OR REPLACE FUNCTION get_film_stat(
  OUT min_len INT,
  OUT max_len INT,
  OUT avg_len NUMERIC)
LANGUAGE plpgsql
AS $$
BEGIN
  SELECT MIN(length), MAX(length), AVG(length)::NUMERIC(5,1)
    INTO min_len, max_len, avg_len FROM film;
END
$$;

-- INOUT paremeters mode
CREATE OR REPLACE FUNCTION swap(INOUT x INT, INOUT y INT)
LANGUAGE plpgsql
AS $$
BEGIN
  SELECT x, y INTO y, x;
END
$$;
