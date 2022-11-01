SELECT name, position FROM player
WHERE height BETWEEN 188 AND 200
  AND salary BETWEEN 100000 AND 150000
ORDER BY name DESC;

SELECT 'город: ' || city || '; команда: ' || name || '; тренер: '
           || coach_name AS "полная инфрмация"
FROM team
ORDER BY "полная инфрмация";

SELECT name, size FROM arena
WHERE id IN (10, 30, 50)
ORDER BY size, name;

SELECT name, size FROM arena
WHERE id NOT IN (10, 30, 50)
ORDER BY size, name;

SELECT name AS "имя игрока", position AS "позиция на площадке" FROM player
WHERE height BETWEEN 188 AND 220
  AND position IN ('защитник', 'центровой')
ORDER BY position DESC, name DESC;
