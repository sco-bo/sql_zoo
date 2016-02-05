--SELECT within SELECT

--1. List each country name where the population is larger than that of
	-- Russia
SELECT name  
FROM  world
WHERE population >
	(SELECT population FROM world
	 WHERE name = 'Russia');

--2. Show the countries in Europe with a per capita GDP greater than UK
SELECT name
FROM world
WHERE continent = 'Europe' AND gdp/population >
	(SELECT gdp/population FROM world WHERE name = 'United Kingdom');

--3. List the name and continent of countries in the continents 
	-- containing either Argentina or Australia. Order by name of country
SELECT name, continent
FROM world
WHERE continent IN 
	(SELECT continent FROM world WHERE name = 'Argentina'
	 OR name = 'Australia')
ORDER BY name;

--4. Which country has a population that is more than Canada but less
	-- Poland? Show the name and the population
SELECT name, population
FROM world
WHERE population > (SELECT population FROM world WHERE name = 'Canada') 
	AND population < (SELECT population FROM world WHERE name = 'Poland');

--5. Show the name and population of each country in Europe. Show the
	-- population as a percentage of the population of Germany
SELECT name, CONCAT(ROUND((population/(SELECT population FROM world WHERE name = 'Germany') * 100), 0), '%')
FROM world
WHERE continent = 'Europe';

--6. Which countries have a GDP greater than every country in Europe? 
SELECT name
FROM world
WHERE gdp > ALL(SELECT gdp 
				FROM world 
				WHERE continent = 'Europe' 
				AND gdp>0);

--7. Find the largest country (by area) in each continent, show the
	-- continent, the name and area
SELECT continent, name, area
FROM world x
WHERE area >= ALL(SELECT area 
				 FROM world y 
				 WHERE x.continent = y.continent
				 AND area>0); 

--8. List each continent and the name of the country that comes first 
	-- alphabetically
SELECT continent, name
FROM world x
WHERE x.name <= ALL(SELECT name
					FROM world y 
					WHERE x.continent = y.continent);

--9. Find the continents where all countries have a population 
	-- <= 25000000. Then find the names of the countries associated with 
	-- these continents. Show name, continent and population
SELECT name, continent, population
FROM world x
WHERE 25000000 >= ALL(SELECT population
					   FROM world y
					   WHERE x.continent = y.continent
					   AND y.population>0);

--10. Some countries have populations more than three times that of any 
	-- of their neighbors (in the same continent). Give said countries 
	-- and continents.
SELECT name, continent
FROM world x
WHERE population >= ALL(SELECT population * 3
						FROM world y 
						WHERE x.continent = y.continent
						AND x.name != y.name);

-- Quiz
1. C 
2. B 
3. A 
4. C --(Answer is D, although it presumes Russia is in Europe)
5. B 
6. B 
7. C --(Answer is B)







