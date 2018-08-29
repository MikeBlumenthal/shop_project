DROP TABLE stock;
DROP TABLE distilleries;
DROP TABLE suppliers;

CREATE TABLE distilleries
(
  id serial8 PRIMARY KEY,
  name VARCHAR(255),
  location VARCHAR(255),
  established INT4
);

CREATE TABLE suppliers
(
  id serial8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  telephone VARCHAR(255),
  email VARCHAR(255)
);

CREATE TABLE stock
(
  id serial8 PRIMARY KEY,
  name VARCHAR(255),
  distillery_id INT8 REFERENCES distilleries(id),
  supplier_id INT8 REFERENCES suppliers(id),
  quantity INT4,
  style VARCHAR(255),
  low_level INT4,
  cost_price NUMERIC,
  sale_price NUMERIC
)
