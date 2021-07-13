-- copying data types
/*
do $$
  declare
    film_title film.title % type;
    featured_title film_title % type;
begin
  select title from film into film_title where film_id = 100;
  raise notice 'First title id 100: %', film_title;
end
$$ language plpgsql;
*/

-- 2 variables in block and subblock
/*
do $$
  <<outer_block>>
declare
  counter integer := 0;
begin
  counter := counter + 1;
  raise notice 'The current value of the counter is %', counter;

declare
  counter integer := 0;
begin
  counter := counter + 10;
  raise notice 'Counter in the subblock is %', counter;
  raise notice 'Counter in the outer block is %', outer_block.counter;
end;

  counter := counter + 1;
  raise notice 'Counter in the outer block is %', counter;
end outer_block
$$ language plpgsql;
*/

-- 3 row type variables
/*
do $$
declare
  selected_actor actor%rowtype;
begin
  select * from actor into selected_actor where actor_id = 10;
  raise notice 'The actor name is % %', selected_actor.first_name, selected_actor.last_name;
end
$$ language plpgsql;
*/

-- 4 records
/*
do $$
declare
  rec record;
begin
  select film_id, title, length into rec from film where film_id = 200;
  raise notice '% % %', rec.film_id, rec.title, rec.length;
end
$$ language plpgsql;
*/
/*
do $$
declare
  rec record;
begin
  for rec in select title, length from film where length > 50 order by length
  loop
    raise notice '% (%)', rec.title, rec.length;
  end loop;
end
$$ language plpgsql;
*/

-- 5 constans
do $$
declare
  start_at constant time := now();
  vat constant numeric := 0.1;
  net_price numeric := 20.5;
begin
  raise notice 'Start executing block at %', start_at;
  raise notice 'The selling price is %', net_price * (1 + vat);
end
$$ language plpgsql;
