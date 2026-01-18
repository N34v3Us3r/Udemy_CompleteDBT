WITH StudentDemo AS
(
    SELECT *
    FROM {{ ref('Student') }}
)

, TimeSliceAttendanceLineWholeDay AS
(
    SELECT *
    FROM {{ ref('TimeSliceAttendanceLineWholeDay') }}
)

SELECT *
FROM StudentDemo, TimeSliceAttendanceLineWholeDay
