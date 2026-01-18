WITH AttendanceWholeDay AS
(
    SELECT *
    FROM {{ source('Compass', 'TimeSliceAttendanceLineWholeDay') }}
)
SELECT *
FROM AttendanceWholeDay
