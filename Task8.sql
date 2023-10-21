SELECT CASE WHEN height < 190 THEN 1
            WHEN 190 <= height AND height < 200 THEN 2
            ELSE 3 END
              AS height_class,
       count(*) AS amount_players
FROM player
GROUP BY height_class
ORDER BY height_class;

-- SELECT NULL AS height_class,
--        count(*) AS amount_players
-- FROM player
-- UNION
-- SELECT CASE WHEN height < 190 THEN 1
--               WHEN 190 <= height AND height < 200 THEN 2
--               ELSE 3 END
--               AS height_class,
--        count(*)
-- FROM player
-- GROUP BY height_class
-- ORDER BY height_class NULLS FIRST;

SELECT CASE WHEN height < 190 THEN 1
            WHEN 190 <= height AND height < 200 THEN 2
            ELSE 3 END
              AS height_class,
       count(*) AS amount_players
FROM player
GROUP BY
    GROUPING SETS (
        (),
        (height_class)
    )
ORDER BY height_class NULLS FIRST;

SELECT position,
       team.name AS team_name,
       count(*) AS amount_players,
       GROUPING(position, team.name) AS "group"
FROM player
JOIN team ON team.id = player.team_id
GROUP BY
    GROUPING SETS (
        (position, team.name),
        (position),
        ()
    )
ORDER BY "group", position, team_name;

-- WITH query AS (
--     SELECT DISTINCT salary
--     FROM player
--     WHERE position = 'защитник'
--     ORDER BY salary
-- )
-- SELECT row_number() OVER () AS ranking,
--        name,
--        salary
-- FROM query;

SELECT dense_rank() OVER (ORDER BY salary) AS ranking,
       name, salary
FROM player
WHERE position = 'защитник'
ORDER BY ranking, name;

WITH high_salary_difference_teams AS (
    SELECT team.id AS id, team.name AS name
    FROM team
    JOIN player ON team.id = player.team_id
    GROUP BY team.id, team.name
    HAVING max(salary) - min(salary) > 150000
)
SELECT hsdt.name AS name,
       position
FROM high_salary_difference_teams hsdt
JOIN player ON hsdt.id = player.team_id
GROUP BY hsdt.name, position
HAVING count(*) > 1;

SELECT team.name AS name,
       position
FROM team
JOIN player ON team.id = player.team_id
GROUP BY team.name, position
HAVING count(*) > 1 AND max(salary) - min(salary) > 150000;