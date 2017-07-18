select *
from Genre;
select *
from Artist;
select *
from Album;
select *
from Song;

--Query all of the entries in the Genre table, g is an alias for the "Genre" table
select g.Label, g.GenreId
from Genre g;

INSERT INTO Genre
values (null, "Alternative Hip Hop");

--Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT INTO Artist
values (null, "Dessa", 2013);

insert into Artist
values (null, "The Rolling Stones", 1963);
insert into Artist(ArtistName, YearEstablished)
values("AC/DC", 1973);

/*Using the INSERT statement, add one, or more, albums by your artist to the Album table.
The first syntax searches and finds the artist and genre IDs for you, the second sytax you know
the artist and genre IDs.*/
INSERT INTO Album
	SELECT
		null, 
		"Parts of Speech", 
		2013, 
		30, 
		"Doomtree Records", 
		a.ArtistId, 
		g.GenreId
	FROM Artist a, Genre g 
	WHERE a.ArtistName = "Dessa" AND g.Label = "Alternative Hip Hop";



insert into Album
values (null, "Exile on Main St", 1971, 50, "Rolling Stones", 28, 2);

--Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT INTO Song
	SELECT
		null,
		"Fighting Fish",
		3,
		2013,
		g.GenreId,
		a.ArtistId,
		al.AlbumId
	FROM Genre g, Artist a, Album al
	WHERE al.Title = "Parts of Speech" 
	AND a.ArtistName = "Dessa" 
	AND g.Label = "Alternative Hip Hop";

INSERT INTO Song
	SELECT
		null,
		"Skeleton Key",
		3,
		2013,
		g.GenreId,
		a.ArtistId,
		al.AlbumId
	FROM Genre g, Artist a, Album al
	WHERE al.Title = "Parts of Speech" 
	AND a.ArtistName = "Dessa" 
	AND g.Label = "Alternative Hip Hop";


insert into Song
values (null, "Tumblin Dice", 3, 1971, 2, 28,26);

select a.ArtistName, al.Title
from Artist a, Album al
where al.ArtistId = a.ArtistId;

select Title
from Album
where artistId = 1
and Title = "Point of Entry";

select a.ArtistName, al.Title
from Artist a, Album al
where a.ArtistId = al.ArtistId
order by a.ArtistName desc;

--display the songs in the database
select s.Title as "Songs",
	al.Title as "Album",
	g.Label as "Genre",
	a.ArtistName as "Artist"
FROM Song s, Album al, Genre g, Artist a
WHERE s.GenreId = g.GenreId
	AND s.ArtistId = a.ArtistId
	AND s.AlbumId = al.AlbumId;





select s.Title as "Songs",
	al.Title as "Album",
	g.Label as "Genre",
	a.ArtistName as "Artist"
from Song s, Album al, Genre g, Artist a
where s.AlbumId = al.AlbumId
and s.GenreId = g.GenreId
and s.ArtistId = a.ArtistId;

/*Bring me back all songs, even if there's no entry (left join). Left join joins the left column
with the right column, even if there are no entries */
SELECT s.Title as "Song", al.Title as "Album"
	FROM Album al
	LEFT JOIN Song s on s.AlbumId = al.AlbumId;
	
--Bring back only albums that don't have songs assigned
SELECT s.Title as "Song", a.Title as "Album"
	FROM Album a
	LEFT JOIN Song s on s.AlbumId = a.AlbumId
	WHERE s.Title IS NULL;

/*Write a SELECT query that provides the song titles, album title, and artist name for all 
of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and 
the WHERE keyword to filter the results to the album and artist you added. the last two
blocks of code create the same output.*/
SELECT s.Title as "Song", al.Title as "Album", a.ArtistName as "Artist"
	FROM Song s
	LEFT JOIN Album al on s.AlbumId = al.AlbumId
	LEFT JOIN Artist a on s.ArtistId = a.ArtistId
	WHERE al.Title = "Parts of Speech"
	AND a.ArtistName = "Dessa";



select s.Title as "Song Title", al.Title as "Album Title", a.ArtistName
from Song s, Album al, Artist a
where s.albumId = al.AlbumId
and s.ArtistId = a.ArtistId;

select s.Title as "Song Title", al.Title as "Album Title", a.ArtistName
from Song s
left join Album al
on s.AlbumId = al.AlbumId
left join Artist a
on s.ArtistId = a.ArtistId;

/*Write a SELECT statement to display how many songs exist for each album. 
You'll need to use the COUNT() function and the GROUP BY keyword sequence.*/
Select al.Title as "Album", count(s.AlbumId)
From Album al, Song s
WHERE s.AlbumId = al.AlbumId
GROUP BY al.Title;






select al.Title, count(s.AlbumId)
from Album al, Song s
where al.AlbumId = s.AlbumId
group by al.title;

/*Write a SELECT statement to display how many songs exist for each artist. 
You'll need to use the COUNT() function and the GROUP BY keyword sequence.*/
SELECT a.ArtistName as "Artist", count(s.SongId)
FROM Artist a, Song s
WHERE s.artistId = a.ArtistId
GROUP BY a.ArtistName;

/*Write a SELECT statement to display how many songs exist for each genre. 
You'll need to use the COUNT() function and the GROUP BY keyword sequence.*/
SELECT g.Label, count(s.SongId)
From Genre g, Song s
Where s.GenreId = g.GenreId
GROUP BY g.Label;

/*Using MAX() function, write a select statement to find the album with the longest duration. 
The result should display the album title and the duration.*/
SELECT al.Title, max(al.AlbumLength)
FROM Album al;

/*Using MAX() function, write a select statement to find the song with the longest duration. 
The result should display the song title and the duration.*/
SELECT s.Title, max(s.SongLength), al.Title
From Song s, Album al
WHERE s.AlbumId = al.AlbumId;





SELECT s.Title, max(s.songlength), al.Title
from Song s, Album al
WHERE s.albumid = al.albumid;

--Modify the previous query to also display the title of the album.