DROP TABLE pets CASCADE;
DROP TABLE pet_stores CASCADE;

CREATE TABLE pet_stores (
  id SERIAL4 primary key,
  name VARCHAR(255),
  address VARCHAR(255),
  stock_type VARCHAR(255)
);

CREATE TABLE pets (
  id SERIAL4 primary key,
  name VARCHAR(255),
  type VARCHAR(255),
  image VARCHAR(255),
  pet_store_id INT4 REFERENCES pet_stores(id) ON DELETE CASCADE
);