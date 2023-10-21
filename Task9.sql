CREATE TABLE users (
    id serial PRIMARY KEY,
    name text,
    surname text,
    patronymic text,
    phone char(11),
    email text,
    passport_series char(4),
    passport_number char(6)
);

INSERT INTO users VALUES (DEFAULT, 'Иван', 'Иванов', 'Иванович', '89171231285', 'ivanov@mail.ru', '9525', '370318'),
                         (DEFAULT, 'Петр', 'Петров', 'Петрович', '89877255823', 'gwewwhgs@gmail.com', '9728', '829269'),
                         (DEFAULT, 'Алексей', 'Захаров', 'Андреевич', '89006528201', 'erhhasa23@mail.ru', '9134', '902479'),
                         (DEFAULT, 'Екатерина', 'Сидорова', 'Александровна', '89247367282', 'htrjtew@gmail.com', '9820', '179359'),
                         (DEFAULT, 'Елена', 'Осипова', 'Григорьевна', '89826308271', 'etnetn@mail.ru', '9148', '285379');

SELECT * FROM users;

CREATE TABLE personnel (
    id serial PRIMARY KEY,
    name text,
    surname text,
    patronymic text,
    phone char(11),
    email text,
    passport_series char(4),
    passport_number char(6),
    position text,
    superior int
);

INSERT INTO personnel VALUES (1, 'Иван', 'Иванов', 'Иванович', '89171231285', 'ivanov@mail.ru', '9525', '370318', 'Директор', null),
                             (2, 'Петр', 'Петров', 'Петрович', '89877255823', 'gwewwhgs@gmail.com', '9728', '829269', 'Начальник отдела маркетинга', 1),
                             (3, 'Алексей', 'Захаров', 'Андреевич', '89006528201', 'erhhasa23@mail.ru', '9134', '902479', 'Заместитель начальника отдела маркетинга', 2),
                             (4, 'Екатерина', 'Сидорова', 'Александровна', '89247367282', 'htrjtew@gmail.com', '9820', '179359', 'Главный бухгалтер', 1),
                             (5, 'Елена', 'Осипова', 'Григорьевна', '89826308271', 'etnetn@mail.ru', '9148', '285379', 'Секретарь', 1);

SELECT * FROM personnel;