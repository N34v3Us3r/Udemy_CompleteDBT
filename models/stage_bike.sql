WITH stg_bike AS
(SELECT *
FROM {{ source('demo', 'bike') }}
WHERE TRY_TO_TIMESTAMP(started_at) IS NOT NULL)

SELECT *
FROM stg_bike
ORDER BY started_at