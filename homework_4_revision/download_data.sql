/*Домашнее задание к лекции «Продвинутая выборка данных»
(запустите скрипт как одно целое)
*/

/*Добавление исполнителей*/
INSERT INTO public.artists (name)
VALUES
    ('The Beatles'),
    ('Queen'),
    ('Led Zeppelin'),
    ('Michael Jackson'),
    ('Pink Floyd'),
    ('Nirvana'),
    ('The Rolling Stones'),
    ('Bob Dylan'),
    ('David Bowie'),
    ('Elvis Presley'),
	('Itzhak Perlman'),
    ('Mstislav Rostropovich'),
    ('Yo-Yo Ma'),
    ('Eminem'),
    ('Tupac Shakur'),
    ('Kendrick Lamar'),
    ('Cardi B'),
    ('Drake'),
    ('Jay-Z'),
    ('Kanye West'),
    ('Dr. Dre'),
    ('Snoop Dogg'),
    ('Vladimir Horowitz'),
    ('N.W.A')
ON CONFLICT (name) DO NOTHING;

   
/*Добавление жанров*/
INSERT INTO public.genres (name)
VALUES
    ('Rock'),
    ('Pop'),
    ('Hip Hop'),
    ('Classical')
ON CONFLICT (name) DO NOTHING;   

   
/*Добавление альбомов*/   
INSERT INTO public.albums (title, release_year)
VALUES
    ('Abbey Road', 1969),
    ('Sgt. Pepper''s Lonely Hearts Club Band', 1967),
    ('A Night at the Opera', 1975),
    ('The Game', 1980),
    ('Led Zeppelin IV', 1971),
    ('Physical Graffiti', 1975),
    ('Thriller', 1982),
    ('Bad', 1987),
    ('The Dark Side of the Moon', 1973),
    ('Wish You Were Here', 1975),
    ('Nevermind', 1991),
    ('In Utero', 1993),
    ('Sticky Fingers', 1971),
    ('Let It Bleed', 1969),
    ('Highway 61 Revisited', 1965),
    ('Blonde on Blonde', 1966),
    ('The Rise and Fall of Ziggy Stardust and the Spiders from Mars', 1972),
    ('Aladdin Sane', 1973),
    ('Elvis Presley', 1956),
    ('Elvis Is Back!', 1960),
    ('Horowitz in Moscow', 1986),
    ('Horowitz Plays Scriabin', 1963),
    ('Beethoven: Violin Concerto', 1980),
    ('Bach: Sonatas and Partitas for Solo Violin', 1991),
    ('Bach: Cello Suites', 1997),
    ('Haydn: Cello Concertos', 1992),
    ('The Silk Road', 2000),
    ('Appassionato', 2007),
    ('The Eminem Show', 2002),
    ('Recovery', 2010),
    ('All Eyez on Me', 1996),
    ('Me Against the World', 1995),
    ('To Pimp a Butterfly', 2015),
    ('DAMN.', 2017),
    ('Invasion of Privacy', 2019),
    ('Gangsta Bitch Music, Vol. 1', 2016),
    ('Scorpion', 2018),
    ('Views', 2016),
    ('The Blueprint', 2001),
    ('The Black Album', 2003),
    ('The College Dropout', 2004),
    ('Late Registration', 2005),
    ('The Chronic', 1992),
    ('2001', 1999),
    ('Doggystyle', 1993),
    ('Tha Doggfather', 1996),
    ('Straight Outta Compton', 1988),
    ('N.W.A. and the Posse', 1987);   
   
/*Добавление треков*/   
INSERT INTO public.tracks (title, duration, album_id)
VALUES
    ('Come Together', 259, (SELECT album_id FROM public.albums WHERE title = 'Abbey Road')),
    ('Something', 182, (SELECT album_id FROM public.albums WHERE title = 'Abbey Road')),
    ('Bohemian Rhapsody', 355, (SELECT album_id FROM public.albums WHERE title = 'A Night at the Opera')),
    ('You''re My Best Friend', 172, (SELECT album_id FROM public.albums WHERE title = 'A Night at the Opera')),
    ('Black Dog', 296, (SELECT album_id FROM public.albums WHERE title = 'Led Zeppelin IV')),
    ('Rock and Roll', 220, (SELECT album_id FROM public.albums WHERE title = 'Led Zeppelin IV')),
    ('Billie Jean', 294, (SELECT album_id FROM public.albums WHERE title = 'Thriller')),
    ('Beat It', 258, (SELECT album_id FROM public.albums WHERE title = 'Thriller')),
    ('Time', 412, (SELECT album_id FROM public.albums WHERE title = 'The Dark Side of the Moon')),
    ('Money', 382, (SELECT album_id FROM public.albums WHERE title = 'The Dark Side of the Moon')),
    ('Smells Like Teen Spirit', 301, (SELECT album_id FROM public.albums WHERE title = 'Nevermind')),
    ('Come as You Are', 219, (SELECT album_id FROM public.albums WHERE title = 'Nevermind')),
    ('Brown Sugar', 228, (SELECT album_id FROM public.albums WHERE title = 'Sticky Fingers')),
    ('Wild Horses', 337, (SELECT album_id FROM public.albums WHERE title = 'Sticky Fingers')),
    ('Like a Rolling Stone', 369, (SELECT album_id FROM public.albums WHERE title = 'Highway 61 Revisited')),
    ('Tangled Up in Blue', 365, (SELECT album_id FROM public.albums WHERE title = 'Highway 61 Revisited')),
    ('Starman', 258, (SELECT album_id FROM public.albums WHERE title = 'The Rise and Fall of Ziggy Stardust and the Spiders from Mars')),
    ('Ziggy Stardust', 214, (SELECT album_id FROM public.albums WHERE title = 'The Rise and Fall of Ziggy Stardust and the Spiders from Mars')),
    ('Heartbreak Hotel', 153, (SELECT album_id FROM public.albums WHERE title = 'Elvis Presley')),
    ('Blue Suede Shoes', 153, (SELECT album_id FROM public.albums WHERE title = 'Elvis Presley')),
    ('Moscow Recital', 300, (SELECT album_id FROM public.albums WHERE title = 'Horowitz in Moscow')),
    ('Scriabin: Sonata No. 5', 300, (SELECT album_id FROM public.albums WHERE title = 'Horowitz Plays Scriabin')),
    ('Beethoven: Violin Concerto in D Major, Op. 61', 300, (SELECT album_id FROM public.albums WHERE title = 'Beethoven: Violin Concerto')),
    ('Bach: Sonata No. 1 in G Minor, BWV 1001', 300, (SELECT album_id FROM public.albums WHERE title = 'Bach: Sonatas and Partitas for Solo Violin')),
    ('Bach: Cello Suite No. 1 in G Major, BWV 1007', 300, (SELECT album_id FROM public.albums WHERE title = 'Bach: Cello Suites')),
    ('Haydn: Cello Concerto No. 1 in C Major, Hob. VIIb:1', 300, (SELECT album_id FROM public.albums WHERE title = 'Haydn: Cello Concertos')),
    ('Silk Road Journey', 300, (SELECT album_id FROM public.albums WHERE title = 'The Silk Road')),
    ('Appassionato', 300, (SELECT album_id FROM public.albums WHERE title = 'Appassionato')),
    ('Without Me', 290, (SELECT album_id FROM public.albums WHERE title = 'The Eminem Show')),
    ('Lose Yourself', 320, (SELECT album_id FROM public.albums WHERE title = 'The Eminem Show')),
    ('California Love', 358, (SELECT album_id FROM public.albums WHERE title = 'All Eyez on Me')),
    ('Dear Mama', 294, (SELECT album_id FROM public.albums WHERE title = 'All Eyez on Me')),
    ('Alright', 215, (SELECT album_id FROM public.albums WHERE title = 'To Pimp a Butterfly')),
    ('HUMBLE.', 177, (SELECT album_id FROM public.albums WHERE title = 'DAMN.')),
    ('Bodak Yellow', 213, (SELECT album_id FROM public.albums WHERE title = 'Invasion of Privacy')),
    ('I Like It', 243, (SELECT album_id FROM public.albums WHERE title = 'Invasion of Privacy')),
    ('God''s Plan', 198, (SELECT album_id FROM public.albums WHERE title = 'Scorpion')),
    ('In My Feelings', 218, (SELECT album_id FROM public.albums WHERE title = 'Scorpion')),
    ('Izzo (H.O.V.A.)', 269, (SELECT album_id FROM public.albums WHERE title = 'The Blueprint')),
    ('Takeover', 313, (SELECT album_id FROM public.albums WHERE title = 'The Blueprint')),
    ('Jesus Walks', 225, (SELECT album_id FROM public.albums WHERE title = 'The College Dropout')),
    ('All Falls Down', 238, (SELECT album_id FROM public.albums WHERE title = 'The College Dropout')),
    ('Nuthin'' but a "G" Thang', 215, (SELECT album_id FROM public.albums WHERE title = 'The Chronic')),
    ('Let Me Ride', 265, (SELECT album_id FROM public.albums WHERE title = 'The Chronic')),
    ('Gin and Juice', 212, (SELECT album_id FROM public.albums WHERE title = 'Doggystyle')),
    ('Who Am I (What''s My Name?)', 258, (SELECT album_id FROM public.albums WHERE title = 'Doggystyle')),
    ('Straight Outta Compton', 292, (SELECT album_id FROM public.albums WHERE title = 'Straight Outta Compton')),
    ('Fuck tha Police', 325, (SELECT album_id FROM public.albums WHERE title = 'Straight Outta Compton'));
  
/*Для проверки корректности работы запроса, добавим треки (содержащие слова которые не должны попасть в выборку ) в таблицу треков*/   
   INSERT INTO public.tracks (title, duration, album_id)
VALUES
    ('myself', 180, (SELECT album_id FROM public.albums WHERE title IN ('Abbey Road', 'Thriller', 'The Dark Side of the Moon', 'Nevermind') ORDER BY RANDOM() LIMIT 1)),
    ('by myself', 210, (SELECT album_id FROM public.albums WHERE title IN ('Abbey Road', 'A Night at the Opera', 'Led Zeppelin IV', 'Sticky Fingers') ORDER BY RANDOM() LIMIT 1)),
    ('bemy self', 200, (SELECT album_id FROM public.albums WHERE title IN ('Elvis Presley', 'Horowitz in Moscow', 'A Night at the Opera', 'Bach: Cello Suites') ORDER BY RANDOM() LIMIT 1)),
    ('myself by', 215, (SELECT album_id FROM public.albums WHERE title IN ('Appassionato', 'The Eminem Show', 'The Blueprint', 'The College Dropout') ORDER BY RANDOM() LIMIT 1)),
    ('by myself by', 195, (SELECT album_id FROM public.albums WHERE title IN ('To Pimp a Butterfly', 'DAMN.', 'Invasion of Privacy', 'Scorpion') ORDER BY RANDOM() LIMIT 1)),
    ('beemy', 225, (SELECT album_id FROM public.albums WHERE title IN ('Highway 61 Revisited', 'The Rise and Fall of Ziggy Stardust and the Spiders from Mars', 'Horowitz Plays Scriabin', 'Led Zeppelin IV') ORDER BY RANDOM() LIMIT 1)),
    ('premyne', 205, (SELECT album_id FROM public.albums WHERE title IN ('Doggystyle', 'The Chronic', 'Straight Outta Compton', 'The Silk Road') ORDER BY RANDOM() LIMIT 1));

   
   
   
/*Добавление сборников*/   
INSERT INTO public.compilations (title, release_year)
VALUES
    ('The Beatles: 1', 2000),
    ('The Beatles: Past Masters', 1988),
    ('Queen: Greatest Hits', 1981),
    ('Queen: Absolute Greatest', 2009),
    ('Led Zeppelin: The Complete Studio Recordings', 1993),
    ('Led Zeppelin: Early Days & Latter Days', 2002),
    ('Michael Jackson: Number Ones', 2003),
    ('Michael Jackson: The Ultimate Collection', 2004),
    ('Pink Floyd: A Foot in the Door', 2011),
    ('Pink Floyd: Echoes', 2001),
    ('Nirvana: Nevermind: The Singles', 2011),
    ('Nirvana: Incesticide', 1992),
    ('The Rolling Stones: Hot Rocks 1964-1971', 1971),
    ('The Rolling Stones: More Hot Rocks', 1972),
    ('Bob Dylan: The Essential Bob Dylan', 2000),
    ('Bob Dylan: The Best of Bob Dylan', 1997),
    ('David Bowie: The Best of David Bowie 1969/1974', 1997),
    ('David Bowie: The Best of David Bowie 1974/1979', 1998),
    ('Elvis Presley: The 50 Greatest Hits', 2000),
    ('Elvis Presley: Elvis: A Legendary Performer Volume 1', 1974),
    ('Vladimir Horowitz: The Complete Masterworks Recordings', 1990),
    ('Vladimir Horowitz: The Last Recording', 1989),
    ('Itzhak Perlman: The Perlman Edition', 1991),
    ('Itzhak Perlman: The Complete Recordings on Deutsche Grammophon', 2000),
    ('Mstislav Rostropovich: The Complete EMI Recordings', 2007),
    ('Mstislav Rostropovich: The Complete Warner Recordings', 2010),
    ('Yo-Yo Ma: The Silk Road Ensemble', 2000),
    ('Yo-Yo Ma: The Essential Yo-Yo Ma', 2005),
    ('Eminem: Curtain Call', 2005),
    ('Eminem: The Marshall Mathers LP2', 2013),
    ('Tupac Shakur: Greatest Hits', 1998),
    ('Tupac Shakur: The Best of 2Pac', 2007),
    ('Kendrick Lamar: The Best of Kendrick Lamar', 2020),
    ('Kendrick Lamar: The Greatest Hits', 2021),
    ('Cardi B: The Best of Cardi B', 2022),
    ('Cardi B: The Greatest Hits', 2023),
    ('Drake: The Best of Drake', 2022),
    ('Drake: The Greatest Hits', 2023),
    ('Jay-Z: The Best of Jay-Z', 2022),
    ('Jay-Z: The Greatest Hits', 2023),
    ('Kanye West: The Best of Kanye West', 2022),
    ('Kanye West: The Greatest Hits', 2023),
    ('Dr. Dre: The Best of Dr. Dre', 2022),
    ('Dr. Dre: The Greatest Hits', 2023),
    ('Snoop Dogg: The Best of Snoop Dogg', 2022),
    ('Snoop Dogg: The Greatest Hits', 2023),
    ('N.W.A: The Best of N.W.A', 2022),
    ('N.W.A: The Greatest Hits', 2023);
   
   
/*Добавление связей исполнителей с жанрами*/
/*INSERT INTO public.artist_genre (artist_id, genre_id)
VALUES
    ((SELECT artist_id FROM public.artists WHERE name = 'The Beatles'), (SELECT genre_id FROM public.genres WHERE name = 'Rock')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Queen'), (SELECT genre_id FROM public.genres WHERE name = 'Rock')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Led Zeppelin'), (SELECT genre_id FROM public.genres WHERE name = 'Rock')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Michael Jackson'), (SELECT genre_id FROM public.genres WHERE name = 'Pop')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Pink Floyd'), (SELECT genre_id FROM public.genres WHERE name = 'Rock')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Nirvana'), (SELECT genre_id FROM public.genres WHERE name = 'Rock')),
    ((SELECT artist_id FROM public.artists WHERE name = 'The Rolling Stones'), (SELECT genre_id FROM public.genres WHERE name = 'Rock')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Bob Dylan'), (SELECT genre_id FROM public.genres WHERE name = 'Rock')),
    ((SELECT artist_id FROM public.artists WHERE name = 'David Bowie'), (SELECT genre_id FROM public.genres WHERE name = 'Rock')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Elvis Presley'), (SELECT genre_id FROM public.genres WHERE name = 'Rock')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Vladimir Horowitz'), (SELECT genre_id FROM public.genres WHERE name = 'Classical')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Itzhak Perlman'), (SELECT genre_id FROM public.genres WHERE name = 'Classical')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Mstislav Rostropovich'), (SELECT genre_id FROM public.genres WHERE name = 'Classical')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Yo-Yo Ma'), (SELECT genre_id FROM public.genres WHERE name = 'Classical')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Eminem'), (SELECT genre_id FROM public.genres WHERE name = 'Hip Hop')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Tupac Shakur'), (SELECT genre_id FROM public.genres WHERE name = 'Hip Hop')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Kendrick Lamar'), (SELECT genre_id FROM public.genres WHERE name = 'Hip Hop')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Cardi B'), (SELECT genre_id FROM public.genres WHERE name = 'Hip Hop')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Drake'), (SELECT genre_id FROM public.genres WHERE name = 'Hip Hop')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Jay-Z'), (SELECT genre_id FROM public.genres WHERE name = 'Hip Hop')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Kanye West'), (SELECT genre_id FROM public.genres WHERE name = 'Hip Hop')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Dr. Dre'), (SELECT genre_id FROM public.genres WHERE name = 'Hip Hop')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Snoop Dogg'), (SELECT genre_id FROM public.genres WHERE name = 'Hip Hop')),
    ((SELECT artist_id FROM public.artists WHERE name = 'N.W.A'), (SELECT genre_id FROM public.genres WHERE name = 'Hip Hop'));*/
/*Добавление связей исполнителей с жанрами*/
INSERT INTO public.artist_genre (artist_id, genre_id)
SELECT 
    (SELECT artist_id FROM public.artists WHERE name = 'The Beatles'), 
    (SELECT genre_id FROM public.genres WHERE name = 'Rock')
ON CONFLICT DO NOTHING;

INSERT INTO public.artist_genre (artist_id, genre_id)
SELECT 
    (SELECT artist_id FROM public.artists WHERE name = 'Queen'), 
    (SELECT genre_id FROM public.genres WHERE name = 'Rock')
ON CONFLICT DO NOTHING;

INSERT INTO public.artist_genre (artist_id, genre_id)
SELECT 
    (SELECT artist_id FROM public.artists WHERE name = 'Led Zeppelin'), 
    (SELECT genre_id FROM public.genres WHERE name = 'Rock')
ON CONFLICT DO NOTHING;

INSERT INTO public.artist_genre (artist_id, genre_id)
SELECT 
    (SELECT artist_id FROM public.artists WHERE name = 'Michael Jackson'), 
    (SELECT genre_id FROM public.genres WHERE name = 'Pop')
ON CONFLICT DO NOTHING;

INSERT INTO public.artist_genre (artist_id, genre_id)
SELECT 
    (SELECT artist_id FROM public.artists WHERE name = 'Pink Floyd'), 
    (SELECT genre_id FROM public.genres WHERE name = 'Rock')
ON CONFLICT DO NOTHING;

INSERT INTO public.artist_genre (artist_id, genre_id)
SELECT 
    (SELECT artist_id FROM public.artists WHERE name = 'Nirvana'), 
    (SELECT genre_id FROM public.genres WHERE name = 'Rock')
ON CONFLICT DO NOTHING;

INSERT INTO public.artist_genre (artist_id, genre_id)
SELECT 
    (SELECT artist_id FROM public.artists WHERE name = 'The Rolling Stones'), 
    (SELECT genre_id FROM public.genres WHERE name = 'Rock')
ON CONFLICT DO NOTHING;

INSERT INTO public.artist_genre (artist_id, genre_id)
SELECT 
    (SELECT artist_id FROM public.artists WHERE name = 'Bob Dylan'), 
    (SELECT genre_id FROM public.genres WHERE name = 'Rock')
ON CONFLICT DO NOTHING;

INSERT INTO public.artist_genre (artist_id, genre_id)
SELECT 
    (SELECT artist_id FROM public.artists WHERE name = 'David Bowie'), 
    (SELECT genre_id FROM public.genres WHERE name = 'Rock')
ON CONFLICT DO NOTHING;

INSERT INTO public.artist_genre (artist_id, genre_id)
SELECT 
    (SELECT artist_id FROM public.artists WHERE name = 'Elvis Presley'), 
    (SELECT genre_id FROM public.genres WHERE name = 'Rock')
ON CONFLICT DO NOTHING;

INSERT INTO public.artist_genre (artist_id, genre_id)
SELECT 
    (SELECT artist_id FROM public.artists WHERE name = 'Vladimir Horowitz'), 
    (SELECT genre_id FROM public.genres WHERE name = 'Classical')
ON CONFLICT DO NOTHING;

INSERT INTO public.artist_genre (artist_id, genre_id)
SELECT 
    (SELECT artist_id FROM public.artists WHERE name = 'Itzhak Perlman'), 
    (SELECT genre_id FROM public.genres WHERE name = 'Classical')
ON CONFLICT DO NOTHING;

INSERT INTO public.artist_genre (artist_id, genre_id)
SELECT 
    (SELECT artist_id FROM public.artists WHERE name = 'Mstislav Rostropovich'), 
    (SELECT genre_id FROM public.genres WHERE name = 'Classical')
ON CONFLICT DO NOTHING;

INSERT INTO public.artist_genre (artist_id, genre_id)
SELECT 
    (SELECT artist_id FROM public.artists WHERE name = 'Yo-Yo Ma'), 
    (SELECT genre_id FROM public.genres WHERE name = 'Classical')
ON CONFLICT DO NOTHING;

INSERT INTO public.artist_genre (artist_id, genre_id)
SELECT 
    (SELECT artist_id FROM public.artists WHERE name = 'Eminem'), 
    (SELECT genre_id FROM public.genres WHERE name = 'Hip Hop')
ON CONFLICT DO NOTHING;

INSERT INTO public.artist_genre (artist_id, genre_id)
SELECT 
    (SELECT artist_id FROM public.artists WHERE name = 'Tupac Shakur'), 
    (SELECT genre_id FROM public.genres WHERE name = 'Hip Hop')
ON CONFLICT DO NOTHING;

INSERT INTO public.artist_genre (artist_id, genre_id)
SELECT 
    (SELECT artist_id FROM public.artists WHERE name = 'Kendrick Lamar'), 
    (SELECT genre_id FROM public.genres WHERE name = 'Hip Hop')
ON CONFLICT DO NOTHING;

INSERT INTO public.artist_genre (artist_id, genre_id)
SELECT 
    (SELECT artist_id FROM public.artists WHERE name = 'Cardi B'), 
    (SELECT genre_id FROM public.genres WHERE name = 'Hip Hop')
ON CONFLICT DO NOTHING;

INSERT INTO public.artist_genre (artist_id, genre_id)
SELECT 
    (SELECT artist_id FROM public.artists WHERE name = 'Drake'), 
    (SELECT genre_id FROM public.genres WHERE name = 'Hip Hop')
ON CONFLICT DO NOTHING;

INSERT INTO public.artist_genre (artist_id, genre_id)
SELECT 
    (SELECT artist_id FROM public.artists WHERE name = 'Jay-Z'), 
    (SELECT genre_id FROM public.genres WHERE name = 'Hip Hop')
ON CONFLICT DO NOTHING;

INSERT INTO public.artist_genre (artist_id, genre_id)
SELECT 
    (SELECT artist_id FROM public.artists WHERE name = 'Kanye West'), 
    (SELECT genre_id FROM public.genres WHERE name = 'Hip Hop')
ON CONFLICT DO NOTHING;

INSERT INTO public.artist_genre (artist_id, genre_id)
SELECT 
    (SELECT artist_id FROM public.artists WHERE name = 'Dr. Dre'), 
    (SELECT genre_id FROM public.genres WHERE name = 'Hip Hop')
ON CONFLICT DO NOTHING;

INSERT INTO public.artist_genre (artist_id, genre_id)
SELECT 
    (SELECT artist_id FROM public.artists WHERE name = 'Snoop Dogg'), 
    (SELECT genre_id FROM public.genres WHERE name = 'Hip Hop')
ON CONFLICT DO NOTHING;

INSERT INTO public.artist_genre (artist_id, genre_id)
SELECT 
    (SELECT artist_id FROM public.artists WHERE name = 'N.W.A'), 
    (SELECT genre_id FROM public.genres WHERE name = 'Hip Hop')
ON CONFLICT DO NOTHING;   
   
   
/*Добавление связей альбомов с исполнителями*/   
INSERT INTO public.artist_album (artist_id, album_id)
VALUES
    ((SELECT artist_id FROM public.artists WHERE name = 'The Beatles'), (SELECT album_id FROM public.albums WHERE title = 'Abbey Road')),
    ((SELECT artist_id FROM public.artists WHERE name = 'The Beatles'), (SELECT album_id FROM public.albums WHERE title = 'Sgt. Pepper''s Lonely Hearts Club Band')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Queen'), (SELECT album_id FROM public.albums WHERE title = 'A Night at the Opera')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Queen'), (SELECT album_id FROM public.albums WHERE title = 'The Game')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Led Zeppelin'), (SELECT album_id FROM public.albums WHERE title = 'Led Zeppelin IV')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Led Zeppelin'), (SELECT album_id FROM public.albums WHERE title = 'Physical Graffiti')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Michael Jackson'), (SELECT album_id FROM public.albums WHERE title = 'Thriller')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Michael Jackson'), (SELECT album_id FROM public.albums WHERE title = 'Bad')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Pink Floyd'), (SELECT album_id FROM public.albums WHERE title = 'The Dark Side of the Moon')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Pink Floyd'), (SELECT album_id FROM public.albums WHERE title = 'Wish You Were Here')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Nirvana'), (SELECT album_id FROM public.albums WHERE title = 'Nevermind')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Nirvana'), (SELECT album_id FROM public.albums WHERE title = 'In Utero')),
    ((SELECT artist_id FROM public.artists WHERE name = 'The Rolling Stones'), (SELECT album_id FROM public.albums WHERE title = 'Sticky Fingers')),
    ((SELECT artist_id FROM public.artists WHERE name = 'The Rolling Stones'), (SELECT album_id FROM public.albums WHERE title = 'Let It Bleed')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Bob Dylan'), (SELECT album_id FROM public.albums WHERE title = 'Highway 61 Revisited')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Bob Dylan'), (SELECT album_id FROM public.albums WHERE title = 'Blonde on Blonde')),
    ((SELECT artist_id FROM public.artists WHERE name = 'David Bowie'), (SELECT album_id FROM public.albums WHERE title = 'The Rise and Fall of Ziggy Stardust and the Spiders from Mars')),
    ((SELECT artist_id FROM public.artists WHERE name = 'David Bowie'), (SELECT album_id FROM public.albums WHERE title = 'Aladdin Sane')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Elvis Presley'), (SELECT album_id FROM public.albums WHERE title = 'Elvis Presley')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Elvis Presley'), (SELECT album_id FROM public.albums WHERE title = 'Elvis Is Back!')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Vladimir Horowitz'), (SELECT album_id FROM public.albums WHERE title = 'Horowitz in Moscow')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Vladimir Horowitz'), (SELECT album_id FROM public.albums WHERE title = 'Horowitz Plays Scriabin')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Itzhak Perlman'), (SELECT album_id FROM public.albums WHERE title = 'Beethoven: Violin Concerto')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Itzhak Perlman'), (SELECT album_id FROM public.albums WHERE title = 'Bach: Sonatas and Partitas for Solo Violin')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Mstislav Rostropovich'), (SELECT album_id FROM public.albums WHERE title = 'Bach: Cello Suites')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Mstislav Rostropovich'), (SELECT album_id FROM public.albums WHERE title = 'Haydn: Cello Concertos')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Yo-Yo Ma'), (SELECT album_id FROM public.albums WHERE title = 'The Silk Road')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Yo-Yo Ma'), (SELECT album_id FROM public.albums WHERE title = 'Appassionato')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Eminem'), (SELECT album_id FROM public.albums WHERE title = 'The Eminem Show')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Eminem'), (SELECT album_id FROM public.albums WHERE title = 'Recovery')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Tupac Shakur'), (SELECT album_id FROM public.albums WHERE title = 'All Eyez on Me')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Tupac Shakur'), (SELECT album_id FROM public.albums WHERE title = 'Me Against the World')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Kendrick Lamar'), (SELECT album_id FROM public.albums WHERE title = 'To Pimp a Butterfly')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Kendrick Lamar'), (SELECT album_id FROM public.albums WHERE title = 'DAMN.')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Cardi B'), (SELECT album_id FROM public.albums WHERE title = 'Invasion of Privacy')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Cardi B'), (SELECT album_id FROM public.albums WHERE title = 'Gangsta Bitch Music, Vol. 1')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Drake'), (SELECT album_id FROM public.albums WHERE title = 'Scorpion')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Drake'), (SELECT album_id FROM public.albums WHERE title = 'Views')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Jay-Z'), (SELECT album_id FROM public.albums WHERE title = 'The Blueprint')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Jay-Z'), (SELECT album_id FROM public.albums WHERE title = 'The Black Album')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Kanye West'), (SELECT album_id FROM public.albums WHERE title = 'The College Dropout')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Kanye West'), (SELECT album_id FROM public.albums WHERE title = 'Late Registration')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Dr. Dre'), (SELECT album_id FROM public.albums WHERE title = 'The Chronic')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Dr. Dre'), (SELECT album_id FROM public.albums WHERE title = '2001')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Snoop Dogg'), (SELECT album_id FROM public.albums WHERE title = 'Doggystyle')),
    ((SELECT artist_id FROM public.artists WHERE name = 'Snoop Dogg'), (SELECT album_id FROM public.albums WHERE title = 'Tha Doggfather')),
    ((SELECT artist_id FROM public.artists WHERE name = 'N.W.A'), (SELECT album_id FROM public.albums WHERE title = 'Straight Outta Compton')),
    ((SELECT artist_id FROM public.artists WHERE name = 'N.W.A'), (SELECT album_id FROM public.albums WHERE title = 'N.W.A. and the Posse'));
   
/*Добавление связей треков и сборников*/   
INSERT INTO public.compilation_track (compilation_id, track_id)
VALUES
    ((SELECT compilation_id FROM public.compilations WHERE title = 'The Beatles: 1'), (SELECT track_id FROM public.tracks WHERE title = 'Come Together')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'The Beatles: 1'), (SELECT track_id FROM public.tracks WHERE title = 'Something')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Queen: Greatest Hits'), (SELECT track_id FROM public.tracks WHERE title = 'Bohemian Rhapsody')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Queen: Greatest Hits'), (SELECT track_id FROM public.tracks WHERE title = 'You''re My Best Friend')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Led Zeppelin: The Complete Studio Recordings'), (SELECT track_id FROM public.tracks WHERE title = 'Black Dog')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Led Zeppelin: The Complete Studio Recordings'), (SELECT track_id FROM public.tracks WHERE title = 'Rock and Roll')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Michael Jackson: Number Ones'), (SELECT track_id FROM public.tracks WHERE title = 'Billie Jean')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Michael Jackson: Number Ones'), (SELECT track_id FROM public.tracks WHERE title = 'Beat It')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Pink Floyd: A Foot in the Door'), (SELECT track_id FROM public.tracks WHERE title = 'Time')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Pink Floyd: A Foot in the Door'), (SELECT track_id FROM public.tracks WHERE title = 'Money')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Nirvana: Nevermind: The Singles'), (SELECT track_id FROM public.tracks WHERE title = 'Smells Like Teen Spirit')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Nirvana: Nevermind: The Singles'), (SELECT track_id FROM public.tracks WHERE title = 'Come as You Are')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'The Rolling Stones: Hot Rocks 1964-1971'), (SELECT track_id FROM public.tracks WHERE title = 'Brown Sugar')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'The Rolling Stones: Hot Rocks 1964-1971'), (SELECT track_id FROM public.tracks WHERE title = 'Wild Horses')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Bob Dylan: The Essential Bob Dylan'), (SELECT track_id FROM public.tracks WHERE title = 'Like a Rolling Stone')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Bob Dylan: The Essential Bob Dylan'), (SELECT track_id FROM public.tracks WHERE title = 'Tangled Up in Blue')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'David Bowie: The Best of David Bowie 1969/1974'), (SELECT track_id FROM public.tracks WHERE title = 'Starman')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'David Bowie: The Best of David Bowie 1969/1974'), (SELECT track_id FROM public.tracks WHERE title = 'Ziggy Stardust')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Elvis Presley: The 50 Greatest Hits'), (SELECT track_id FROM public.tracks WHERE title = 'Heartbreak Hotel')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Elvis Presley: The 50 Greatest Hits'), (SELECT track_id FROM public.tracks WHERE title = 'Blue Suede Shoes')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Vladimir Horowitz: The Complete Masterworks Recordings'), (SELECT track_id FROM public.tracks WHERE title = 'Moscow Recital')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Vladimir Horowitz: The Complete Masterworks Recordings'), (SELECT track_id FROM public.tracks WHERE title = 'Scriabin: Sonata No. 5')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Itzhak Perlman: The Perlman Edition'), (SELECT track_id FROM public.tracks WHERE title = 'Beethoven: Violin Concerto in D Major, Op. 61')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Itzhak Perlman: The Perlman Edition'), (SELECT track_id FROM public.tracks WHERE title = 'Bach: Sonata No. 1 in G Minor, BWV 1001')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Mstislav Rostropovich: The Complete EMI Recordings'), (SELECT track_id FROM public.tracks WHERE title = 'Bach: Cello Suite No. 1 in G Major, BWV 1007')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Mstislav Rostropovich: The Complete EMI Recordings'), (SELECT track_id FROM public.tracks WHERE title = 'Haydn: Cello Concerto No. 1 in C Major, Hob. VIIb:1')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Yo-Yo Ma: The Silk Road Ensemble'), (SELECT track_id FROM public.tracks WHERE title = 'Silk Road Journey')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Yo-Yo Ma: The Silk Road Ensemble'), (SELECT track_id FROM public.tracks WHERE title = 'Appassionato')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Eminem: Curtain Call'), (SELECT track_id FROM public.tracks WHERE title = 'Without Me')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Eminem: Curtain Call'), (SELECT track_id FROM public.tracks WHERE title = 'Lose Yourself')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Tupac Shakur: Greatest Hits'), (SELECT track_id FROM public.tracks WHERE title = 'California Love')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Tupac Shakur: Greatest Hits'), (SELECT track_id FROM public.tracks WHERE title = 'Dear Mama')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Kendrick Lamar: The Best of Kendrick Lamar'), (SELECT track_id FROM public.tracks WHERE title = 'Alright')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Kendrick Lamar: The Best of Kendrick Lamar'), (SELECT track_id FROM public.tracks WHERE title = 'HUMBLE.')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Cardi B: The Best of Cardi B'), (SELECT track_id FROM public.tracks WHERE title = 'Bodak Yellow')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Cardi B: The Best of Cardi B'), (SELECT track_id FROM public.tracks WHERE title = 'I Like It')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Drake: The Best of Drake'), (SELECT track_id FROM public.tracks WHERE title = 'God''s Plan')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Drake: The Best of Drake'), (SELECT track_id FROM public.tracks WHERE title = 'In My Feelings')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Jay-Z: The Best of Jay-Z'), (SELECT track_id FROM public.tracks WHERE title = 'Izzo (H.O.V.A.)')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Jay-Z: The Best of Jay-Z'), (SELECT track_id FROM public.tracks WHERE title = 'Takeover')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Kanye West: The Best of Kanye West'), (SELECT track_id FROM public.tracks WHERE title = 'Jesus Walks')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Kanye West: The Best of Kanye West'), (SELECT track_id FROM public.tracks WHERE title = 'All Falls Down')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Dr. Dre: The Best of Dr. Dre'), (SELECT track_id FROM public.tracks WHERE title = 'Nuthin'' but a "G" Thang')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Dr. Dre: The Best of Dr. Dre'), (SELECT track_id FROM public.tracks WHERE title = 'Let Me Ride')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Snoop Dogg: The Best of Snoop Dogg'), (SELECT track_id FROM public.tracks WHERE title = 'Gin and Juice')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'Snoop Dogg: The Best of Snoop Dogg'), (SELECT track_id FROM public.tracks WHERE title = 'Who Am I (What''s My Name?)')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'N.W.A: The Best of N.W.A'), (SELECT track_id FROM public.tracks WHERE title = 'Straight Outta Compton')),
    ((SELECT compilation_id FROM public.compilations WHERE title = 'N.W.A: The Best of N.W.A'), (SELECT track_id FROM public.tracks WHERE title = 'Fuck tha Police'));
