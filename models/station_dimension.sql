WITH station_recs AS
(
    SELECT start_station_name station_name
    , start_station_id station_id
    , start_lat
    , start_lng
    FROM {{ ref('stage_bike') }}
    WHERE ride_id <> 'ride_id'
    QUALIFY ROW_NUMBER () OVER (PARTITION BY start_station_id ORDER BY start_station_id) = 1
)

select *
from station_recs