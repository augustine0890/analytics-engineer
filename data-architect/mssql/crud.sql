-- Create the table
create table results (
	-- Create track column
	track             varchar(200),
    -- Create artist column
	artist            varchar(120),
    -- Create album column
	album             varchar(160),
	-- Create track_length_mins
	track_length_mins int
);

-- Select all columns from the table
select track,
       artist,
       album,
       track_length_mins
  from results;

-- Create the table
create table tracks (
  -- Create track column
	track             varchar(200), 
  -- Create album column
	album             varchar(160), 
  -- Create track_length_mins column
	track_length_mins int
);
-- Complete the statement to enter the data to the table         
insert into tracks
-- Specify the destination columns
 (
	track,
	album,
	track_length_mins
)
-- Insert the appropriate values for track, album and track length
 values ( 'Basket Case',
           'Dookie',
           3 );
-- Select all columns from the new table
select *
  from tracks;


-- Select the album
select title
  from album
 where album_id = 213;
-- UPDATE the title of the album
update album
   set
	title = 'Pure Cult: The Best Of The Cult'
 where album_id = 213;
-- Run the query again
select title
  from album
 where album_id = 213;

-- Declare the variable @region
DECLARE @region varchar(10)

-- Update the variable value
SET @region = 'RFC'

SELECT description,
       nerc_region,
       demand_loss_mw,
       affected_customers
FROM grid
WHERE nerc_region = @region;

-- Declare your variables
DECLARE @start DATE
DECLARE @stop DATE
DECLARE @affected INT;
-- SET the relevant values for each variable
SET @start = '2014-01-24'
SET @stop  = '2014-07-02'
SET @affected =  5000 ;

SELECT 
  description,
  nerc_region,
  demand_loss_mw,
  affected_customers
FROM 
  grid
-- Specify the date range of the event_date and the value for @affected
WHERE event_date BETWEEN @start AND @stop
AND affected_customers >= @affected;

SELECT  album.title AS album_title,
  artist.name as artist,
  MAX(track.milliseconds / (1000 * 60) % 60 ) AS max_track_length_mins
-- Name the temp table #maxtracks
INTO #maxtracks
FROM album
-- Join album to artist using artist_id
INNER JOIN artist ON album.artist_id = artist.artist_id
-- Join track to album using album_id
INNER JOIN track ON album.album_id = track.album_id
GROUP BY artist.artist_id, album.title, artist.name,album.album_id

-- Run the final SELECT query to retrieve the results from the temporary table
SELECT album_title, artist, max_track_length_mins
FROM  #maxtracks
ORDER BY max_track_length_mins DESC, artist;