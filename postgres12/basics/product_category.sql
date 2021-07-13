-- dont use in dvdrental database
DROP TABLE IF EXISTS category;
CREATE TABLE category(
  category_id serial PRIMARY KEY,
  category_name VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS product;
CREATE TABLE product(
  product_id serial PRIMARY KEY,
  product_name VARCHAR(255) NOT NULL,
  category_id INT NOT NULL,
  FOREIGN KEY (category_id) REFERENCES category(category_id)
);

INSERT INTO category(category_name) VALUES('Smart Phone');
INSERT INTO category(category_name) VALUES('Laptop');
INSERT INTO category(category_name) VALUES('Tablet');

INSERT INTO product(product_name, category_id) VALUES('iPhone', 1);
INSERT INTO product(product_name, category_id) VALUES('Samsung Galaxy', 1);
INSERT INTO product(product_name, category_id) VALUES('HP Elite', 2);
INSERT INTO product(product_name, category_id) VALUES('Lenovo Thinkpad', 2);
INSERT INTO product(product_name, category_id) VALUES('iPad', 3);
INSERT INTO product(product_name, category_id) VALUES('Kindle Fire', 3);
