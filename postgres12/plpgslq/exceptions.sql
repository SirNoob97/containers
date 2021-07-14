-- no data found
DO
$$
DECLARE
  rec RECORD;
  v_film_id INTEGER = 2000;
BEGIN
  SELECT film_id, title INTO STRICT rec FROM film WHERE film_id = v_film_id;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE EXCEPTION 'film % not found', v_film_id;
END
$$
LANGUAGE plpgsql;

-- too many rows
DO
$$
DECLARE
  rec RECORD;
BEGIN
  SELECT film_id, title INTO STRICT rec FROM film WHERE title LIKE 'A%';
  EXCEPTION
    WHEN TOO_MANY_ROWS THEN
      RAISE EXCEPTION 'Search query returns too many rows';
END
$$
LANGUAGE plpgsql;

-- multiple exception and sqlstate
DO
$$
DECLARE
  rec RECORD;
  v_length INTEGER = 90;
BEGIN
  SELECT film_id, title INTO STRICT rec FROM film WHERE length = v_length;
  EXCEPTION
    WHEN sqlstate 'P0002' THEN
      RAISE EXCEPTION 'film with length % not found', v_length;
    WHEN sqlstate 'P0003' THEN
      RAISE EXCEPTION 'The film with length % is not unique', v_length;
END
$$
LANGUAGE plpgsql;
