
-- ------------------
-- TASK 2
-- ------------------

-- 1) Название и продолжительность самого длительного трека.
SELECT title, duration_sec FROM tracks ORDER BY duration_sec DESC LIMIT 1;

-- 2) Название треков, продолжительность которых не менее 3.5 минут.
SELECT title, duration_sec FROM tracks WHERE duration_sec >= 210 ORDER BY duration_sec DESC;

-- 3) Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT title FROM compilations WHERE release_year BETWEEN 2018 AND 2020 ORDER BY release_year;

-- 4) Исполнители, чьё имя состоит из одного слова.
SELECT name FROM performers WHERE name NOT LIKE '% %' ORDER BY name;

-- 5) Название треков, которые содержат слово «мой» или «my».
SELECT title
FROM tracks
WHERE string_to_array(
    regexp_replace(lower(title), '[^a-zа-я0-9]+', ' ', 'g'),
    ' '
) && ARRAY['my','мой'];

-- ------------------
-- TASK 3
-- ------------------

-- 1) Количество исполнителей в каждом жанре.
SELECT g.name AS genre, COUNT(pg.performer_id) AS performers_count
FROM genres g
LEFT JOIN performer_genre pg ON g.id = pg.genre_id
GROUP BY g.name
ORDER BY g.name;

-- 2) Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT COUNT(t.id) AS tracks_in_2019_2020
FROM tracks t
JOIN albums a ON t.album_id = a.id
WHERE a.release_year BETWEEN 2019 AND 2020;

-- 3) Средняя продолжительность треков по каждому альбому.
SELECT a.title AS album, ROUND(AVG(t.duration_sec)::numeric, 2) AS avg_duration_seconds
FROM albums a
JOIN tracks t ON t.album_id = a.id
GROUP BY a.title
ORDER BY a.title;

-- 4) Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT p.name
FROM performers p
WHERE NOT EXISTS (
  SELECT 1 FROM album_performer ap
  JOIN albums a ON ap.album_id = a.id
  WHERE ap.performer_id = p.id AND a.release_year = 2020
)
ORDER BY p.name;

-- 5) Названия сборников, в которых присутствует конкретный исполнитель.
-- исполнитель 'Coldplay'.
SELECT DISTINCT c.title
FROM compilations c
JOIN compilation_track ct ON c.id = ct.compilation_id
JOIN tracks t ON ct.track_id = t.id
JOIN album_performer ap ON t.album_id = ap.album_id
JOIN performers p ON ap.performer_id = p.id
WHERE p.name = 'Coldplay'
ORDER BY c.title;
