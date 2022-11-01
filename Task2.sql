SELECT * FROM arena WHERE size > 9000;

SELECT * FROM player WHERE position IN ('защитник', 'форвард');

SELECT * FROM player WHERE position IN ('защитник', 'форвард') AND salary BETWEEN 240000 AND 260000;

SELECT * FROM player WHERE height > 215 OR weight > 120;

SELECT * FROM team WHERE city IN ('Барселона', 'Москва') AND coach_name = 'Димитрис Итудис';
