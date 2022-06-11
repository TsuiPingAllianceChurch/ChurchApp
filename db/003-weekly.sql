insert into AttendanceRecord (worship_id, user_id, created_date)
select worship_id, user_id, created_date from Attendance;


truncate table Attendance;

