--SELECT basics

--1. Show the population of Germany
SELECT population  
FROM world 
WHERE name = 'Germany';

--2. Show the name and per capita gdp (gdp/population) for each country
	-- where the area is over 5,000,000 km2
SELECT name, gdp/population 
FROM world
WHERE area > 5000000;

--3. Show the name and population for 'Ireland', 'Iceland', and 
	-- 'Denmark'
SELECT name, population
FROM world
WHERE name IN ('Ireland', 'Iceland', 'Denmark');

--4. Show the country and the area for countries with an area between
	-- 200,000 and 250,000 sq. km. 
SELECT name, area
FROM world
WHERE area BETWEEN 200000 AND 250000;

-- Quiz
1. C 
2. E 
3. E 
4. C 
5. C 
6. C
7. C 