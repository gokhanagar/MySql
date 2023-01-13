
create table students
(
	student_id smallint,
	student_name varchar(50),
	student_age smallint,
	student_dob date
)

select * from students

create table student_name_age
as select student_name,student_age
from students

drop table students


create table students
(
	student_id smallint primary key,
	student_name varchar(50) not null,
	student_age smallint,
	student_dob date unique
)

drop table students

create table students
(
	student_id smallint,
	student_name varchar(50),
	student_age smallint,
	student_dob date,
	constraint student_id_pk primary key(student_id)

)






















