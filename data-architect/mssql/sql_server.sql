select artist,
       release_year,
       song
  from songlist 
  -- Choose the correct artist and specify the release year
 where ( artist like 'B%'
   and release_year = 1986 ) 
  -- Or return all songs released after 1990
    or release_year > 1990 
  -- Order the results
 order by release_year,
          artist,
          song;