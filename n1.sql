-- Жанры
INSERT INTO Genres (id, name) VALUES
(1, 'Rock'),
(2, 'Pop'),
(3, 'Jazz');

-- Исполнители
INSERT INTO Performers (id, name) VALUES
(1, 'Queen'),
(2, 'Adele'),
(3, 'Miles'),
(4, 'Coldplay');

-- Альбомы
INSERT INTO Albums (id, name, release_year) VALUES
(1, 'Greatest Hits', 2018),
(2, '25', 2019),
(3, 'A Head Full of Dreams', 2016);

-- Треки
INSERT INTO Tracks (id, name, duration, album_id) VALUES
(1, 'Bohemian Rhapsody', 5.55, 1),
(2, 'Someone Like You', 4.45, 2),
(3, 'My Way', 3.50, 3),
(4, 'Viva La Vida', 4.00, 3),
(5, 'Don’t Stop Me Now', 3.30, 1),
(6, 'Hello', 4.30, 2);

-- Сборники
INSERT INTO Compilations (id, name, release_year) VALUES
(1, 'Best of 2018', 2018),
(2, 'Hits 2019', 2019),
(3, 'Top 2020', 2020),
(4, 'Classic Jazz', 2019);

-- Связи
INSERT INTO Album_Performer (album_id, performer_id) VALUES
(1, 1),
(2, 2),
(3, 4);

INSERT INTO Performer_Genre (performer_id, genre_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 1);

INSERT INTO Compilation_Track (compilation_id, track_id) VALUES
(1, 1),
(2, 2),
(2, 6),
(3, 3),
(4, 3),
(4, 4);
