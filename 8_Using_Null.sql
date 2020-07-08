SELECT name
FROM teacher
WHERE dept IS NULL;

SELECT teacher.name, dept.name
FROM teacher
         INNER JOIN dept
                    ON (teacher.dept = dept.id);

SELECT teacher.name, dept.name
FROM teacher
         LEFT JOIN dept
                   ON (teacher.dept = dept.id);

SELECT teacher.name, dept.name
FROM teacher
         RIGHT JOIN dept
                    ON (teacher.dept = dept.id);

SELECT name, COALESCE(mobile, '07986 444 2266')
FROM teacher;

SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher
         LEFT JOIN dept ON dept = dept.id;

SELECT COUNT(name), COUNT(mobile)
FROM teacher;

SELECT dept.name, count(teacher.id)
FROM dept
         LEFT JOIN teacher ON dept.id = teacher.dept
GROUP BY dept.name;

SELECT name, IF(dept IN (1, 2), 'Sci', 'Art')
FROM teacher;

SELECT name, CASE WHEN dept IN (1, 2) THEN 'Sci' WHEN dept = 3 THEN 'Art' ELSE 'None' END
FROM teacher;