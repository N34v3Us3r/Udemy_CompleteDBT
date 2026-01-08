WITH daily_weather AS
(
    SELECT DATE(TIME) AS daily_weather
    , weather
    , temp
    , pressure
    , humidity
    , clouds
    FROM {{ source('demo', 'weather') }}

)

, daily_weather_agg AS
(
    SELECT daily_weather
    , weather
    , round(avg(temp), 2) avg_temp
    , round(avg(pressure), 2) avg_pressure
    , round(avg(humidity), 2) avg_humidity
    , round(avg(clouds),2) avg_clouds
    -- , count(weather)
    -- , ROW_NUMBER () OVER (PARTITION BY daily_weather ORDER BY COUNT(weather) DESC) weather_order
    FROM daily_weather
    GROUP BY daily_weather
    , weather
    QUALIFY ROW_NUMBER () OVER (PARTITION BY daily_weather ORDER BY COUNT(weather) DESC) = 1 
     
)
SELECT *
FROM daily_weather_agg
