-- 4. Find the most favorite director for each genre (rank)

WITH GenreDirectorRatings AS (
    SELECT
        g.gen_title,
        d.dir_id,
        d.dir_fname,
        d.dir_lname,
        AVG(r.rev_stars) AS avg_rating,
        RANK() OVER (PARTITION BY g.gen_title ORDER BY AVG(r.rev_stars) DESC) AS rank
    FROM
        movie_genres mg
        JOIN genres g ON mg.gen_id = g.gen_id
        JOIN movie m ON mg.mov_id = m.mov_id
        JOIN movie_direction md ON m.mov_id = md.mov_id
        JOIN director d ON md.dir_id = d.dir_id
        JOIN rating r ON m.mov_id = r.mov_id
    GROUP BY
        g.gen_title,
        d.dir_id,
        d.dir_fname,
        d.dir_lname
)
SELECT
    gen_title,
    dir_id,
    dir_fname,
    dir_lname,
    avg_rating
FROM
    GenreDirectorRatings
WHERE
    rank = 1;






-- 5. Find a movie title that has a character named Alice Harford, create an index for the query
-- Create an index on the 'role' column in the 'movie_cast' table
CREATE INDEX idx_movie_cast_role ON movie_cast(role);

-- Query to find the movie title that has a character named Alice Harford
SELECT m.mov_title
FROM movie m
JOIN movie_cast mc ON m.mov_id = mc.mov_id
WHERE mc.role = 'Alice Harford';




-- 6. Find actor that has played as Sean Maguire, create an index for the query
-- Query to find the actor:
SELECT a.act_fname, a.act_lname
FROM actor a
JOIN movie_cast mc ON a.act_id = mc.act_id
WHERE mc.role = 'Sean Maguire';
-- Before creating the index:
-- Query to find the actor who played as Sean Maguire without the index
EXPLAIN ANALYZE
SELECT a.act_fname, a.act_lname
FROM actor a
JOIN movie_cast mc ON a.act_id = mc.act_id
WHERE mc.role = 'Sean Maguire';

-- Create a new index on the 'role' and 'act_id' columns in the 'movie_cast' table
CREATE INDEX idx_movie_cast_role_act_id ON movie_cast(role, act_id);

-- Query to find the actor who played as Sean Maguire with the new index
EXPLAIN ANALYZE
SELECT a.act_fname, a.act_lname
FROM actor a
JOIN movie_cast mc ON a.act_id = mc.act_id
WHERE mc.role = 'Sean Maguire';

