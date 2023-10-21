SELECT avg(height) AS avg_height,
       min(height) AS min_height,
       max(height) AS max_height,
       sum(salary) AS total_salary
FROM player;

SELECT position,
       round(avg(height), 2) AS avg_height,
       min(height) AS min_height,
       max(height) AS max_height,
       sum(salary) AS total_salary
FROM player
GROUP BY position
ORDER BY position;

SELECT name, count(*) AS count_wins
FROM team
    JOIN game ON team.id = game.winner_team_id
GROUP BY name
ORDER BY count_wins DESC;
SELECT name, count(winner_team_id) AS count_wins
FROM team
    LEFT JOIN game ON team.id = game.winner_team_id
GROUP BY name
ORDER BY count_wins DESC;

SELECT city FROM team
GROUP BY city
HAVING count(city) > 1;

WITH query AS (
    SELECT owner_team.name AS owner_team,
           guest_team.name AS guest_team,
           CASE WHEN game.winner_team_id = game.owner_team_id
               THEN owner_team.name
               ELSE guest_team.name END AS winner_team
    FROM game
    JOIN team owner_team ON owner_team.id = game.owner_team_id
    JOIN team guest_team ON guest_team.id = game.guest_team_id
    ORDER BY owner_team, guest_team
)
SELECT row_number() OVER () AS rownum,
       owner_team, guest_team, winner_team
FROM query;

SELECT sum(split_part(score, ':', 1)::int
        + split_part(score, ':', 2)::int)
            AS total_points,
       winner_team.name AS name
FROM game
JOIN team winner_team ON winner_team.id = game.winner_team_id
GROUP BY name
ORDER BY total_points;


