select nerc_region,
       sum(demand_loss_mw) as demand_loss
  from grid 
  -- Remove the WHERE clause
-- WHERE demand_loss_mw  IS NOT NULL
 group by nerc_region 
  -- Enter a new HAVING clause so that the sum of demand_loss_mw is greater than 10000
having sum(demand_loss_mw) > 10000
 order by demand_loss desc;

select country,
       count(country) as country_count,
       avg(place) as avg_place,
       avg(points) as avg_points,
       min(points) as min_points,
       max(points) as max_points
  from eurovision
 group by country 
  -- The country column should only contain those with a count greater than 5
having count(country) > 5 
  -- Arrange columns in the correct order
 order by avg_place,
          avg_points desc;