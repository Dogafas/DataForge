-- Таблица жанров
CREATE TABLE genres (
    genre_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

-- Таблица исполнителей
CREATE TABLE artists (
    artist_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

-- Таблица альбомов
CREATE TABLE albums (
    album_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INT NOT NULL
);

-- Таблица треков
CREATE TABLE tracks (
    track_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    duration INTERVAL NOT NULL,
    album_id INT REFERENCES albums(album_id) ON DELETE CASCADE
);

-- Таблица сборников
CREATE TABLE compilations (
    compilation_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INT NOT NULL
);

-- Связь исполнителей и жанров (многие-ко-многим)
CREATE TABLE artist_genre (
    artist_id INT REFERENCES artists(artist_id) ON DELETE CASCADE,
    genre_id INT REFERENCES genres(genre_id) ON DELETE CASCADE,
    PRIMARY KEY (artist_id, genre_id)
);

-- Связь исполнителей и альбомов (многие-ко-многим)
CREATE TABLE artist_album (
    artist_id INT REFERENCES artists(artist_id) ON DELETE CASCADE,
    album_id INT REFERENCES albums(album_id) ON DELETE CASCADE,
    PRIMARY KEY (artist_id, album_id)
);

-- Связь сборников и треков (многие-ко-многим)
CREATE TABLE compilation_track (
    compilation_id INT REFERENCES compilations(compilation_id) ON DELETE CASCADE,
    track_id INT REFERENCES tracks(track_id) ON DELETE CASCADE,
    PRIMARY KEY (compilation_id, track_id)
);