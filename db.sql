create table tournaments (
    tournament_id int primary key,
    tournament_name varchar(100) not null,
    start_date date not null,
    end_date date not null,
    status varchar(20) not null
);

create table players (
    player_id int primary key,
    full_name varchar(100) not null,
    date_of_birth date not null,
    position varchar(50) not null,
    team_id int,
    jersey_number int,
    foreign key (team_id) references teams(team_id)
);

create table football_clubs (
    club_id int primary key,
    club_name varchar(100) not null,
    city varchar(100) not null,
    country varchar(100) not null,
    founded_year int
);

create table teams (
    team_id int primary key,
    team_name varchar(100) not null,
    club_id int,
    group_id int,
    coach_name varchar(100),
    foreign key (club_id) references football_clubs(club_id),
    foreign key (group_id) references tournament_groups(group_id)
);

create table tournament_groups (
    group_id int primary key,
    group_name varchar(100) not null,
    tournament_id int,
    created_at timestamp,
    foreign key (tournament_id) references tournaments(tournament_id)
);

create table match_fixtures (
    match_id int primary key,
    match_date timestamp not null,
    venue varchar(100),
    home_team_id int,
    away_team_id int,
    home_score int,
    away_score int,
    tournament_id int,
    match_status varchar(20),
    foreign key (home_team_id) references teams(team_id),
    foreign key (away_team_id) references teams(team_id),
    foreign key (tournament_id) references tournaments(tournament_id)
);









create table type_practice (
    id serial primary key,
    full_name varchar(100) not null,
    age int check (age > 0),
    salary numeric(10,2),
    is_active boolean default true,
    birth_date date,
    created_at timestamp default now(),
    login_time time,
    ip_address inet,
    mac_address macaddr,
    doc bytea,
    data_json json,
    tags text[],
    unique_code uuid default gen_random_uuid()
);

insert into type_practice (full_name, age, salary, is_active, birth_date, login_time, ip_address, mac_address, data_json, tags)
values
('ali valiyev', 25, 1200.50, true, '2000-05-10', '08:30:00', '192.168.1.10', '08:00:27:12:34:56', '{"lang":"uz","level":"beginner"}', array['postgres','sql','practice']),
('dilnoza karimova', 30, 2500.00, false, '1995-03-22', '09:45:00', '10.0.0.1', 'aa:bb:cc:dd:ee:ff', '{"lang":"en","level":"intermediate"}', array['coding','database']);






