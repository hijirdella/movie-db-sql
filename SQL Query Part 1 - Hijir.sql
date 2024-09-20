--Exercise Day 5 - SQL Part 1
--Hijir Della Wirasti

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
