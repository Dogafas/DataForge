/*Название и продолжительность самого длительного трека.*/
SELECT title, duration
FROM public.tracks
ORDER BY duration DESC
LIMIT 1;

/*Название треков, продолжительность которых не менее 3,5 минут*/
SELECT title
FROM public.tracks
WHERE duration >= 210;

/*Названия сборников, вышедших в период с 2018 по 2020 год включительно*/
SELECT title
FROM public.compilations
WHERE release_year BETWEEN 2018 AND 2020;

/*Исполнители, чьё имя состоит из одного слова*/
SELECT "name"
FROM public.artists
WHERE "name" NOT LIKE '% %';

/*Название треков, которые содержат слово «мой» или «my»*/
SELECT title
FROM public.tracks
WHERE title ILIKE '%мой%' OR title ILIKE '%my%';

/*Количество исполнителей в каждом жанре*/
SELECT g.name AS genre_name, COUNT(ag.artist_id) AS artist_count
FROM public.genres AS g
JOIN public.artist_genre AS ag ON g.genre_id = ag.genre_id
GROUP BY g.name
ORDER BY artist_count DESC;

/*Количество треков, вошедших в альбомы 2019–2020 годов*/
SELECT a.title AS album_title, COUNT(t.track_id) AS track_count
FROM public.albums AS a
JOIN public.tracks AS t ON a.album_id = t.album_id
WHERE a.release_year BETWEEN 2019 AND 2020
GROUP BY a.title
ORDER BY track_count DESC;

/*Средняя продолжительность треков по каждому альбому*/
SELECT a.title AS album_title, AVG(t.duration) AS average_duration
FROM public.albums a
JOIN public.tracks t ON a.album_id = t.album_id
GROUP BY a.title
ORDER BY average_duration DESC;


/*Все исполнители, которые не выпустили альбомы в 2020 году*/
SELECT a.name AS artist_name
FROM public.artists as a
WHERE NOT EXISTS (
    SELECT 1
    FROM public.artist_album as aa
    JOIN public.albums as al ON aa.album_id = al.album_id
    WHERE aa.artist_id = a.artist_id AND al.release_year = 2020
);

/*Названия сборников, в которых присутствует конкретный исполнитель "Led Zeppelin"*/
SELECT DISTINCT c.title
FROM compilations AS c
	JOIN compilation_track AS ct ON c.compilation_id = ct.compilation_id
	JOIN tracks AS t ON ct.track_id = t.track_id
	JOIN albums AS a ON t.album_id = a.album_id
	JOIN artist_album AS aa ON a.album_id = aa.album_id
	JOIN artists AS ar ON aa.artist_id = ar.artist_id
WHERE ar.name = 'Led Zeppelin';


