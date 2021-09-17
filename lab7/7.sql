SELECT AVG(energy) FROM Songs WHERE artist_id = (SELECT id FROM artists WHERE name = 'Drake');
-- SELECT AVG(energy) FROM Songs WHERE artist_id = 23;