## Pset 7: Movies
The instructions of Pset:
https://cs50.harvard.edu/x/2021/psets/7/movies/


Emply files(used database is into this zip): https://cdn.cs50.net/2020/fall/psets/7/movies/movies.zip

Q1:In 1.sql, write a SQL query to list the titles of all movies released in 2008.
- Your query should output a table with a single column for the title of each movie.

A1: ```SELECT title FROM movies WHERE year = 2008;```

Q2: In 2.sql, write a SQL query to determine the birth year of Emma Stone.
- Your query should output a table with a single column and a single row (not including the header) containing Emma Stone’s birth year.
- You may assume that there is only one person in the database with the name Emma Stone.

A2: ```SELECT birth FROM people WHERE name = 'Emma Stone';```


Q3:In 3.sql, write a SQL query to list the titles of all movies with a release date on or after 2018, in alphabetical order.
- Your query should output a table with a single column for the title of each movie.
- Movies released in 2018 should be included, as should movies with release dates in the future.

A3: ```SELECT title FROM movies WHERE year >= 2018 ORDER BY title;```


Q4:In 4.sql, write a SQL query to determine the number of movies with an IMDb rating of 10.0.
- Your query should output a table with a single column and a single row (not including the header) containing the number of movies with a 10.0 rating.

A4: ```SELECT COUNT(rating) FROM ratings WHERE rating = 10.0;```


Q5:In 5.sql, write a SQL query to list the titles and release years of all Harry Potter movies, in chronological order.
- Your query should output a table with two columns, one for the title of each movie and one for the release year of each movie.
- You may assume that the title of all Harry Potter movies will begin with the words “Harry Potter”, and that if a movie title begins with the words “Harry Potter”, it is a Harry Potter movie.

A5: ```SELECT title,year FROM movies WHERE title LIKE 'Harry Potter%' ORDER BY year;```


Q6:In 6.sql, write a SQL query to determine the average rating of all movies released in 2012.
- Your query should output a table with a single column and a single row (not including the header) containing the average rating.

A6: ```SELECT AVG(rating) FROM ratings WHERE movie_id IN (SELECT id FROM movies WHERE year = 2012);```


Q7:In 7.sql, write a SQL query to list all movies released in 2010 and their ratings, in descending order by rating. For movies with the same rating, order them alphabetically by title.
- Your query should output a table with two columns, one for the title of each movie and one for the rating of each movie.
- Movies that do not have ratings should not be included in the result.

A7: ```SELECT movies.title, ratings.rating FROM movies
INNER JOIN ratings ON movies.id=ratings.movie_id
WHERE movies.year = 2010
ORDER BY 2 DESC,1;```


Q8:In 8.sql, write a SQL query to list the names of all people who starred in Toy Story.
- Your query should output a table with a single column for the name of each person.
- You may assume that there is only one movie in the database with the title Toy Story.

A8: ```SELECT name FROM people
JOIN stars ON people.id = stars.person_id
JOIN movies ON stars.movie_id = movies.id
WHERE movies.title = "Toy Story";

-- SELECT name FROM people WHERE id = (SELECT person_id FROM stars WHERE movie_id = (SELECT id FROM movies WHERE title IS "Toy Story"));```


Q9:In 9.sql, write a SQL query to list the names of all people who starred in a movie released in 2004, ordered by birth year.
- Your query should output a table with a single column for the name of each person.
- People with the same birth year may be listed in any order.
- No need to worry about people who have no birth year listed, so long as those who do have a birth year are listed in order.
- If a person appeared in more than one movie in 2004, they should only appear in your results once.

A9: ```SELECT name FROM people
JOIN stars ON stars.person_id = people.id
JOIN movies ON movies.id = stars.movie_id
WHERE year = 2004
GROUP BY name, person_id
ORDER BY birth;```


Q10:In 10.sql, write a SQL query to list the names of all people who have directed a movie that received a rating of at least 9.0.
- Your query should output a table with a single column for the name of each person.
- If a person directed more than one movie that received a rating of at least 9.0, they should only appear in your results once.

A10: ```SELECT name
FROM people
JOIN directors ON directors.person_id = people.id
JOIN movies ON movies.id = directors.movie_id
JOIN ratings ON movies.id = ratings.movie_id
WHERE rating >= 9.0
GROUP BY person_id;```


Q11:In 11.sql, write a SQL query to list the titles of the five highest rated movies (in order) that Chadwick Boseman starred in, starting with the highest rated.
- Your query should output a table with a single column for the title of each movie.
- You may assume that there is only one person in the database with the name Chadwick Boseman.


A11: ```-- SLOW??
SELECT  movies.title FROM people
JOIN stars ON stars.person_id = people.id
JOIN movies ON movies.id = stars.movie_id
JOIN ratings ON movies.id = ratings.movie_id
WHERE people.name = 'Chadwick Boseman' ORDER BY ratings.rating DESC LIMIT 5;```


Q12:In 12.sql, write a SQL query to list the titles of all movies in which both Johnny Depp and Helena Bonham Carter starred.
- Your query should output a table with a single column for the title of each movie.
- You may assume that there is only one person in the database with the name Johnny Depp.
- You may assume that there is only one person in the database with the name Helena Bonham Carter.

A12: ```SELECT  movies.title FROM people
JOIN stars ON stars.person_id = people.id
JOIN movies ON movies.id = stars.movie_id
WHERE people.name = 'Johnny Depp'

INTERSECT

SELECT  movies.title FROM people
JOIN stars ON stars.person_id = people.id
JOIN movies ON movies.id = stars.movie_id
WHERE people.name = 'Helena Bonham Carter';```


Q13:In 13.sql, write a SQL query to list the names of all people who starred in a movie in which Kevin Bacon also starred.
- Your query should output a table with a single column for the name of each person.
- There may be multiple people named Kevin Bacon in the database. Be sure to only select the Kevin Bacon born in 1958.
- Kevin Bacon himself should not be included in the resulting list.

A13: ``` SELECT people.name FROM people
JOIN stars ON stars.person_id = people.id
WHERE movie_id IN (SELECT movie_id FROM people
JOIN stars ON stars.person_id = people.id
WHERE name IS "Kevin Bacon" AND birth = 1958)

EXCEPT
SELECT people.name FROM people
JOIN stars ON stars.person_id = people.id
WHERE name IS "Kevin Bacon" AND birth = 1958; ```
