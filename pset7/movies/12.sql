SELECT  movies.title FROM people
JOIN stars ON stars.person_id = people.id
JOIN movies ON movies.id = stars.movie_id
WHERE people.name = 'Johnny Depp'

INTERSECT

SELECT  movies.title FROM people
JOIN stars ON stars.person_id = people.id
JOIN movies ON movies.id = stars.movie_id
WHERE people.name = 'Helena Bonham Carter';