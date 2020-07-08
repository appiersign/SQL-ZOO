SELECT name 
FROM world
WHERE name 
LIKE 'Y%';

SELECT name 
FROM world
WHERE name 
LIKE '%y';

SELECT name 
FROM world
WHERE name 
LIKE '%x%';

SELECT name 
FROM world
WHERE name 
LIKE '%land';

SELECT name 
FROM world
WHERE name 
LIKE 'C%ia';

SELECT name 
FROM world
WHERE name 
LIKE '%oo%';

SELECT name 
FROM world
WHERE LENGTH(name) - LENGTH(REPLACE(LOWER(name), 'a', '')) > 2;

SELECT name 
FROM world
WHERE name 
LIKE '_t%'
ORDER BY name;

SELECT name 
FROM world
WHERE name 
LIKE '%o__o%';

SELECT name 
FROM world
WHERE LENGTH(name) 
LIKE 4;

SELECT name
FROM world
WHERE name = capital;

SELECT name
FROM world
WHERE capital = CONCAT(name, ' City');

SELECT capital, name
FROM world
WHERE capital 
LIKE CONCAT(CONCAT('%', name), '%');

SELECT capital, name
FROM world
WHERE REPLACE(capital, name, '') != capital 
AND LENGTH(name) != LENGTH(capital);

SELECT name, REPLACE(capital, name, '') as ext
FROM world
WHERE REPLACE(capital, name, '') != capital 
AND LENGTH(name) != LENGTH(capital);
