
-- Performers (at least 4)
INSERT INTO performers (id, name, country, created_at) VALUES
(1, 'Adele', 'UK', '2015-11-20'),
(2, 'The Beatles', 'UK', '1960-01-01'),
(3, 'Beyonce', 'US', '2003-06-01'),
(4, 'Coldplay', 'UK', '1996-01-01'),
(5, 'Ivan Ivanov', 'RU', '2018-01-01');

-- Genres (at least 3)
INSERT INTO genres (id, name) VALUES
(1, 'Pop'),
(2, 'Rock'),
(3, 'Electronic');

-- Albums (at least 3)
INSERT INTO albums (id, title, release_year, label) VALUES
(1, '25', 2015, 'XL'),
(2, 'Nocturne', 2019, 'DreamRecords'),
(3, 'Solo', 2020, 'Indie'),
(4, 'Hits', 2018, 'Universal');

-- Tracks (at least 6 + test titles)
INSERT INTO tracks (id, album_id, title, duration_sec, track_number) VALUES
(1, 1, 'Hello', 295, 1),
(2, 1, 'Million Years Ago', 200, 2),
(3, 2, 'Nocturne I', 180, 1),
(4, 2, 'Epic', 600, 2),           
(5, 3, 'my own', 230, 1),        
(6, 3, 'own my', 210, 2),       
(7, 3, 'my', 120, 3),           
(8, 3, 'oh my god', 250, 4),     
(9, 4, 'myself', 240, 1),         
(10, 4, 'by myself', 220, 2),    
(11, 4, 'bemy', 190, 3),         
(12, 2, 'by myself by', 200, 3), 
(13, 2, 'beemy', 175, 4),        
(14, 2, 'premyne', 160, 5);      

-- Compilations (at least 4; include 2018-2020 range)
INSERT INTO compilations (id, title, release_year) VALUES
(1, 'Summer 2018', 2018),
(2, 'Best of 2019', 2019),
(3, 'Hits 2020', 2020),
(4, 'Various 2017', 2017);


INSERT INTO performer_genre (performer_id, genre_id) VALUES
(1, 1), 
(2, 2), 
(3, 1), 
(3, 3), 
(4, 2), 
(4, 3), 
(5, 1), 
(5, 2); 


INSERT INTO album_performer (album_id, performer_id) VALUES
(1, 1), 
(2, 3), 
(2, 4), 
(3, 5), 
(4, 2); 


INSERT INTO compilation_track (compilation_id, track_id) VALUES
(1, 1), 
(1, 3), 
(2, 4), 
(2, 5), 
(3, 8), 
(3, 2), 
(4, 9), 
(4, 10); 
