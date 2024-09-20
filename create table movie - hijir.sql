-- create tables
CREATE TABLE IF NOT EXISTS actor (
    act_id INT PRIMARY KEY,
    act_fname VARCHAR,
    act_lname VARCHAR,
    act_gender VARCHAR
);

CREATE TABLE IF NOT EXISTS genres (
    gen_id INT PRIMARY KEY,
    gen_title VARCHAR
);

CREATE TABLE IF NOT EXISTS director (
    dir_id INT PRIMARY KEY,
    dir_fname VARCHAR,
    dir_lname VARCHAR
);

CREATE TABLE IF NOT EXISTS movie (
    mov_id INT PRIMARY KEY,
    mov_title VARCHAR,
    mov_year INT,
    mov_time INT,
    mov_lang VARCHAR,
    mov_dt_rel DATE,
    mov_rel_country VARCHAR
);

CREATE TABLE IF NOT EXISTS movie_genres (
    mov_id INT,
    gen_id INT,
    PRIMARY KEY (mov_id, gen_id)
);

CREATE TABLE IF NOT EXISTS movie_direction (
    dir_id INT,
    mov_id INT,
    PRIMARY KEY (dir_id, mov_id)
);

CREATE TABLE IF NOT EXISTS reviewer (
    rev_id INT PRIMARY KEY,
    rev_name VARCHAR
);

CREATE TABLE IF NOT EXISTS rating (
    mov_id INT,
    rev_id INT,
    rev_stars NUMERIC,
    num_o_ratings INT,
    PRIMARY KEY (mov_id, rev_id)
);

CREATE TABLE IF NOT EXISTS movie_cast (
    act_id INT,
    mov_id INT,
    role VARCHAR,
    PRIMARY KEY (act_id, mov_id)
);

-- insert data
INSERT INTO actor (act_id, act_fname, act_lname, act_gender) VALUES
(101, 'James', 'Stewart', 'M'),
(102, 'Deborah', 'Kerr', 'F'),
(103, 'Peter', 'OToole', 'M'),
(104, 'Robert', 'De Niro', 'M'),
(105, 'F. Murray', 'Abraham', 'M'),
(106, 'Harrison', 'Ford', 'M'),
(107, 'Nicole', 'Kidman', 'F'),
(108, 'Stephen', 'Baldwin', 'M'),
(109, 'Jack', 'Nicholson', 'M'),
(110, 'Mark', 'Wahlberg', 'M'),
(111, 'Woody', 'Allen', 'M'),
(112, 'Claire', 'Danes', 'F'),
(113, 'Tim', 'Robbins', 'M'),
(114, 'Kevin', 'Spacey', 'M'),
(115, 'Kate', 'Winslet', 'F'),
(116, 'Robin', 'Williams', 'M'),
(117, 'Jon', 'Voight', 'M'),
(118, 'Ewan', 'McGregor', 'M'),
(119, 'Christian', 'Bale', 'M'),
(120, 'Maggie', 'Gyllenhaal', 'F'),
(121, 'Dev', 'Patel', 'M'),
(122, 'Sigourney', 'Weaver', 'F'),
(123, 'David', 'Aston', 'M'),
(124, 'Ali', 'Astin', 'F');

INSERT INTO genres (gen_id, gen_title) VALUES
(1001, 'Action'),
(1002, 'Adventure'),
(1003, 'Animation'),
(1004, 'Biography'),
(1005, 'Comedy'),
(1006, 'Crime'),
(1007, 'Drama'),
(1008, 'Horror'),
(1009, 'Music'),
(1010, 'Mystery'),
(1011, 'Romance'),
(1012, 'Thriller'),
(1013, 'War');

INSERT INTO director (dir_id, dir_fname, dir_lname) VALUES
(201, 'Alfred', 'Hitchcock'),
(202, 'Jack', 'Clayton'),
(203, 'David', 'Lean'),
(204, 'Michael', 'Cimino'),
(205, 'Milos', 'Forman'),
(206, 'Ridley', 'Scott'),
(207, 'Stanley', 'Kubrick'),
(208, 'Bryan', 'Singer'),
(209, 'Roman', 'Polanski'),
(210, 'Paul', 'Thomas Anderson'),
(211, 'Woody', 'Allen'),
(212, 'Hayao', 'Miyazaki'),
(213, 'Frank', 'Darabont'),
(214, 'Sam', 'Mendes'),
(215, 'James', 'Cameron'),
(216, 'Gus', 'Van Sant'),
(217, 'John', 'Boorman'),
(218, 'Danny', 'Boyle'),
(219, 'Christopher', 'Nolan'),
(220, 'Richard', 'Kelly'),
(221, 'Kevin', 'Spacey'),
(222, 'Andrei', 'Tarkovsky'),
(223, 'Peter', 'Jackson');

INSERT INTO movie (mov_id, mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_rel_country) VALUES
(901, 'Vertigo', 1958, 128, 'English', '1958-08-24', 'UK'),
(902, 'The Innocents', 1961, 100, 'English', '1962-02-19', 'SW'),
(903, 'Lawrence of Arabia', 1962, 216, 'English', '1962-12-11', 'UK'),
(904, 'The Deer Hunter', 1978, 183, 'English', '1979-03-08', 'UK'),
(905, 'Amadeus', 1984, 160, 'English', '1985-01-07', 'UK'),
(906, 'Blade Runner', 1982, 117, 'English', '1982-09-09', 'UK'),
(907, 'Eyes Wide Shut', 1999, 159, 'English', null, 'UK'),
(908, 'The Usual Suspects', 1995, 106, 'English', '1995-08-25', 'UK'),
(909, 'Chinatown', 1974, 130, 'English', '1974-08-09', 'UK'),
(910, 'Boogie Nights', 1997, 155, 'English', '1998-02-16', 'UK'),
(911, 'Annie Hall', 1977, 93, 'English', '1977-04-20', 'USA'),
(912, 'Princess Mononoke', 1997, 134, 'Japanese', '2001-10-19', 'UK'),
(913, 'The Shawshank Redemption', 1994, 142, 'English', '1995-02-17', 'UK'),
(914, 'American Beauty', 1999, 122, 'English', null, 'UK'),
(915, 'Titanic', 1997, 194, 'English', '1998-01-23', 'UK'),
(916, 'Good Will Hunting', 1997, 126, 'English', '1998-06-03', 'UK'),
(917, 'Deliverance', 1972, 109, 'English', '1982-10-05', 'UK'),
(918, 'Trainspotting', 1996, 94, 'English', '1996-02-23', 'UK'),
(919, 'The Prestige', 2006, 130, 'English', '2006-11-10', 'UK'),
(920, 'Donnie Darko', 2001, 113, 'English', null, 'UK'),
(921, 'Slumdog Millionaire', 2008, 120, 'English', '2009-01-09', 'UK'),
(922, 'Aliens', 1986, 137, 'English', '1986-08-29', 'UK'),
(923, 'Beyond the Sea', 2004, 118, 'English', '2004-11-26', 'UK'),
(924, 'Avatar', 2009, 162, 'English', '2009-12-17', 'UK'),
(926, 'Seven Samurai', 1954, 207, 'Japanese', '1954-04-26', 'JP'),
(927, 'Spirited Away', 2001, 125, 'Japanese', '2003-09-12', 'UK'),
(928, 'Back to the Future', 1985, 116, 'English', '1985-12-04', 'UK'),
(925, 'Braveheart', 1995, 178, 'English', '1995-09-08', 'UK');

INSERT INTO movie_genres (mov_id, gen_id) VALUES
(922, 1001),
(917, 1002),
(903, 1002),
(912, 1003),
(911, 1005),
(908, 1006),
(913, 1006),
(926, 1007),
(928, 1007),
(918, 1007),
(921, 1007),
(902, 1008),
(923, 1009),
(907, 1010),
(927, 1010),
(901, 1010),
(914, 1011),
(906, 1012),
(904, 1013);

INSERT INTO movie_direction (dir_id, mov_id) VALUES
(201, 901),
(202, 902),
(203, 903),
(204, 904),
(205, 905),
(206, 906),
(207, 907),
(208, 908),
(209, 909),
(210, 910),
(211, 911),
(212, 912),
(213, 913),
(214, 914),
(215, 915),
(216, 916),
(217, 917),
(218, 918),
(219, 919),
(220, 920),
(218, 921),
(215, 922),
(221, 923);

INSERT INTO reviewer (rev_id, rev_name) VALUES
(9001, 'Righty Sock'),
(9002, 'Jack Malvern'),
(9003, 'Flagrant Baronessa'),
(9004, 'Alec Shaw'),
(9005, null),
(9006, 'Victor Woeltjen'),
(9007, 'Simon Wright'),
(9008, 'Neal Wruck'),
(9009, 'Paul Monks'),
(9010, 'Mike Salvati'),
(9011, null),
(9012, 'Wesley S. Walker'),
(9013, 'Sasha Goldshtein'),
(9014, 'Josh Cates'),
(9015, 'Krug Stillo'),
(9016, 'Scott LeBrun'),
(9017, 'Hannah Steele'),
(9018, 'Vincent Cadena'),
(9019, 'Brandt Sponseller'),
(9020, 'Richard Adams');

INSERT INTO rating (mov_id, rev_id, rev_stars, num_o_ratings) VALUES
(901, 9001, 8.40, 263575),
(902, 9002, 7.90, 20207),
(903, 9003, 8.30, 202778),
(906, 9005, 8.20, 484746),
(924, 9006, 7.30, null),
(908, 9007, 8.60, 779489),
(909, 9008, null, 227235),
(910, 9009, 3.00, 195961),
(911, 9010, 8.10, 203875),
(912, 9011, 8.40, null),
(914, 9013, 7.00, 862618),
(915, 9001, 7.70, 830095),
(916, 9014, 4.00, 642132),
(925, 9015, 7.70, 81328),
(918, 9016, null, 580301),
(920, 9017, 8.10, 609451),
(921, 9018, 8.00, 667758),
(922, 9019, 8.40, 511613),
(923, 9020, 6.70, 13091);

INSERT INTO movie_cast (act_id, mov_id, role) VALUES
(101, 901, 'John Scottie Ferguson'),
(102, 902, 'Miss Giddens'),
(103, 903, 'T.E. Lawrence'),
(104, 904, 'Michael'),
(105, 905, 'Antonio Salieri'),
(106, 906, 'Rick Deckard'),
(107, 907, 'Alice Harford'),
(108, 908, 'McManus'),
(110, 910, 'Eddie Adams'),
(111, 911, 'Alvy Singer'),
(112, 912, 'San'),
(113, 913, 'Andy Dufresne'),
(114, 914, 'Lester Burnham'),
(115, 915, 'Rose DeWitt Bukater'),
(116, 916, 'Sean Maguire'),
(117, 917, 'Ed'),
(118, 918, 'Renton'),
(120, 920, 'Elizabeth Darko'),
(121, 921, 'Older Jamal'),
(122, 922, 'Ripley'),
(114, 923, 'Bobby Darin'),
(109, 909, 'J.J. Gittes'),
(119, 919, 'Alfred Borden');

-- Find a movie title that has a character named Alice Harford
SELECT mov_title
FROM movie
JOIN movie_cast ON movie.mov_id = movie_cast.mov_id
WHERE role = 'Alice Harford';





-- Find each genre of each movies
SELECT movie.mov_title, genres.gen_title
FROM movie
JOIN movie_genres ON movie.mov_id = movie_genres.mov_id
JOIN genres ON movie_genres.gen_id = genres.gen_id
ORDER BY movie.mov_title;


--Find the most favorite genre (using average rating of each genre)
SELECT genres.gen_title, AVG(rating.rev_stars) AS avg_rating
FROM genres
JOIN movie_genres ON genres.gen_id = movie_genres.gen_id
JOIN movie ON movie_genres.mov_id = movie.mov_id
JOIN rating ON movie.mov_id = rating.mov_id
GROUP BY genres.gen_title
ORDER BY avg_rating DESC
LIMIT 1;



-- Find what year that has most movies (movies of each year)
SELECT mov_year, COUNT(*) AS movie_count
FROM movie
GROUP BY mov_year
ORDER BY movie_count DESC
LIMIT 1;


-- Find actor that has played as Sean Maguire
SELECT actor.act_fname, actor.act_lname
FROM movie_cast
JOIN actor ON movie_cast.act_id = actor.act_id
WHERE movie_cast.role = 'Sean Maguire';


-- Find a movie with the lowest rating
SELECT movie.mov_title, rating.rev_stars
FROM movie
JOIN rating ON movie.mov_id = rating.mov_id
WHERE rating.rev_stars IS NOT NULL
ORDER BY rating.rev_stars ASC
LIMIT 1;


-- Find how many female actor who acted in 21st century
SELECT COUNT(DISTINCT actor.act_id) AS female_actors_count
FROM actor
JOIN movie_cast ON actor.act_id = movie_cast.act_id
JOIN movie ON movie_cast.mov_id = movie.mov_id
WHERE actor.act_gender = 'F'
AND movie.mov_year >= 2000;

-- Find actor that has played in more than one movie
SELECT actor.act_id, actor.act_fname, actor.act_lname, COUNT(*) AS movie_count
FROM actor
JOIN movie_cast ON actor.act_id = movie_cast.act_id
GROUP BY actor.act_id, actor.act_fname, actor.act_lname
ORDER BY movie_count DESC;

SELECT actor.act_id, actor.act_fname, actor.act_lname, COUNT(movie_cast.mov_id) AS movie_count
FROM actor
JOIN movie_cast ON actor.act_id = movie_cast.act_id
GROUP BY actor.act_id, actor.act_fname, actor.act_lname
HAVING COUNT(movie_cast.mov_id) > 1
ORDER BY movie_count DESC;



-- Find female actor whose movies received a highest rating 
select * from movie_cast mc
inner join actor a on mc.act_id = a.act_id
inner join rating r on r.mov_id = mc.mov_id
where a.act_gender = 'F'
order by rev_stars desc;

select mc.act_id, mc.mov_id, concat(a.act_fname,' ',a.act_lname) full_name, r.rev_stars
from movie_cast mc
inner join actor a on mc.act_id = a.act_id
inner join rating r on r.mov_id = mc.mov_id
where a.act_gender = 'F'
order by rev_stars desc
limit 1;




-- Find reviewer who never give the low rating (below 8)
SELECT reviewer.rev_id, reviewer.rev_name
FROM reviewer
LEFT JOIN rating ON reviewer.rev_id = rating.rev_id
GROUP BY reviewer.rev_id, reviewer.rev_name
HAVING MIN(rating.rev_stars) >= 8 OR MIN(rating.rev_stars) IS NULL;



--Find the number of director who directed drama movies
SELECT COUNT(DISTINCT director.dir_id) AS num_directors
FROM director
JOIN movie_direction ON director.dir_id = movie_direction.dir_id
JOIN movie_genres ON movie_direction.mov_id = movie_genres.mov_id
JOIN genres ON movie_genres.gen_id = genres.gen_id
WHERE genres.gen_title = 'Drama';



--Count the number of male and female actor
SELECT act_gender, COUNT(*) AS actor_count
FROM actor
GROUP BY act_gender;
