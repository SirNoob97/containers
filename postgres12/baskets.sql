CREATE TABLE basket_a (
  a INT PRIMARY KEY,
  fruit_a VARCHAR(100) NOT NULL
);

CREATE TABLE basket_b (
  b INT PRIMARY KEY,
  fruit_b VARCHAR(100) NOT NULL
);

INSERT INTO basket_a (a, fruit_a) values(1, 'Apple');
INSERT INTO basket_a (a, fruit_a) values(2, 'Orange');
INSERT INTO basket_a (a, fruit_a) values(3, 'Banana');
INSERT INTO basket_a (a, fruit_a) values(4, 'Cucuber');

INSERT INTO basket_b (b, fruit_b) values(1, 'Orange');
INSERT INTO basket_b (b, fruit_b) values(2, 'Apple');
INSERT INTO basket_b (b, fruit_b) values(3, 'Watermelon');
INSERT INTO basket_b (b, fruit_b) values(4, 'Pear');
