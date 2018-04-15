-- I have implemented stored procedures to manage
-- a MySQL database. The database could be used by a store that sells movies.


INSERT INTO daMovieStore.Genre (GenreId, GenreName) VALUES
  (1, 'horror'),
  (2, 'science-fiction'),
  (3, 'action');


-- This script is used to populate the database.

INSERT INTO daMovieStore.movie (movieTitle, director,  movieGenre, movieDescription, serialNumber, moviePrice, movieStatus, movieGenreId) VALUES
  ('It', 'Andy Muschietti', 'horror', 'A group of bullied kids band together when a shapeshifting demon, taking the appearance of a clown, begins hunting children.', '12-123-1245-5', 346, 'available',
   1),
  ('Logan - The Wolverine', 'James Mangold', 'science-fiction', 'In the near future, a weary Logan cares for an ailing Professor X, somewhere on the Mexican border. However, Logan''s attempts to hide from the world, and his legacy, are upended when a young mutant arrives, pursued by dark forces.',
   '72-976-3456-3', 253, 'available', 2),
  ('Dunkirk', 'Christopher Nolan', 'action', 'Allied soldiers from Belgium, the British Empire and France are surrounded by the German Army, and evacuated during a fierce battle in World War II.',
   '43-456-9545-0', 523, 'available', 3);


INSERT INTO daMovieStore.movieLog (movieLogTitle, movieLogDirector, movieLogGenre ,movieLogDate, movieLogSerialNumber, movieLogStatus) VALUES
  ('It', 'Andy Muschietti', 'horror', NOW(), '12-123-1245-5', 'available'),
  ('Logan - The Wolverine', 'James Mangold', 'science-fiction', NOW(), '72-976-3456-3', 'available'),
  ('Dunkirk', 'Christopher Nolan', 'action', NOW(), '43-456-9545-0', 'available');
