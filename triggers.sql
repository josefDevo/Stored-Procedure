-- The triggers is used to log when a new movie is inserted into the database.

DELIMITER //
CREATE TRIGGER triggnsertmovie
AFTER INSERT ON daMovieStore.movie
FOR EACH ROW
  BEGIN
    IF EXISTS(SELECT *
              FROM daMovieStore.movielog
              WHERE movieLogSerialNumber = NEW.serialNumber)
    THEN UPDATE daMovieStore.movielog
    SET movieLogDate = NOW()
    WHERE movieLogSerialNumber = NEW.serialNumber;
    ELSE
      INSERT INTO daMovieStore.movielog
      (movieLogSerialNumber,
       movieLogTitle,
       movieLogDirector,
       movieLogGenre,
       movieLogDate,
       movieLogStatus)
      VALUES (NEW.serialNumber, NEW.movieTitle, NEW.director, NEW.movieGenre, NOW(), 'available');
    END IF;
  END//



-- This trigger is used to log when movies is sold.

DELIMITER //
CREATE TRIGGER triggSellMovie
BEFORE DELETE ON daMovieStore.movie
FOR EACH ROW
  BEGIN
    IF EXISTS(SELECT *
              FROM daMovieStore.movielog
              WHERE movieLogSerialNumber = OLD.serialNumber)
    THEN UPDATE daMovieStore.movielog
    SET movieLogDate = NOW(), movieLogStatus = 'unavailable'
    WHERE movieLogSerialNumber = OLD.serialNumber;
    END IF;
  END //
