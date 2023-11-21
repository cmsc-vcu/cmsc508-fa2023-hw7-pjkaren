# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS peopleroles;
# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
    skills_id int not null,
    skills_name varchar(255) not null,
    skills_description varchar(255) not null,
    skills_tag varchar(255) not null,
    skills_url varchar(255),
    skills_time_commitment int,
    primary key (skills_id)
);



show tables;
select * from skills;

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills (skills_id, skills_name, skills_description, skills_tag) values
    (1,'kick boxing', 'kicking as well as punching', 'Skill 1'),
    (2,'python coding', 'writing python programs', 'Skill 2'),
    (3,'snowboarding', 'shredding it up in the mountains', 'Skill 3'),
    (4,'skiing', 'cold, fast, and dangerous', 'Skill 4'),
    (5,'drawing', 'not your average doodle', 'Skill 5'),
    (6,'jumping', 'look at the legs on this guy', 'Skill 6'),
    (7,'yelling', 'theres an art to loud', 'Skill 7'),
    (8,'yodeling', 'yelling of the mountainous variety', 'Skill 8');



select * from skills;

# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    people_id int not null,
    first_name varchar(255),
    last_name varchar(255) NOT NULL,
    email varchar(255),
    linkedin_url varchar(255),
    headshot_url varchar(255),
    discord_handle varchar(255),
    brief_bio varchar(255),
    date_joined date not null,
    PRIMARY KEY (people_id)
);

show tables;
select * from people;

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

insert into people (people_id,first_name, last_name, date_joined) values 
    (1,Yugi ,'Person 1','2023-10-15'),
    (2,Kaiba ,'Person 2','2010-01-13'),
    (3,Pegasus ,'Person 3','2020-10-03'),
    (4,Henry ,'Person 4','2016-08-26'),
    (5,Barbara ,'Person 5','2021-02-14'),
    (6,Nobunaga ,'Person 6','2019-12-25');


# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

create table peopleskills( 
    ps_id int not null auto_increment,
    skills_id int NOT NULL,
    people_id int NOT NULL,
    date_acquired date not null,
    primary key (ps_id)
);

# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

INSERT INTO peopleskills (skills_id, people_id, date_acquired) values
    (1, 1, '2017-01-15'), (1, 1, '2020-06-10'), (1, 1, '2018-02-18'),
    (2, 3, '2019-02-22'), (2, 4, '2019-03-01'), (2, 5, '2019-03-25'),
    (3, 1, '2020-03-28'), (3, 5, '2018-04-05'),
    (5, 3, '2017-05-10'), (5, 6, '2021-10-05'),
    (6, 2, '2018-06-15'), (6, 3, '2022-10-10'), (6, 4, '2022-10-08'),
    (7, 3, '2017-07-12'), (7, 5, '2021-10-25'), (7, 6, '2023-11-15'),
    (8, 1, '2019-08-15'), (8, 3, '2023-12-03'), (8, 5, '2020-05-10'), (8, 6, '2018-03-10'),
    (9, 2, '2022-09-20'), (9, 5, '2016-01-28'), (9, 6, '2020-10-20'),
    (10, 1, '2023-10-20'), (10, 4, '2018-12-20'), (10, 5, '2022-12-10');
 

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

create table roles (
    role_id int not null,
    role_name varchar(255) NOT NULL,
    sort_priority int not null,
    primary key (role_id)
);

show tables;
select * from roles;

# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles (role_id, role_name, sort_priority) values
    (1, 'Designer', 10),
    (2, 'Developer', 20),
    (3, 'Recruit', 30),
    (4, 'Team Lead', 40),
    (5, 'Boss', 50),
    (6, 'Mentor', 60);


# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

create table peopleroles (
    pr_id int not null auto_increment,
    people_id int not null,
    role_id int not null,
    date_assigned date not null,
    primary key (pr_id)
);

show tables;
select * from peopleroles;

# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO peopleroles (people_id, role_id, date_assigned) values
    (1, 20, '2018-01-01'),
	(2, 50, '2020-02-01'), (2, 60, '2019-11-01'),
	(3, 20, '2021-03-01'), (3, 40, '2018-01-02'),
	(4, 30, '2019-04-01'),
	(5, 30, '2017-05-01'),
	(6, 20, '2022-06-01'), (6, 10, '2019-05-03'),
	(7, 10, '2020-07-01'),
	(8, 10, '2018-08-01'), (8, 40, '2021-10-17'),
	(9, 20, '2017-09-01'),
	(10, 20, '2023-10-01'), (10, 10, '2017-11-11');
