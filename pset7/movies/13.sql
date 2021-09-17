SELECT people.name FROM people
JOIN stars ON stars.person_id = people.id
WHERE movie_id IN (SELECT movie_id FROM people
JOIN stars ON stars.person_id = people.id
WHERE name IS 'Kevin Bacon' AND birth = 1958)

EXCEPT
SELECT people.name FROM people
JOIN stars ON stars.person_id = people.id
WHERE name IS 'Kevin Bacon' AND birth = 1958;