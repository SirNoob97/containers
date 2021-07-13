-- copyINg data types
DO $$
  DECLARE
    film_title film.title%TYPE;
    featured_title film_title%TYPE;
BEGIN
  SELECT title FROM film INTO film_title WHERE film_id = 100;
  RAISE NOTICE 'First title id 100: %', film_title;
END
$$ LANGUAGE plpgsql;

-- 2 variables IN block and subblock
DO $$
  <<outer_block>>
DECLARE
  counter INTEGER := 0;
BEGIN
  counter := counter + 1;
  RAISE NOTICE 'The current value of the counter is %', counter;

DECLARE
  counter INTEGER := 0;
BEGIN
  counter := counter + 10;
  RAISE NOTICE 'Counter IN the subblock is %', counter;
  RAISE NOTICE 'Counter IN the outer block is %', outer_block.counter;
END;

  counter := counter + 1;
  RAISE NOTICE 'Counter IN the outer block is %', counter;
END outer_block
$$ LANGUAGE plpgsql;

-- 3 row type variables
DO $$
DECLARE
  selected_actor actor%ROWTYPE;
BEGIN
  select * FROM actor INTO selected_actor WHERE actor_id = 10;
  RAISE NOTICE 'The actor name is % %', selected_actor.first_name, selected_actor.last_name;
END
$$ LANGUAGE plpgsql;

-- 4 RECORDs
DO $$
DECLARE
  rec RECORD;
BEGIN
  select film_id, title, length INTO rec FROM film WHERE film_id = 200;
  RAISE NOTICE '% % %', rec.film_id, rec.title, rec.length;
END
$$ LANGUAGE plpgsql;

DO $$
DECLARE
  rec RECORD;
BEGIN
  FOR rec IN select title, length FROM film WHERE length > 50 ORDER BY length
  LOOP
    RAISE NOTICE '% (%)', rec.title, rec.length;
  END LOOP;
END
$$ LANGUAGE plpgsql;

-- 5 constans
DO $$
DECLARE
  start_at constant TIME := NOW();
  vat constant NUMERIC := 0.1;
  net_price NUMERIC := 20.5;
BEGIN
  RAISE NOTICE 'Start executINg block at %', start_at;
  RAISE NOTICE 'The sellINg price is %', net_price * (1 + vat);
END
$$ LANGUAGE plpgsql;
