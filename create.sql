
DROP TABLE IF EXISTS compilation_track;
DROP TABLE IF EXISTS album_performer;
DROP TABLE IF EXISTS performer_genre;
DROP TABLE IF EXISTS tracks;
DROP TABLE IF EXISTS compilations;
DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS performers;
DROP TABLE IF EXISTS genres;

CREATE TABLE performers (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    country TEXT NOT NULL,
    created_at DATE NOT NULL
);

CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE albums (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    release_year INT NOT NULL,
    label TEXT NOT NULL
);

CREATE TABLE tracks (
    id SERIAL PRIMARY KEY,
    album_id INT NOT NULL REFERENCES albums(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    duration_sec INT NOT NULL, 
    track_number INT NOT NULL
);

CREATE TABLE compilations (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    release_year INT NOT NULL
);

CREATE TABLE performer_genre (
    performer_id INT NOT NULL REFERENCES performers(id) ON DELETE CASCADE,
    genre_id INT NOT NULL REFERENCES genres(id) ON DELETE CASCADE,
    PRIMARY KEY (performer_id, genre_id)
);

CREATE TABLE album_performer (
    album_id INT NOT NULL REFERENCES albums(id) ON DELETE CASCADE,
    performer_id INT NOT NULL REFERENCES performers(id) ON DELETE CASCADE,
    PRIMARY KEY (album_id, performer_id)
);

CREATE TABLE compilation_track (
    compilation_id INT NOT NULL REFERENCES compilations(id) ON DELETE CASCADE,
    track_id INT NOT NULL REFERENCES tracks(id) ON DELETE CASCADE,
    PRIMARY KEY (compilation_id, track_id)
);

CREATE INDEX idx_tracks_album ON tracks(album_id);
CREATE INDEX idx_album_performer_perf ON album_performer(performer_id);
