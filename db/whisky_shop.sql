DROP TABLE stock_items;
DROP TABLE suppliers;

CREATE TABLE suppliers
(
  id serial8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  telephone INT8 NOT NULL
);

CREATE TABLE stock_items
(
  id serial8 PRIMARY KEY,
  name VARCHAR(255),
  supplier_id INT8 REFERENCES suppliers(id),
  quantity INT4,
  style VARCHAR(255),
  low_level INT4,
  high_level INT4,
);
