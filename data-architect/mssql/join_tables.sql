select track_id,
-- Enter the correct table name prefix when retrieving the name column from the track table
       track.name as track_name,
       title as album_title,
  -- Enter the correct table name prefix when retrieving the name column from the artist table
       artist.name as artist_name
  from track
  -- Complete the matching columns to join album with track, and artist with album
 inner join album
on track.album_id = album.album_id
 inner join artist
on album.artist_id = artist.artist_id;

select invoiceline_id,
       unit_price,
       quantity,
       billing_state
  -- Specify the source table
  from invoiceline
  -- Complete the join to the invoice table
  left join invoice
on invoiceline.invoice_id = invoice.invoice_id;

select album.album_id,
       title,
       album.artist_id,
       artist.name as artist
  from album
 inner join artist
on album.artist_id = artist.artist_id
-- Perform the correct join type to return matches or NULLS from the track table
  left join track
on album.album_id = track.album_id
 where album.album_id in ( 213,
                           214 );

select album_id as id,
       title as description,
       'Album' as source
  -- Complete the FROM statement
  from album
 -- Combine the result set using the relevant keyword
union
select artist_id as id,
       name as description,
       'Artist' as source
  -- Complete the FROM statement
  from artist;