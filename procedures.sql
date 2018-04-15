SELECT *
FROM daMovieStore.movie;

SELECT *
FROM daMovieStore.movielog;

-- This is used to drop all the stored procedures:

DROP PROCEDURE IF EXISTS BuyMovie;

DROP PROCEDURE IF EXISTS UpdateMovie;

DROP PROCEDURE IF EXISTS CountMovies;

DROP PROCEDURE IF EXISTS SellMovie;

-- Here you can find commands used to call the different stored stored procedures:

CALL BuyMovie('Hej', 'Rupert Sanders', 'action', 'In the near future, Major is the first of her kind: A human saved from a terrible crash, who is cyber-enhanced to be a perfect soldier devoted to stopping the world''s most dangerous criminals.', '63-674-4326-5', 336,
              'available', 1);

CALL UpdateMovie('Logan - The Wolverine','unavailable');

CALL CountMovies('Action', @total);
SELECT @total;

CALL SellMovie('It');

-- Stored procedure is used to insert data into the database

DELIMITER //
CREATE PROCEDURE BuyMovie(
  IN varMovieTitle       VARCHAR(50),
  IN vardirector      VARCHAR(50),
  IN varMovieGenre    VARCHAR(50),
  IN varMovieDescription VARCHAR(250),
  IN varSerialNumber    VARCHAR(50),
  IN varMoviePrice       INT,
  IN varMovieStatus      VARCHAR(50),
  IN varMovieGenreId  INT)
  BEGIN

    INSERT INTO daMovieStore.movie (movieTitle, director, movieGenre, movieDescription, serialNumber, moviePrice, movieStatus, movieGenreId)
    VALUES
      (varMovieTitle, vardirector, varMovieGenre, varMovieDescription, varSerialNumber, varMoviePrice, varMovieStatus,
       varMovieGenreId);
  END //




-- Store procudre is used to see all the movies that belongs to a specified category.
DELIMITER //
CREATE PROCEDURE UpdateMovie(IN varMovie VARCHAR(50), IN varStatus VARCHAR(50))
  BEGIN
    DECLARE status VARCHAR(50) DEFAULT 'available';
    IF varStatus <> status THEN
      UPDATE movie SET movieStatus = varStatus WHERE movieTitle = varMovie;
    END IF;
  END //





-- With ths stored procedure it'spossible to count how many movies that belongs to each genre.

DELIMITER //
CREATE PROCEDURE CountMovies
  (IN  Genre VARCHAR(50),
   OUT total INT)
  BEGIN
    SELECT count(*)
    INTO total
    FROM Genre
      INNER JOIN movie
        ON Genre.GenreId = movie.movieGenreId
    WHERE  movie.movieGenre = Genre;
  END//




-- Sälja bok

DELIMITER //
CREATE PROCEDURE SellMovie(IN movie VARCHAR(50))
  BEGIN
    DELETE FROM daMovieStore.movie
    WHERE movieTitle = movie;
  END //
