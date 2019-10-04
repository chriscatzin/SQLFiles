drop database if exists little_league;

create database little_league;
use little_league;

create table address
(
	address_id int auto_increment,
    street varchar(100) not null,
    city varchar(100) not null,
    state char(2) not null,
    zip_code char(5) not null,
    unique(street, city, state, zip_code),
    primary key (address_id)
);
alter table address auto_increment = 10000;

insert into address values(null, '2281  Sundown Lane', 'Austin', 'TX', '78749');
insert into address values(null, '2796  Highland View Drive', 'Dallas', 'TX', '75001');
insert into address values(null, '2746  Nelm Street', 'Dallas', 'TX', '75001');
insert into address values(null, '2609  Joyce Street', 'Austin', 'TX', '78749');
insert into address values(null, '2796  1156  Angie Drive', 'Dallas', 'TX', '75001');
insert into address values(null, '3920  Wood Street', 'Dallas', 'TX', '75001');

insert into address values(null, '198  Post Avenue', 'Dallas', 'TX', '75001');
insert into address values(null, '88  McKinley Avenue', 'Dallas', 'TX', '75001');
insert into address values(null, '9  Simpson Street', 'Dallas', 'TX', '75001');

#select * from address;



create table school 
(
	school_id int auto_increment,
    school_name varchar(100) not null,
    address_id int not null,
    primary key (school_id),
    foreign key (address_id) references address(address_id)
);
alter table school auto_increment = 10000;

insert into school values(null, 'Somerset Elementary', 10000);
insert into school values(null, 'East Dallas Middle School', 10001);
insert into school values(null, 'Willow Park Junior High', 10002);

#select * from school;


create table player
(
	player_id int auto_increment,
    first_name varchar(30) not null,
    last_name varchar(30) not null,
    date_of_birth date not null,
    player_number int,
    address_id int not null,
    school_id int,
    primary key (player_id),
    foreign key (address_id) references address(address_id),
    foreign key (school_id) references school(school_id)
);
alter table player auto_increment = 10000;

insert into player values(null, 'Nicholas', 'Hartmann', '2010-02-05', 45, 10003, 10000);
insert into player values(null, 'Christopher', 'Fava', '2008-05-19', 16, 10004, 10001);
insert into player values(null, 'Sidney', 'Reece', '2008-11-22', 3, 10005, 10001);
insert into player values(null, 'Michael', 'Rico', '2007-01-09', 23, 10006, 10001);
insert into player values(null, 'Russell', 'Cranston', '2008-10-13', 57, 10007, 10002);
insert into player values(null, 'Alexander', 'Kim', '2008-07-06', 29, 10008, 10002);

#select * from player;


create table guardian 
(
	guardian_id int auto_increment,
    first_name varchar(30) not null,
    last_name varchar(30) not null,
    phone char(10) not null,
    email varchar(100) not null,
    player_id int not null,
    primary key (guardian_id),
    foreign key (player_id) references player(player_id)
);
alter table guardian auto_increment = 10000;

insert into guardian values(null, 'Kendra', 'Hartmann', '4034581481', 'khartmann@gmail.com', 10000);
insert into guardian values(null, 'Steven', 'Hartmann', '4032124736', 'sh0005@gmail.com', 10000);
insert into guardian values(null, 'Dean', 'Fava', '8063202305', 'deanjfava@yahoo.com', 10001);
insert into guardian values(null, 'Wilson', 'Reece', '4702521782', 'will.reece@gmail.com', 10002);
insert into guardian values(null, 'Donald', 'Rico', '5708409568', 'ricos1234@gmail.com', 10003);
insert into guardian values(null, 'Marissa', 'Cranston', '2097709557', 'marissacranston@sonoralawoffice.com', 10004);
insert into guardian values(null, 'Mary', 'Kim', '7079383672', 'marykim001@yahoo.com', 10005);

#select * from guardian;


create table season
(
	season_id int auto_increment,
    season_start date not null,
    season_end date not null,
    primary key (season_id)
);
alter table season auto_increment = 10000;

insert into season values(null, '2019-03-01', '2019-07-05');
insert into season values(null, '2020-03-01', '2020-07-02');

#select * from season;



create table coach 
(
	coach_id int auto_increment,
    first_name varchar(30) not null,
    last_name varchar(30) not null,
    phone char(10) not null,
    email varchar(100) not null,
    primary key (coach_id)
);
alter table coach auto_increment = 10000;

insert into coach values(null, 'Keith', 'Barker', '3072586637', 'keith.barker@littleleague.org');
insert into coach values(null, 'Victor', 'Hackett', '5206500994', 'victor.hackett@littleleague.org');
insert into coach values(null, 'Ian', 'Fleming', '4132375686', 'ian.fleming@littleleague.org');

#select * from coach;


create table team 
(
	team_id int auto_increment,
    team_name varchar(100) not null,
    primary key (team_id)
);
alter table team auto_increment = 10000;

insert into team values(null, 'Austin City Bandits');
insert into team values(null, 'Dallas Devils');

#select * from team;



create table season_team
(
	season_team_id int auto_increment,
    season_id int not null,
    team_id int not null,
    coach_id int,
    primary key (season_team_id),
    foreign key (season_id) references season(season_id),
    foreign key (team_id) references team(team_id),
    foreign key (coach_id) references coach(coach_id)
);
alter table season_team auto_increment = 10000;

-- 2019 season
insert into season_team values(null, 10000, 10000, 10000);
insert into season_team values(null, 10000, 10001, 10001);

-- 2020 season
insert into season_team values(null, 10001, 10000, 10000);
insert into season_team values(null, 10001, 10001, 10002);

#select * from season_team;


create table registration
(
	registration_id int auto_increment,
    player_id int not null,
    season_team_id int not null,
    primary key (registration_id),
    foreign key (player_id) references player(player_id),
    foreign key (season_team_id) references season_team(season_team_id)
);
alter table registration auto_increment = 10000;

-- 2019 season
insert into registration values(null, 10000, 10000);
insert into registration values(null, 10001, 10001);
insert into registration values(null, 10002, 10001);
insert into registration values(null, 10003, 10001);
insert into registration values(null, 10004, 10001);
insert into registration values(null, 10005, 10001);

-- 2020 season
insert into registration values(null, 10000, 10002);
insert into registration values(null, 10001, 10003);
insert into registration values(null, 10002, 10003);
insert into registration values(null, 10003, 10003);
insert into registration values(null, 10004, 10003);
insert into registration values(null, 10005, 10003);

#select * from registration;





