
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

create table parents
(
	student_id smallint,
	student_name varchar(50),
	student_age smallint,
	student_dob date,
	constraint student_id_pk primary key(student_id)
)

create table students
(
	student_id smallint,
	student_name varchar(50),
	student_age smallint,
	student_dob date,
	constraint student_id_fk1 foreign key(student_id) references parents(student_id)
)

create table students
(
	student_id smallint primary key,
	student_name varchar(50) unique,
	student_age smallint,
	student_dob date,
	constraint student_age_check check (student_age between 0 and 30),
	constraint student_name_upper_case check (student_name = upper(student_name))
)


--tum sutunlara veri girme

insert into students values('101', 'ALI CAN', '13', '10-Sep-2022') 
insert into students values('102', 'KEMAL LEK', '15', '25-Aug-2019')

insert into students values('103', 'AYSE GUZEL', '23','08-Aug-2007')
insert into students values('104', 'KEMAL OZTURK', '27',null)

insert into students values('105', 'JIM CARREY', '25','08-Aug-2009')
insert into students values('106', 'TOM HANKS', 30,'12-Sep-1996')
insert into students values('108', null, null, null)

--Belirli bir sutuna veri nasil girilir
insert into students(student_id,student_age) values('107',17)
insert into students(student_name, student_id, student_age) values('JOHN WALKER','109',24)


#Var olan bir data nasil degistirilir
update students
set student_name = 'LEO OCEAN'
where student_id = '107'

--John walker, dob sutununu 11-Dec-1997 degerine degistirin
update students
set student_dob = '11-Dec-1997'
where student_id = '109'

--Cok hucre nasil degistirilir
--105 id'lidob hucresini 11-Apr-1996 degerine ve name hucresini TOM HANKS degerine guncelle
update students
set student_dob = '11-Apr-1996',
	student_name = 'KEMAL SUNAL'
where student_id = '105'

--Coklu satir nasil guncellenir
--105 ten kucuk tum dob degerlerini 01-Aug-2021
update students
set student_dob = '01-Aug-2021'
where student_id < 105

--tum age degerlerini en yuksek age degerine guncelle
update students
set student_age = (select max(student_age) from students)

--tum dob degerlerini minimum dob degerine guncelle
update students
set student_dob = (select min(student_dob) from students)














































