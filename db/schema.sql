DROP DATABASE IF EXISTS teapots_dev
CREATE DATABASE teapots_dev

\c teapots_dev

CREATE TABLE teapots (
  id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  image TEXT NOT NULL,
  price INTEGER NOT NULL,
  description VARCHAR(200),
  material TEXT,
  capacity INTEGER
);

CREATE TABLE reviews (
  id SERIAL PRIMARY KEY,
  reviewer VARCHAR(40) NOT NULL,
  content VARCHAR(500),
  rating NUMERIC
  CHECK(rating >= 1 AND rating <= 5),
  created_at TIMESTAMP,
  teapot_id INTEGER REFERENCES teapots(id)
  ON DELETE CASCADE
);