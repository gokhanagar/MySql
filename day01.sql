create database test;
-- create database: database olustururuz

use test;
-- birden fazla database var ise "use" komutu ile calisacagimiz database'i seceriz

-- TABLO OLUSTURMA
create table student
(
id varchar(4),
name varchar(30),
age int
);

-- Veri Girisi
insert into student values('1000','kemal Gur',25);
insert into student values('1001','Canan Yaman',20);
insert into student values('1002','Meltem Tan',32);
insert into student values('1003','Omer Atalay',18);

select * from student;
-- student tablosundaki herseyi getirir

select id from student;
-- student tablosundaki id'leri getirir

select id,name from student;

drop table student;
-- drop table tabloyu siler






