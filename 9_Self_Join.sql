SELECT count(id)
FROM stops;

SELECT id
FROM stops
WHERE name = 'Craiglockhart';

SELECT
  s.id,
  s.name
FROM
  route r
  JOIN stops s ON r.stop = s.id
WHERE
  r.num = '4'
  AND company = 'lrt';

SELECT
  company,
  num,
  COUNT(*)
FROM
  route
WHERE
  STOP = 149
  OR STOP = 53
GROUP BY
  company,
  num
HAVING
  COUNT(*) = 2;

SELECT
  a.company,
  a.num,
  a.stop,
  b.stop
FROM
  route a
  JOIN route b O (
    a.company = b.company
    AND a.num = b.num
  )
WHERE
  a.stop =(
    SELECT
      id
    FROM
      stops
    WHERE
      name = 'Craiglockhart'
  )
  AND b.stop =(
    SELECT
      id
    FROM
      stops
    WHERE
      name = 'London Road'
  );

SELECT
  a.company,
  a.num,
  stopa.name,
  stopb.name
FROM
  route a
  JOIN route b ON (
    a.company = b.company
    AND a.num = b.num
  )
  JOIN stops stopa ON (a.stop = stopa.id)
  JOIN stops stopb ON (b.stop = stopb.id)
WHERE
  stopa.name = 'Craiglockhart'
  AND stopb.name = 'London Road';

SELECT
  DISTINCT a.company,
  a.num
FROM
  route a
  JOIN route b ON (
    a.company = b.company
    AND a.num = b.num
  )
  JOIN stops stopa ON (a.stop = stopa.id)
  JOIN stops stopb ON (b.stop = stopb.id)
WHERE
  stopa.name = 'Haymarket'
  AND stopb.name = 'Leith';

SELECT
  DISTINCT a.company,
  a.num
FROM
  route a
  JOIN route b ON (
    a.company = b.company
    AND a.num = b.num
  )
  JOIN stops stopa ON (a.stop = stopa.id)
  JOIN stops stopb ON (b.stop = stopb.id)
WHERE
  stopa.name = 'Craiglockhart'
  AND stopb.name = 'Tollcross';

SELECT
  DISTINCT stopb.name,
  a.company,
  a.num
FROM
  route a
  JOIN route b ON (
    a.company = b.company
    AND a.num = b.num
  )
  JOIN stops stopa ON (a.stop = stopa.id)
  JOIN stops stopb ON (b.stop = stopb.id)
WHERE
  stopa.name = 'Craiglockhart';

SELECT
  DISTINCT a.num,
  a.company,
  stopb.name,
  c.num,
  c.company
FROM
  route a
  JOIN route b ON (
    a.company = b.company
    AND a.num = b.num
  )
  JOIN (
    route c
    JOIN route d ON (
      c.company = d.company
      AND c.num = d.num
    )
  )
  JOIN stops stopa ON (a.stop = stopa.id)
  JOIN stops stopb ON (b.stop = stopb.id)
  JOIN stops stopc ON (c.stop = stopc.id)
  JOIN stops stopd ON (d.stop = stopd.id)
WHERE
  stopa.name = 'Craiglockhart'
  AND stopd.name = 'Lochend'
  AND stopb.name = stopc.name;