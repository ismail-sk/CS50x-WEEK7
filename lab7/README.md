## Lab 7: Songs
The instructions of lab:
https://cs50.harvard.edu/x/2021/labs/7/

Emply files:
https://cdn.cs50.net/2020/fall/psets/7/fiftyville/fiftyville.zip

Q1: In 1.sql,
write a SQL query to list the names of all songs in the database.
- Your query should output a table with a single column for the name of each song.

A1: ```SELECT name FROM songs;```

Q2: In 2.sql,
write a SQL query to list the names of all songs in increasing order of tempo.
Your query should output a table with a single column for the name of each song.

A2: ```SELECT name FROM Songs
ORDER BY tempo;```

Q3: In 3.sql,
write a SQL query to list the names of the top 5 longest songs, in descending order of length.
- Your query should output a table with a single column for the name of each song.

A3: ```SELECT name FROM Songs ORDER BY duration_ms DESC LIMIT 5;```

Q4: In 4.sql,
write a SQL query that lists the names of any songs that have danceability, energy, and valence greater than 0.75.
- Your query should output a table with a single column for the name of each song.

A4: ```SELECT name FROM Songs WHERE danceability>0.75 and energy>0.75 and valence>0.75;```

Q5: In 5.sql,
write a SQL query that returns the average energy of all the songs.
- Your query should output a table with a single column and a single row containing the average energy.

A5: ```SELECT AVG(energy)
FROM Songs;```

Q6: In 6.sql,
write a SQL query that lists the names of songs that are by Post Malone.
- Your query should output a table with a single column for the name of each song.
- You should not make any assumptions about what Post Malone’s artist_id is.

A6: ```SELECT name FROM Songs WHERE artist_id = (SELECT id FROM artists WHERE name = 'Post Malone');
-- SELECT name FROM Songs WHERE artist_id = 54;```

Q7: In 7.sql,
write a SQL query that returns the average energy of songs that are by Drake.
- Your query should output a table with a single column and a single row containing the average energy.
- You should not make any assumptions about what Drake’s artist_id is.

A7: ```SELECT AVG(energy) FROM Songs WHERE artist_id = (SELECT id FROM artists WHERE name = 'Drake');
-- SELECT AVG(energy) FROM Songs WHERE artist_id = 23;```

Q8: In 8.sql,
write a SQL query that lists the names of the songs that feature other artists.
- Songs that feature other artists will include “feat.” in the name of the song.
- Your query should output a table with a single column for the name of each song.

A8: ```SELECT name FROM Songs WHERE name LIKE '%feat.%';```
