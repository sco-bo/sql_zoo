--More JOIN operations

--1. Show the id, and title for the films where the yr is 1962
SELECT id, title
FROM movie 
WHERE yr = 1962;

--2. Give the year of 'Citizen Kane'
SELECT yr
FROM movie
WHERE title = 'Citizen Kane';

--3. List all of the Star Trek movies, include the id, title and yr 
	-- (all of these movies include the words Star Trek in the title). 
	-- Order results by year.
SELECT id, title, yr 
FROM movie
WHERE title LIKE 'Star Trek%'
ORDER BY yr;

--4. What are the titles of the films with id 11768, 11955, 21191
SELECT title
FROM movie
WHERE id IN (11768, 11955, 21191);

--5. What id number does the actress 'Glenn Close' have?
SELECT id 
FROM actor 
WHERE name = 'Glenn Close';

--6. What is the id of the film 'Casablanca'
SELECT id 
FROM movie
WHERE title = 'Casablanca';

--7. Obtain the cast list for 'Casablanca'
SELECT name 
FROM actor
JOIN casting ON casting.actorid = actor.id 
WHERE movieid = 11768;

--8. Obtain the cast list for 'Alien'
SELECT name 
FROM actor
JOIN casting ON casting.actorid = actor.id 
WHERE movieid = (SELECT id FROM movie WHERE title = 'Alien');

--9. List the films in which 'Harrison Ford' has appeared
SELECT title
FROM movie
JOIN casting ON movie.id = casting.movieid
WHERE actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford');

--10. List the films where 'Harrison Ford' has appeared - but not in the 
	-- starring role
SELECT title
FROM movie
JOIN casting ON movie.id = casting.movieid
WHERE actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford')
	AND ord != 1;

--11. List the films together with the leading star for all 1962 films
SELECT title, name
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON actor.id = casting.actorid
WHERE yr = 1962 
	AND ord = 1;

--12. Which were the busiest years for 'John Travolta', show the year and
	-- the number of movies he made each year for any year in which he 
	-- made more than 2 movies
SELECT yr, COUNT(title) 
FROM movie 
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE name='John Travolta'
GROUP BY yr
HAVING COUNT(title) > 2;

--13. List the film title and the leading actor for all of the films
	-- 'Julie Andrews' played in
SELECT title, name 
FROM casting
JOIN movie ON movie.id = casting.movieid
JOIN actor ON actor.id = casting.actorid
WHERE ord = 1 
	AND movie.id IN 
	(SELECT movie.id 
	 FROM movie
	 JOIN casting ON movie.id = casting.movieid
	 JOIN actor ON actor.id = casting.actorid
	 WHERE actor.name = 'Julie Andrews');

--14. Obtain a list, in alphabetical order, of actors who've had at
	-- least 30 starring roles
SELECT DISTINCT name
FROM casting
JOIN movie ON movie.id = casting.movieid
JOIN actor ON actor.id = casting.actorid
WHERE actorid IN (
	SELECT actorid
	FROM casting
	WHERE ord = 1 
	GROUP BY actorid
	HAVING COUNT(actorid) >= 30)
ORDER BY name ASC;

--15. List the films released in the year 1978 ordered by the number of
-- actors in the cast
SELECT title, COUNT(actorid) as actor_count
FROM casting
JOIN movie ON casting.movieid = movie.id 
WHERE yr = 1978
GROUP BY movieid
ORDER BY actor_count DESC; 

--16. List all the people who have worked with 'Art Garfunkel'
SELECT DISTINCT name
FROM casting
JOIN actor ON casting.actorid = actor.id 
WHERE name != 'Art Garfunkel'
	AND movieid IN (
		SELECT movieid
		FROM movie
		JOIN casting ON casting.movieid = movie.id
		JOIN actor ON casting.actorid = actor.id
		WHERE actor.name = 'Art Garfunkel'
		); 

--Quiz 
1. E (Answer is C)
2. E 
3. C 
4. B 
5. D 
6. C 
7. B 






