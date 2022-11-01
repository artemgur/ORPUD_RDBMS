SELECT name FROM team
UNION
SELECT name FROM arena
ORDER BY name DESC;

SELECT name, 'команда' AS object_type FROM team
UNION
SELECT name, 'стадион' FROM arena
ORDER BY object_type DESC, name;

SELECT name, salary FROM player
ORDER BY
    CASE WHEN salary = 475000 THEN -1
    ELSE salary END
LIMIT 5;

INSERT INTO team
    SELECT 60, 'Москва', 'СКА', 'Петр Иванов', arena_id
    FROM team
    WHERE name = 'ЦСКА';
SELECT * FROM team;
DELETE FROM team WHERE name = 'СКА';

SELECT id FROM arena
EXCEPT
SELECT id FROM game
UNION
(SELECT id FROM game
EXCEPT
SELECT id FROM arena)
ORDER BY id;

WITH intersect_table AS (
    SELECT count(*) AS intersect_count FROM (
        SELECT id FROM arena
        INTERSECT
        SELECT id FROM game
    ) intersect_rows
), union_table AS (
    SELECT count(*) AS union_count FROM (
        SELECT id FROM arena
        UNION
        SELECT id FROM game
    ) union_rows
)
SELECT intersect_count::float / union_count AS val
FROM intersect_table, union_table;
