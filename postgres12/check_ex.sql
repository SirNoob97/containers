DROP TABLE IF EXISTS employess_check;
CREATE TABLE employess_check(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  birth_date DATE CHECK(birth_date > '1900-01-01'),
  joined_date DATE CHECK(joined_date > birth_date),
  salary NUMERIC CHECK(salary > 0)
);

DROP TABLE IF EXISTS prices_list;
CREATE TABLE prices_list(
  id SERIAL PRIMARY KEY,
  product_id INT NOT NULL,
  price NUMERIC NOT NULL,
  discount NUMERIC NOT NULL,
  valid_from DATE NOT NULL,
  valid_to DATE NOT NULL
);
