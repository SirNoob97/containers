do $$
declare
  film_count integer;
begin
  select count(*) into film_count from film;

  raise notice 'Count: %', film_count;

  assert film_count > 0, 'Film not found, check the film table';

  -- this will fail
  assert film_count > 1000, '1000 Film found, check the film table';
end
$$ language plpgsql;
