DROP TABLE IF EXISTS product_segment;
CREATE TABLE product_segment(
  id SERIAL PRIMARY KEY,
  segment VARCHAR NOT NULL,
  discount NUMERIC(4, 2)
);

DROP TABLE IF EXISTS product;
CREATE TABLE product(
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  price NUMERIC(10, 2),
  net_price NUMERIC(10, 2),
  segment_id INT NOT NULL,
  FOREIGN KEY(segment_id) REFERENCES product_segment(id)
);

INSERT INTO product_segment(segment, discount) VALUES('Grand Luxury', 0.05);
INSERT INTO product_segment(segment, discount) VALUES('Luxury', 0.06);
INSERT INTO product_segment(segment, discount) VALUES('Mass', 0.1);

INSERT INTO product(name, price, segment_id) VALUES('diam', 804.89, 1);
INSERT INTO product(name, price, segment_id) VALUES('vestibulum aliquet', 228.55, 3);
INSERT INTO product(name, price, segment_id) VALUES('lacinia erat', 366.45, 2);
INSERT INTO product(name, price, segment_id) VALUES('scelerisque quam turpis', 145.33, 3);
INSERT INTO product(name, price, segment_id) VALUES('justo lacinia', 551.77, 2);
INSERT INTO product(name, price, segment_id) VALUES('ultrices mattis odio', 261.58, 3);
INSERT INTO product(name, price, segment_id) VALUES('hendrerit', 519.62, 2);
INSERT INTO product(name, price, segment_id) VALUES('in hac habitasse', 843.31, 1);
INSERT INTO product(name, price, segment_id) VALUES('orci eget orci', 254.18, 3);
INSERT INTO product(name, price, segment_id) VALUES('pellentesque', 427.78, 2);
INSERT INTO product(name, price, segment_id) VALUES('sit amet nunc', 936.29, 1);
INSERT INTO product(name, price, segment_id) VALUES('sed vestibulum', 910.34, 1);
INSERT INTO product(name, price, segment_id) VALUES('turpis eget', 208.33, 3);
INSERT INTO product(name, price, segment_id) VALUES('cursus vestibulum', 985.45, 1);
INSERT INTO product(name, price, segment_id) VALUES('orci nullam', 841.26, 1);
INSERT INTO product(name, price, segment_id) VALUES('est quam pharetra', 896.38, 1);
INSERT INTO product(name, price, segment_id) VALUES('posuere', 575.74, 2);
INSERT INTO product(name, price, segment_id) VALUES('ligula', 530.64, 2);
INSERT INTO product(name, price, segment_id) VALUES('convallis', 892.43, 1);
INSERT INTO product(name, price, segment_id) VALUES('nulla elit ac', 161.71, 3);
