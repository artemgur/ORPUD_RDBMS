CREATE TABLE player_defender AS
    SELECT * FROM player WHERE position = 'защитник';
SELECT * FROM player_defender ORDER BY id;

UPDATE player_defender SET salary = salary * 0.87; -- 0.87 = 1 - 0.13
SELECT * FROM player_defender ORDER BY id;

DELETE FROM player_defender WHERE salary < 100000 AND weight = 85;
SELECT * FROM player_defender ORDER BY id;

INSERT INTO player_defender
    SELECT id, name, position, height, weight, salary * 0.87, team_id FROM player
    WHERE position = 'центровой';
SELECT * FROM player_defender ORDER BY id;

SELECT player.name AS player_name, team.name AS team_name, arena.name AS arena_name
    FROM player
    JOIN team ON player.team_id = team.id
    JOIN arena ON arena.id = team.arena_id
    ORDER BY player_name, team_name;

CREATE TABLE player_generator AS
    WITH numbered_names AS (
        SELECT name, row_number() OVER () AS row_number
        FROM player
    ), random_numbers AS (
        SELECT floor(random() * (SELECT count(*) FROM player)) + 1 AS random_number
        FROM generate_series(1, 10000)
    )
    SELECT name FROM random_numbers
        JOIN numbered_names ON random_numbers.random_number = numbered_names.row_number;
SELECT count(*) FROM player_generator;
SELECT count(name)
FROM player_generator
GROUP BY name;


