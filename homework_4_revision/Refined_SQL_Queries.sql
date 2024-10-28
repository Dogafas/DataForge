--Доработанные запросы с учётом замечаний


/*Название треков, которые содержат слово «мой» или «my»*/
SELECT title
FROM public.tracks
WHERE title ILIKE 'my %' -- Слово "my" в начале строки
   OR title ILIKE '% my %' -- Слово "my" в середине строки
   OR title ILIKE '% my' -- Слово "my" в конце строки
   OR title ILIKE 'my' -- Название трека состоит только из слова "my"
   OR title ILIKE 'мой %' -- Слово "мой" в начале строки
   OR title ILIKE '% мой %' -- Слово "мой" в середине строки
   OR title ILIKE '% мой' -- Слово "мой" в конце строки
   OR title ILIKE 'мой'; -- Название трека состоит только из слова "мой"
   
   
/*Количество треков, вошедших в альбомы 2019–2020 годов*/
SELECT COUNT(t.track_id) AS track_count
FROM public.tracks AS t
JOIN public.albums AS a ON t.album_id = a.album_id
WHERE a.release_year BETWEEN 2019 AND 2020;

