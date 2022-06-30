CREATE TABLE games (
  id INT GENERATED ALWAYS AS IDENTITY,
  multiplayer VARCHAR(100) NOT NULL,
  last_played_at DATE NOT NULL,
  publish_date DATE,
  genre_id INT,
  author_id INT,
  source_id INT,
  label_id INT,
  archived BOOLEAN,
  PRIMARY KEY (id)
  FOREIGN KEY (genre_id) REFERENCES genres (id),
  FOREIGN KEY (author_id) REFERENCES authors (id)
  FOREIGN KEY (source_id) REFERENCES sources (id)
  FOREIGN KEY (label_id) REFERENCES labels (id)
);

CREATE TABLE authors (
  id INT GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);