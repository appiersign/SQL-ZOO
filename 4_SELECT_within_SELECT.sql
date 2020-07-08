SELECT name FROM world
WHERE population >
(SELECT population FROM world
WHERE name='Russia');

SELECT name FROM world
WHERE continent='Europe'
AND gdp/population > (
SELECT gdp/population FROM  world WHERE name='United Kingdom'
);

SELECT name, continent FROM world
WHERE continent IN(
SELECT continent FROM world WHERE name IN('Argentina', 'Australia')
)
ORDER BY name;

SELECT name FROM world
WHERE population < (
SELECT population FROM world WHERE name='Poland'
)
AND population > (
SELECT population FROM world WHERE name='Canada'
);

SELECT name, CONCAT(ROUND(population/(SELECT population FROM world where name='Germany') * 100), '%') as percentage FROM world
WHERE continent='Europe';

SELECT name FROM world WHERE gdp >
ALL (
SELECT gdp FROM world WHERE continent='Europe' AND gdp > 0
);

SELECT continent, name, area FROM world x
WHERE area >= ALL
(SELECT area FROM world y
WHERE y.area>x.area
AND y.continent=x.continent
);

SELECT continent, name FROM world x WHERE continent = ALL (
SELECT continent FROM world y WHERE x.continent=y.continent
) GROUP BY x.continent;
