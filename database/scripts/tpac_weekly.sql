select count(*) from AttendanceRecord;

insert into AttendanceRecord (user_id, worship_id, created_date)
select user_id, worship_id, created_date from Attendance;

select count(*) from AttendanceRecord;

truncate table Attendance;

commit;