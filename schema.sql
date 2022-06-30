CREATE DATABASE catalog_of_my_things;

CREATE TABLE movie (
  id SERIAL PRIMARY KEY,
  silet BOOLEAN
);

CREATE TABLE source (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50)	
);