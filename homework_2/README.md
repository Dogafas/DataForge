# Описание таблиц и связей

## Таблицы

### genres
- **genre_id**: Уникальный идентификатор жанра.
- **name**: Название жанра.

### artists
- **artist_id**: Уникальный идентификатор исполнителя.
- **name**: Имя исполнителя.

### albums
- **album_id**: Уникальный идентификатор альбома.
- **title**: Название альбома.
- **release_year**: Год выпуска альбома.

### tracks
- **track_id**: Уникальный идентификатор трека.
- **title**: Название трека.
- **duration**: Длительность трека.
- **album_id**: Внешний ключ, ссылающийся на альбом, которому принадлежит трек.

### compilations
- **compilation_id**: Уникальный идентификатор сборника.
- **title**: Название сборника.
- **release_year**: Год выпуска сборника.

## Связи

### artist_genre
Связывает исполнителей с жанрами.
- **artist_id**: Внешний ключ, ссылающийся на исполнителя.
- **genre_id**: Внешний ключ, ссылающийся на жанр.

### artist_album
Связывает исполнителей с альбомами.
- **artist_id**: Внешний ключ, ссылающийся на исполнителя.
- **album_id**: Внешний ключ, ссылающийся на альбом.

### compilation_track
Связывает сборники с треками.
- **compilation_id**: Внешний ключ, ссылающийся на сборник.
- **track_id**: Внешний ключ, ссылающийся на трек.