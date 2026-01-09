WITH trip_cte AS 
(
    SELECT *
    FROM {{ref('trip_fact')}}
)

, weather_cte AS
(
    SELECT *
    FROM {{ref('daily_weather')}}
)

SELECT *
FROM trip_cte t
JOIN weather_cte w  
ON TRY_TO_DATE(t.trip_date) = w.daily_weather::DATE
