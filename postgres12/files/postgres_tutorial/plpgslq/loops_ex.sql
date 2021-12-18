-- LOOP
DO $$
DECLARE
  n INTEGER := 10;
  fib INTEGER := 0;
  counter INTEGER := 0;
  i INTEGER := 0;
  j INTEGER := 1;
BEGIN
  IF(n < 1) THEN
    fib := 0;
  END IF;
  LOOP
    EXIT WHEN counter = n;
    counter := counter + 1;
    SELECT j, i + j INTO i, j;
  END LOOP;
  fib := i;
  RAISE NOTICE '%', fib;
END
$$ LANGUAGE plpgsql;

-- WHILE
DO $$
DECLARE
  counter INTEGER := 0;
BEGIN
  WHILE counter < 5 LOOP
    RAISE NOTICE 'Counter %', counter;
    counter := counter + 1;
  END LOOP;
END
$$ LANGUAGE plpgsql;

-- FOR
DO $$
BEGIN
  FOR counter IN 1..5 LOOP
    RAISE NOTICE 'Counter: %', counter;
  END LOOP;
END
$$ LANGUAGE plpgsql;

DO $$
BEGIN
  FOR counter IN REVERSE 5..1 LOOP
    RAISE NOTICE 'Counter: %', counter;
  END LOOP;
END
$$ LANGUAGE plpgsql;

DO $$
BEGIN
  FOR counter IN 1..6 BY 2 LOOP
    RAISE NOTICE 'Counter: %', counter;
  END LOOP;
END
$$ LANGUAGE plpgsql;

DO $$
DECLARE
  f RECORD;
BEGIN
  FOR f IN SELECT title, length FROM film ORDER BY length DESC, title LIMIT 10 LOOP
    RAISE NOTICE '%(% mins)', f.title, f.length;
  END LOOP;
END
$$ LANGUAGE plpgsql;

DO $$
DECLARE
  sort_type SMALLINT := 2;
  rec_count INT := 10;
  rec RECORD;
  query TEXT;
BEGIN
  query := 'SELECT title, release_year FROM film ';
  IF sort_type = 1 THEN
    query := query || 'ORDER BY title';
  ELSEIF sort_type = 2 THEN
    query := query || 'ORDER BY release_year';
  ELSE
    RAISE 'invalid sort type %s', sort_type;
  END IF;

  query := query || ' LIMIT $1';

  FOR rec IN EXECUTE query USING rec_count LOOP
    RAISE NOTICE '% - %', rec.release_year, rec.title;
  END LOOP;
END
$$ LANGUAGE plpgsql;
