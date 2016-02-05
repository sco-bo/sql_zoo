--SELECT from WORLD

--1. Observe the results of running a simple SQL command
SELECT name, continent, population
FROM world;

--2. Show the name for the countries that have a population of at 
	-- least 200 million
SELECT name
FROM world
WHERE population >= 200000000;

--3. Give the name and per capita GDP for those countries with a
	-- population of at least 200 million
SELECT name, gdp/population
FROM world
WHERE population >= 200000000;

--4. Show the name and population in millions for the countries 
	-- of the continent 'South America'
SELECT name, population/1000000
FROM world
WHERE continent = 'South America';

--5. Show the name and population for France, Germany, and Italy
SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy');

--6. Show the countries which have a name that includes the word 
	-- 'United'
SELECT name
FROM world
WHERE name LIKE '%United%'; 

--7. Show the name, population, and area for countries that have either 
	-- an area > 3 million sq. km. or a population > 250 million or both
SELECT name, population, area
FROM world
WHERE area > 3000000
	OR population > 250000000;

--8. Show the name, population, and area for countries that have either 
	-- an area > 3 million sq. km. or a population > 250 million
	-- but not both
SELECT name, population, area
FROM world
WHERE (area > 3000000 AND population < 250000000)
	OR (population > 250000000 AND area < 3000000);

--9. Show the name and population in millions and the GDP in billions
	-- for the countries of 'South America'. Round to two decimal places
SELECT name,
	ROUND(population/1000000, 2),
	ROUND(gdp/1000000000, 2)
FROM world
WHERE continent = 'South America'; 

--10. Show the per-capita GDP for those countries with a GDP of at
	-- least one trillion. Round to the nearest 1,000
SELECT name, 
	ROUND(gdp/population, -3)
FROM world
WHERE gdp >= 1000000000000; 

--11. Show the name - but substitute Australasia for Oceania - for
	-- countries beginning with an N
SELECT name,  
	CASE WHEN continent = 'Oceania' THEN 'Australasia'
		ELSE continent END
FROM world
WHERE name LIKE 'N%';

--12. Show the name and the continent - but substitute Eurasia for 
	-- Europe and Asia; substitute America - for each country in 
	-- North America or South America or Caribbean. Show countries 
	-- beginning with A or B
SELECT name, 
	CASE continent
		WHEN 'Europe' THEN 'Eurasia'
		WHEN 'Asia' THEN 'Eurasia'
		WHEN 'North America' THEN 'America'
		WHEN 'South America' THEN 'America'
		WHEN 'Caribbean' THEN 'America'
		ELSE continent
	END
FROM world
WHERE name LIKE 'A%'
	OR name LIKE 'B%';

--13. Put the continents right. Oceania becomes 'Australasia', 
	-- countries in Eurasia and Turkey become 'Europe/Asia', Caribbean
	-- islands starting with a 'B' go to North America while all other
	-- Caribbean islands go to South America. Show the name of the
	-- original continent and the new continent
SELECT name, continent, 
	CASE 
		WHEN continent = 'Oceania' THEN 'Australasia'
		WHEN continent IN ('Eurasia', 'Turkey') THEN 'Europe/Asia'
		WHEN continent = 'Caribbean' AND name LIKE 'B%' THEN 'North America'
		WHEN continent = 'Caribbean' THEN 'South America'
		ELSE continent 
	END AS new_continent
FROM world
ORDER BY name;

-- Quiz
1. E 
2. D 
3. B 
4. D 
5. B 
6. D 
7. C 












