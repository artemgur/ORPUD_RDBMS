SELECT team.city AS city_name, team.name AS team_name, arena.name AS arena_name
    FROM team
    JOIN arena ON arena.id = team.arena_id
    WHERE arena.size > 10000
    ORDER BY city_name DESC;

SELECT owner_team.name AS owner_team,
       guest_team.name AS guest_team,
       CASE WHEN game.winner_team_id = game.owner_team_id THEN owner_team.name
           ELSE guest_team.name END AS winner_team,
        score,
        arena.name AS arena_name
    FROM game
    JOIN arena ON arena.id = game.arena_id
    JOIN team owner_team ON owner_team.id = game.owner_team_id
    JOIN team guest_team ON guest_team.id = game.guest_team_id
    ORDER BY owner_team, guest_team;

SELECT arena.name AS arena_name,
       coalesce(game_date::text, 'игра не проводилась') AS game_date
    FROM arena
    LEFT JOIN game ON arena.id = game.arena_id
    ORDER BY arena_name, game_date;

SELECT name AS team_name, city FROM team
    WHERE city IN (
        SELECT city FROM team
            GROUP BY city
            HAVING count(city) > 1
        )
    ORDER BY team_name;

SELECT name FROM arena
    WHERE id IN (SELECT arena_id FROM game)
    ORDER BY name;

WITH large_arenas AS (
    SELECT id, name FROM arena
        WHERE size > 10000
)
SELECT team.city AS city_name, team.name AS team_name, large_arenas.name AS arena_name
    FROM team
    JOIN large_arenas ON large_arenas.id = team.arena_id
    ORDER BY city_name DESC;

