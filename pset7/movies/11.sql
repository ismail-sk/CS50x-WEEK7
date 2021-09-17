-- SLOW??
SELECT  movies.title FROM people
JOIN stars ON stars.person_id = people.id
JOIN movies ON movies.id = stars.movie_id
JOIN ratings ON movies.id = ratings.movie_id
WHERE people.name = 'Chadwick Boseman' ORDER BY ratings.rating DESC LIMIT 5;