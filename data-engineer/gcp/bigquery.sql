-- This query counts how many days between Feb 21, 2020 and Mar 14, 2020 in India had zero new confirmed COVID-19 cases compared to the previous day.

WITH india_cases_by_date AS (
  SELECT
    date,
    SUM(cumulative_confirmed) AS cases
  FROM
    `bigquery-public-data.covid19_open_data.covid19_open_data`
  WHERE
    country_name = "India"
    AND date BETWEEN '2020-02-21' AND '2020-03-14'
  GROUP BY
    date
  ORDER BY
    date ASC
),

india_previous_day_comparison AS (
  SELECT
    date,
    cases,
    LAG(cases) OVER (ORDER BY date) AS previous_day,
    cases - LAG(cases) OVER (ORDER BY date) AS net_new_cases
  FROM
    india_cases_by_date
)

SELECT COUNT(*)
FROM india_previous_day_comparison
WHERE net_new_cases = 0;

-- find dates in the United States between March 22, 2020 and April 20, 2020 when confirmed cases increased by more than 15% from the previous day:
-- Key points:
    -- SAFE_DIVIDE handles potential division-by-zero errors.
    -- The final WHERE filters days with >15% increase, indicating roughly a doubling time of ~7 days.
    -- The field names are formatted exactly as you specified.

WITH us_cases_by_date AS (
  SELECT
    date,
    SUM(cumulative_confirmed) AS cases
  FROM
    `bigquery-public-data.covid19_open_data.covid19_open_data`
  WHERE
    country_name = "United States of America"
    AND date BETWEEN '2020-03-22' AND '2020-04-20'
  GROUP BY
    date
  ORDER BY
    date ASC
),

us_previous_day_comparison AS (
  SELECT
    date AS Date,
    cases AS Confirmed_Cases_On_Day,
    LAG(cases) OVER (ORDER BY date) AS Confirmed_Cases_Previous_Day,
    SAFE_DIVIDE(cases - LAG(cases) OVER (ORDER BY date), LAG(cases) OVER (ORDER BY date)) * 100 AS Percentage_Increase_In_Cases
  FROM
    us_cases_by_date
)

SELECT *
FROM us_previous_day_comparison
WHERE Percentage_Increase_In_Cases > 15;


-- Recovery rates as of May 10, 2020 for countries with over 50,000 confirmed cases, and list the top 15 in descending order.
WITH cases_by_country AS (
  SELECT
    country_name AS country,
    SUM(cumulative_confirmed) AS cases,
    SUM(cumulative_recovered) AS recovered_cases
  FROM
    `bigquery-public-data.covid19_open_data.covid19_open_data`
  WHERE
    date = '2020-05-10'
  GROUP BY
    country_name
),

recovered_rate AS (
  SELECT
    country,
    cases AS confirmed_cases,
    recovered_cases,
    (recovered_cases * 100) / cases AS recovery_rate
  FROM
    cases_by_country
  WHERE
    cases > 50000
)

SELECT
  country,
  confirmed_cases,
  recovered_cases,
  recovery_rate
FROM
  recovered_rate
ORDER BY
  recovery_rate DESC
LIMIT 15;

--
WITH france_cases AS (
  SELECT
    date,
    SUM(cumulative_confirmed) AS total_cases
  FROM
    `bigquery-public-data.covid19_open_data.covid19_open_data`
  WHERE
    country_name = "France"
    AND date IN ('2020-01-24', '2020-06-15')
  GROUP BY
    date
  ORDER BY
    date
),

summary AS (
  SELECT
    total_cases AS first_day_cases,
    LEAD(total_cases) OVER (ORDER BY date) AS last_day_cases,
    DATE_DIFF(LEAD(date) OVER (ORDER BY date), date, DAY) AS days_diff
  FROM france_cases
  LIMIT 1
)

SELECT
  first_day_cases,
  last_day_cases,
  days_diff,
  POWER(last_day_cases / first_day_cases, 1.0 / days_diff) - 1 AS cdgr
FROM summary;

--
SELECT

  date, SUM(cumulative_confirmed) AS country_cases,

  SUM(cumulative_deceased) AS country_deaths

FROM

  `bigquery-public-data.covid19_open_data.covid19_open_data`

WHERE

  date BETWEEN '2020-03-21'

  AND '2020-04-22'

  AND country_name ="United States of America"

GROUP BY date