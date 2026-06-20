CREATE DATABASE movie

USE movie

CREATE TABLE actor(
act_id INT IDENTITY PRIMARY KEY,
act_fname CHAR(20),
act_lname CHAR(20),
act_gender CHAR(1)
);

CREATE TABLE movie(
mov_id INT IDENTITY PRIMARY KEY,
mov_title CHAR(50),
mov_year INT,
mov_time INT,
mov_lang CHAR(50),
mov_dt_rel DATE,
mov_rel_country CHAR(5)
);

CREATE TABLE movie_cast (
    act_id  INTEGER ,
    mov_id  INTEGER ,
    [role]    CHAR(30),
    PRIMARY KEY (act_id, mov_id),
    FOREIGN KEY (act_id) REFERENCES actor(act_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
);
CREATE TABLE director(
dir_id INT IDENTITY PRIMARY KEY,
dir_fname CHAR(20),
dir_lname CHAR(20)
);

CREATE TABLE movie_direction(
dir_id INT REFERENCES director(dir_id) ,
mov_id INT REFERENCES movie(mov_id),
PRIMARY KEY(dir_id, mov_id)
);

CREATE TABLE reviewer(
rev_id INT IDENTITY PRIMARY KEY,
rev_name CHAR(30)
);

CREATE TABLE rating(
mov_id INT REFERENCES movie(mov_id) ,
rev_id INT REFERENCES reviewer(rev_id),
rev_stars INT,
num_o_ratings INT,
PRIMARY KEY(mov_id, rev_id)
);

CREATE TABLE genres(
gen_id INT IDENTITY PRIMARY KEY,
gen_title CHAR(20)
);

CREATE TABLE movie_genres(
mov_id INT REFERENCES movie(mov_id),
gen_id INT REFERENCES genres(gen_id),
PRIMARY KEY(mov_id, gen_id)
);
