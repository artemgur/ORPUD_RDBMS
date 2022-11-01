create table arena
(
    id bigint primary key ,
    name varchar not null ,
    size integer not null  default 100
);

insert into arena(id, name, size) values (10, 'Палау Блауграна',8250);
insert into arena(id, name, size) values (20, 'Визинк-Центр - Паласио де Депортес',15500);
insert into arena(id, name, size) values (30, 'УСК ЦСКА им. А.Я. Гомельского',5000);
insert into arena(id, name, size) values (40, 'Пис энд Френдшип Стадиум',12000);
insert into arena(id, name, size) values (50, 'СИБУР Арена',7140);

create table team
(
    id bigint primary key ,
    city varchar not null ,
    name varchar not null ,
    coach_name varchar not null,
    arena_id bigint not null,
    constraint fk_arena_id foreign key (arena_id) references arena(id)
);

insert into team(id, city, name, coach_name, arena_id) values (10, 'Барселона','Барселона','Шарунас Ясикявичюс',10);
insert into team(id, city, name, coach_name, arena_id) values (20, 'Мадрид','Реал Мадрид','Пабло Ласо',20);
insert into team(id, city, name, coach_name, arena_id) values (30, 'Москва','ЦСКА','Димитрис Итудис',30);
insert into team(id, city, name, coach_name, arena_id) values (40, 'Пирей','Олимпиакос','Георгиос Барцокас',40);
insert into team(id, city, name, coach_name, arena_id) values (50, 'Санкт-Петербург','Зенит','Хавьер Паскуаль',50);

create table player
(
    id bigint primary key ,
    name varchar not null,
    position varchar not null ,
    height numeric not null  check ( height >0 ),
    weight numeric not null  check ( weight >0 ),
    salary numeric check ( salary > 0 ),
    team_id bigint not null ,
    constraint fk_team_id foreign key (team_id) references team(id)
);

insert into player(id, name, position, height, weight, salary, team_id) values (10,'Рафа Вильяр','защитник',188,85, 100000,10);
insert into player(id, name, position, height, weight, salary, team_id) values (20,'Кайл Курич','защитник',193,85, 100000,10);
insert into player(id, name, position, height, weight, salary, team_id) values (30,'Ибу Дьянко Баджи','центровой',211,103, 200000,10);
insert into player(id, name, position, height, weight, salary, team_id) values (40,'Ник Калатес','разыгрывающий',198,97, 150000,10);
insert into player(id, name, position, height, weight, salary, team_id) values (50,'Никола Миротич','форвард',208,107, 175000,10);

insert into player(id, name, position, height, weight, salary, team_id) values (60,'Джейси Кэрролл','защитник',188,82, 175000,20);
insert into player(id, name, position, height, weight, salary, team_id) values (70,'Эли Джон Ндиайе','центровой',203,110, 275000,20);
insert into player(id, name, position, height, weight, salary, team_id) values (80,'Уолтер Тавареш','центровой',220,120, 273000,20);
insert into player(id, name, position, height, weight, salary, team_id) values (90,'Томас Давид Эртель','разыгрывающий',189,88, 173000,20);
insert into player(id, name, position, height, weight, salary, team_id) values (100,'Гершон Ябуселе','форвард',203,118, 99000,20);

insert into player(id, name, position, height, weight, salary, team_id) values (110,'Габриэль Иффе Лундберг','защитник',193,96, 101000,30);
insert into player(id, name, position, height, weight, salary, team_id) values (120,'Юрий Умрихин','защитник',190,75, 251000,30);
insert into player(id, name, position, height, weight, salary, team_id) values (130,'Иван Анатольевич Ухов','разыгрывающий',193,77, 175000,30);
insert into player(id, name, position, height, weight, salary, team_id) values (140,'Александр Хоменко','разыгрывающий',192,85, 375000,30);
insert into player(id, name, position, height, weight, salary, team_id) values (150,'Андрей Лопатин','лёгкий форвард',208,92, 205000,30);

insert into player(id, name, position, height, weight, salary, team_id) values (160,'Тайлер Дорси','защитник',193,83, 205000,40);
insert into player(id, name, position, height, weight, salary, team_id) values (170,'Яннулис Ларенцакис','защитник',196,87, 75000,40);
insert into player(id, name, position, height, weight, salary, team_id) values (180,'Хассан Мартин','центровой',201,107, 375000,40);
insert into player(id, name, position, height, weight, salary, team_id) values (190,'Михалис Лунцис','разыгрывающий',195,90, 475000,40);
insert into player(id, name, position, height, weight, salary, team_id) values (200,'Георгиос Принтезис','форвард',205,104, 105000,40);

insert into player(id, name, position, height, weight, salary, team_id) values (210,'Билли Джеймс Бэрон','защитник',188,88, 75000,50);
insert into player(id, name, position, height, weight, salary, team_id) values (220,'Артурас Гудайтис','центровой',208,99, 165000,50);
insert into player(id, name, position, height, weight, salary, team_id) values (230,'Денис Захаров','разыгрывающий',192,88, 163000,50);
insert into player(id, name, position, height, weight, salary, team_id) values (240,'Миндаугас Кузминскас','лёгкий форвард',204,93, 295000,50);
insert into player(id, name, position, height, weight, salary, team_id) values (250,'Алекс Пойтресс','форвард',201,108, 247000,50);

create table game
(
    id bigint primary key ,
    owner_team_id bigint not null ,
    guest_team_id bigint not null ,
    game_date date not null ,
    winner_team_id bigint not null,
    score varchar not null ,
    arena_id bigint not null ,
    constraint fk_owner_team_id foreign key (owner_team_id) references team(id),
    constraint fk_guest_team_id foreign key (guest_team_id) references team(id),
    constraint fk_winner_team_id foreign key (winner_team_id) references team(id),
    constraint fk_arena_id foreign key (arena_id) references arena(id)
);

insert into game(id, owner_team_id, guest_team_id, game_date, winner_team_id, score, arena_id) VALUES (10,10,50,'2021-10-22',10,'84:58',10);
insert into game(id, owner_team_id, guest_team_id, game_date, winner_team_id, score, arena_id) VALUES (20,10,30,'2021-11-17',10,'81:73',10);
insert into game(id, owner_team_id, guest_team_id, game_date, winner_team_id, score, arena_id) VALUES (30,10,20,'2021-10-12',10,'93:80',10);
insert into game(id, owner_team_id, guest_team_id, game_date, winner_team_id, score, arena_id) VALUES (40,10,40,'2021-10-15',10,'83:68',10);

insert into game(id, owner_team_id, guest_team_id, game_date, winner_team_id, score, arena_id) VALUES (50,50,20,'2021-12-15',20,'68:75',50);
insert into game(id, owner_team_id, guest_team_id, game_date, winner_team_id, score, arena_id) VALUES (60,50,30,'2022-01-15',30,'77:67',50);
insert into game(id, owner_team_id, guest_team_id, game_date, winner_team_id, score, arena_id) VALUES (70,50,40,'2022-10-20',50,'84:78',50);

insert into game(id, owner_team_id, guest_team_id, game_date, winner_team_id, score, arena_id) VALUES (80,20,30,'2021-10-28',20,'71:65',20);
insert into game(id, owner_team_id, guest_team_id, game_date, winner_team_id, score, arena_id) VALUES (90,20,40,'2022-02-01',20,'75:67',20);

insert into game(id, owner_team_id, guest_team_id, game_date, winner_team_id, score, arena_id) VALUES (100,30,40,'2022-02-02',30,'79:78',30);
