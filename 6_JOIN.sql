SELECT matchid, player
FROM goal
WHERE teamid LIKE 'GER';

SELECT id,stadium,team1,team2
FROM game
WHERE id=1012;

SELECT player,teamid,stadium,mdate
FROM game JOIN goal ON (id=matchid)
WHERE teamid='GER';

SELECT team1, team2, player
FROM game join goal ON (id=matchid)
WHERE player LIKE 'Mario%';

SELECT player, teamid, coach, gtime
FROM goal JOIN eteam ON teamid=id
WHERE gtime<=10;

SELECT mdate, eteam.teamname
FROM game JOIN eteam ON (team1=eteam.id)
WHERE eteam.coach = 'Fernando Santos';

SELECT player
FROM goal JOIN game ON (matchid=id)
WHERE stadium = 'National Stadium, Warsaw';

SELECT distinct player
FROM game JOIN goal ON matchid = id
WHERE (teamid != 'GER') AND (team1!='GER' XOR team2 != 'GER');

SELECT teamname, count(teamname)
FROM eteam JOIN goal ON id=teamid
GROUP BY teamname;

SELECT stadium, count(stadium)
FROM game JOIN goal ON (matchid=id)
GROUP BY stadium;

SELECT matchid, mdate, count(matchid)
FROM game JOIN goal ON matchid = id
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid;

SELECT matchid, mdate, count(matchid)
FROM game JOIN goal ON (matchid=id)
WHERE teamid = 'GER'
GROUP BY matchid;

SELECT mdate, team1,SUM(IF(team1 = teamid, 1, 0)) score1, team2, SUM(IF(team2 = teamid, 1, 0)) score2
FROM game JOIN goal ON matchid = id
GROUP BY matchid, team1, team2
ORDER BY mdate, matchid, team1, team2;