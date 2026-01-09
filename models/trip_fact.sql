WITH trips  AS
(
    SELECT ride_id
    , rideable_type
    , TRY_TO_TIMESTAMP(started_at)::DATE trip_date
    , start_station_id
    , end_station_id
    , member_casual
    , TIMESTAMPDIFF(SECONDS, TRY_TO_TIMESTAMP(started_at), TRY_TO_TIMESTAMP(ended_at)) trip_duration_seconds
    FROM {{ ref('stage_bike') }}
    WHERE TRY_TO_TIMESTAMP(started_at) IS NOT NULL
)

SELECT *
FROM trips