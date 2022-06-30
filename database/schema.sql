CREATE DATABASE catalog_of_things;

CREATE TABLE label(
 id INTEGER GENERATED PRIMARY KEY,
 title VARCHAR(50),
 color VARCHAR(50)
);

CREATE TABLE book(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  publisher VARCHAR(50),
  cover_state VARCHAR(15),
  publish_date DATE,
  archived BOOLEAN,
  label_id  INT,
  FOREIGN KEY (label_id) REFERENCES label(id),
);

CREATE TABLE IF NOT EXISTS genre (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(80),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS musicalbum (
    id INT GENERATED ALWAYS AS IDENTITY,
    on_spotify BOOLEAN,
    publish_date DATE NOT NULL,
    archived BOOLEAN NOT NULL,
    genre_id INT,
    PRIMARY KEY(id),
    CONSTRAINT genre_id_fk FOREIGN KEY(genre_id) REFERENCES genre(id),
);
