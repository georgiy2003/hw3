SELECT name, duration 
FROM Tracks
ORDER BY duration DESC
LIMIT 1;

SELECT name 
FROM Tracks
WHERE duration >= 3.5;

SELECT name 
FROM Compilations
WHERE release_year BETWEEN 2018 AND 2020;

SELECT name 
FROM Performers
WHERE name NOT LIKE '% %';

SELECT name 
FROM Tracks
WHERE name ILIKE '%мой%' OR name ILIKE '%my%';
