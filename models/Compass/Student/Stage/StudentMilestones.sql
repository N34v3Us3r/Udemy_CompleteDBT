WITH StudentDemo AS
(
    SELECT *
    FROM {{ source('Compass', 'Student') }}
)
SELECT *
FROM StudentDemo
