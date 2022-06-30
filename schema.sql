CREATE TABLE authors (
  id INT GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE games (
  id INT GENERATED ALWAYS AS IDENTITY,
  multiplayer VARCHAR(100) NOT NULL,
  last_played_at DATE NOT NULL,
  publish_date DATE,
  author_id INT,
  archived BOOLEAN,
  PRIMARY KEY (id)
  FOREIGN KEY (author_id) REFERENCES authors (id)
);

CREATE DATABASE catalog_of_my_things;

CREATE TABLE movie (
  id INT GENERATED ALWAYS AS IDENTITY,
  silet BOOLEAN,
  PRIMARY KEY(id)
);

CREATE TABLE source (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(50),
  PRIMARY KEY(id)	
);
