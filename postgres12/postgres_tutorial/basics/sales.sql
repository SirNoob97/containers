DROP TABLE IF EXISTS sales;
CREATE TABLE sales(
  brand VARCHAR NOT NULL,
  segment VARCHAR NOT NULL,
  quantity INT NOT NULL,
  PRIMARY KEY(brand, segment)
);

INSERT INTO sales(brand, segment, quantity) VALUES('ABC', 'Premium', 100);
INSERT INTO sales(brand, segment, quantity) VALUES('ABC', 'Basic', 200);
INSERT INTO sales(brand, segment, quantity) VALUES('XYZ', 'Premium', 100);
INSERT INTO sales(brand, segment, quantity) VALUES('XYZ', 'Basic', 300);
