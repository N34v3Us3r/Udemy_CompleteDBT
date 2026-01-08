WITH dates AS
(
    select try_to_timestamp(started_at) started_at_ts
    , *
    from {{ source('demo', 'bike') }}
    where try_to_timestamp(started_at) IS NOT NULL 
)
, cte AS
(
    select to_date(started_at_ts) date_started_at
    , hour(started_at_ts) hour_started_at
    , dayofweek(started_at_ts) day_of_week_started_at
    , CASE WHEN dayname(started_at_ts) IN ('Sat', 'Sun')
        THEN 'Weekend'
        ELSE 'BusinessDay'
        END Day_Type
    , CASE 
        WHEN MONTH(started_at_ts) IN (12, 1, 2)
            THEN 'Winter'
        WHEN MONTH(started_at_ts) IN (3, 4, 5)
            THEN 'Sprimg'
        WHEN MONTH(started_at_ts) IN (6, 7, 8)
            THEN 'Summer'
        WHEN MONTH(started_at_ts) IN (9, 10,11)
            THEN 'Fall'
        END station_of_year        
    from dates
)
select *
from cte
order by date_started_at
