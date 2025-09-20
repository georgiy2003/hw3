SELECT g.name AS genre, COUNT(pg.performer_id) AS performer_count
FROM Genres g
JOIN Performer_Genre pg ON g.id = pg.genre_id
GROUP BY g.name;

SELECT COUNT(*) AS track_count
FROM Tracks t
JOIN Albums a ON t.album_id = a.id
WHERE a.release_year BETWEEN 2019 AND 2020;

SELECT a.name AS album, AVG(t.duration) AS avg_duration
FROM Albums a
JOIN Tracks t ON a.id = t.album_id
GROUP BY a.name;

SELECT p.name
FROM Performers p
WHERE p.id NOT IN (
    SELECT ap.performer_id
    FROM Album_Performer ap
    JOIN Albums a ON ap.album_id = a.id
    WHERE a.release_year = 2020
);

SELECT DISTINCT c.name
FROM Compilations c
JOIN Compilation_Track ct ON c.id = ct.compilation_id
JOIN Tracks t ON ct.track_id = t.id
JOIN Albums a ON t.album_id = a.id
JOIN Album_Performer ap ON a.id = ap.album_id
JOIN Performers p ON ap.performer_id = p.id
WHERE p.name = 'Queen';
