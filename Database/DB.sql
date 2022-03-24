create database dorm;
drop database dorm;

create table `account`
(username varchar(255) primary key,
`password` varchar(255));

create table roll
(role_id int auto_increment primary key,
role_name varchar(255));

create table account_roll
(role_id int,
user_name varchar(255),
foreign key(role_id) references roll(role_id),
foreign key(user_name) references `account`(`username`)
);

create table manager
(manager_id int auto_increment primary key,
full_name varchar(50) not null,
email varchar(50) not null,
phone char(10) unique check(phone like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
username varchar(255),
foreign key(username) references `account`(username)
);

Create table student
(student_id int auto_increment primary key,
first_name varchar(50) not null,
last_name varchar(15) not null,
email varchar(50) not null,
phone varchar(10) not null,
gender varchar(5) not null,
manager_id int, 
username varchar(255),
foreign key(username) references `account`(username),
foreign key(manager_id) references manager(manager_id));

create table floor
(name_floor char(4) primary key check(name_floor LIKE '[A-F]'),
manager_id int,
price double,
people_number int check(people_number between 1 and 4),
foreign key(manager_id) references manager(manager_id)
);

create table room
(room_id CHAR(5) PRIMARY KEY CHECK(room_id LIKE '[A-F][1-5][0-9][0-9][0-9]' OR room_id LIKE '[A-F][1-5][0-9][0-9][0-9][0-9]'),
gender varchar(10) not null,
`status` varchar(20),
name_floor char(4),
number_bed int check(number_bed between 1 and 4),
foreign key(name_floor) references floor(name_floor)
);

create table item
(item_id int auto_increment primary key,
`name` varchar(20) not null,
`status` varchar(20)
);

create table fix_detail
(room_id char(5), 
item_id int,
fixer varchar(30),
date_report datetime not null,
date_fix datetime not null,
`status` varchar(20),
price double,
primary key(room_id,item_id),
foreign key(room_id) references room(room_id),
foreign key(item_id) references item(item_id)
);

create table penalize
(penalize_id int auto_increment primary key,
penalize_name varchar(20) not null,
kind_punishment varchar(20) not null
);

create table student_penalize
(student_id int,
penalize_id int,
`date` datetime,
`type` varchar(20),
primary key(student_id,penalize_id),
foreign key(student_id) references student(student_id),
foreign key(penalize_id) references penalize(penalize_id)
);

