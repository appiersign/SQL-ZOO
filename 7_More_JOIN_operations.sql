SELECT id, title
FROM movie
WHERE yr = 1962;

SELECT yr
FROM movie
WHERE title = 'Citizen Kane';

SELECT id, title, yr
FROM movie
WHERE title LIKE 'Star Trek%'
ORDER BY yr;

SELECT actorid
FROM casting
         JOIN movie ON (id = movieid)
         JOIN actor ON (actor.id = actorid)
WHERE actor.name = 'Glenn Close'
limit 1;

SELECT id
FROM movie
WHERE title = 'Casablanca';

SELECT actor.name
FROM actor
         JOIN casting ON (actorid = id)
WHERE movieid = 11768;

SELECT actor.name
FROM actor
         JOIN casting ON (actorid = actor.id)
         JOIN movie ON (casting.movieid = movie.id)
WHERE movie.title = 'Alien';

SELECT title
FROM movie
         JOIN casting ON (movieid = movie.id)
         JOIN actor ON (casting.actorid = actor.id)
WHERE name = 'Harrison Ford';

SELECT title
FROM movie
         JOIN casting ON (movieid = movie.id)
         JOIN actor ON (casting.actorid = actor.id)
WHERE name = 'Harrison Ford'
  AND casting.ord != 1;

SELECT title, actor.name
FROM movie
         JOIN casting ON (movieid = movie.id)
         JOIN actor ON (casting.actorid = actor.id)
WHERE movie.yr = 1962
  AND casting.ord = 1;

SELECT yr, COUNT(title)
FROM movie
         JOIN casting ON movie.id = movieid
         JOIN actor ON actorid = actor.id
WHERE name = 'Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;

SELECT movie.title, actor.name
FROM movie
         JOIN casting ON movie.id = movieid
         JOIN actor ON actor.id = actorid
WHERE movie.id IN (SELECT movieid FROM casting WHERE actorid = (SELECT id FROM actor WHERE name = 'Julie Andrews'))
  AND casting.ord = 1;

SELECT name
FROM actor
         JOIN casting ON casting.actorid = actor.id
WHERE casting.ord = 1
GROUP BY casting.actorid
HAVING COUNT(casting.actorid) >= 15
ORDER BY name;

SELECT title, COUNT(DISTINCT casting.actorid)
FROM movie
         JOIN casting ON casting.movieid = movie.id
WHERE yr = 1978
GROUP BY casting.movieid
ORDER BY COUNT(DISTINCT casting.actorid) DESC, title;