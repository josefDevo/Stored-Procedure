DROP SCHEMA IF EXISTS daMovieStore;

CREATE SCHEMA IF NOT EXISTS daMovieStore;
USE daMovieStore;

DROP TABLE IF EXISTS Genre;
CREATE TABLE Genre (
  GenreId   INT NOT NULL AUTO_INCREMENT,
  GenreName VARCHAR(50),
  PRIMARY KEY (GenreId)
);

DROP TABLE IF EXISTS movie;
CREATE TABLE movie (
  movieId          INT NOT NULL AUTO_INCREMENT,
  serialNumber     VARCHAR(50),
  movieTitle       VARCHAR(50),
  director         VARCHAR(50),
  movieGenre       VARCHAR(50),
  movieDescription VARCHAR(250),
  moviePrice       INT,
  movieStatus      VARCHAR(50),

  movieGenreId     INT,
  PRIMARY KEY (movieId),
  FOREIGN KEY (movieGenreId) REFERENCES Genre (GenreId)
);


DROP TABLE IF EXISTS movieLog;
CREATE TABLE movieLog (
  movieLogId           INT NOT NULL AUTO_INCREMENT,
  movieLogSerialNumber VARCHAR(50),
  movieLogTitle        VARCHAR(50),
  movieLogDirector     VARCHAR(50),
  movieLogGenre        VARCHAR(50),
  movieLogDate         DATETIME,
  movieLogStatus       VARCHAR(50),
  PRIMARY KEY (movieLogId)


);

-- INNER JOIN

SELECT
  movie.movieTitle,
  Genre.GenreName
FROM Genre
  LEFT JOIN movie ON movie.movieGenreId = Genre.GenreId;

-- Test data
SELECT *
FROM movie;

SELECT *
FROM Genre;

-- VIEWS

CREATE VIEW viewMovieTitles AS
  SELECT movieTitle
  FROM movie;
SELECT *
FROM movie;

CREATE VIEW viewGenre AS
  SELECT GenreName
  FROM Genre;
SELECT *
FROM Genre;

CREATE VIEW viewMovielog AS
  SELECT movieLogTitle
  FROM movieLog;
SELECT *
FROM movieLog;


-- INDEX is used to speed up searches of the database.
CREATE INDEX indexTitles
  ON movie (movieTitle);

CREATE UNIQUE INDEX indexSerialNumber
  ON movie (serialNumber);
