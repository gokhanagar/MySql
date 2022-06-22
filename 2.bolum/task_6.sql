-- Create işçi tablosu alanları worker_id,work_name,work_salary şeklindedir.
-- worker_id, worker_id_pk adında primary key sahip olacak
-- İşçiler tablosuna 4 kayıt ekleyin
-- Konsoldaki tabloya bakın

create table if not exists isciler(
worker_id int,
worker_name varchar(50),
work_salary int,
constraint worker_id_pk primary key (worker_id)
);

insert into isciler values(100,"oli Can",2000);
insert into isciler values(102,"Veli Han",1800);
insert into isciler values(103,"Ayse Kan",2200);
insert into isciler values(104,"Angie Ocean",2590);
SELECT * FROM isciler;
update isciler set worker_name='Ali Can', worker_id=101 where work_salary=2000;

-- Veli Han'ın maaşını en yüksek maaştan yüzde 20 daha azına artırin
update isciler set work_salary=(select max(work_salary)from(select * from isciler) as yeni_maas)*0.8 where worker_name='Veli Han';

-- Ali Can'ın maaşını en düşük maaştan yüzde 30 daha fazla düşürun
update isciler set work_salary=(select min(work_salary)from(select * from isciler) as yeni_maas)*1.3 where worker_name='Ali Can';

-- Maaş ortalama maaştan düşükse maaşları 1000 artırın
update isciler set work_salary=work_salary+1000 where work_salary<(select avg(work_salary) from (select work_salary from isciler)as a);

-- Maaşın ortalama maaştan az olması durumunda maaşları ortalama maaşa eşit artırın
update isciler set work_salary=(select avg(work_salary) from (select work_salary from isciler)as a)
where work_salary<(select avg(work_salary) from (select work_salary from isciler)as a);



CREATE TABLE people 
(
    ssn CHAR (9),
    name VARCHAR(50),
    address VARCHAR(80)
);
select * from people;



INSERT INTO PEOPLE VALUES (123456789, 'Mark Star', 'Florida');
INSERT INTO PEOPLE VALUES (234567890, 'Angie Way', 'Virginia');
INSERT INTO PEOPLE VALUES (345678901, 'Marry Tien', 'New Jersey');
INSERT INTO PEOPLE (ssn, address) VALUES (456789012, 'Michigan');
INSERT INTO PEOPLE (ssn, address) VALUES (567890123, 'California');
INSERT INTO PEOPLE (ssn, name) VALUES (567890123, 'California');

-- Boş adları "ad daha sonra eklenecek" olarak değiştirin
update people set name='ad daha sonra eklenecek' where name is null;

-- Boş adresleri 'Adres daha sonra eklenecek' olarak değiştirin
update people set address='Adres daha sonra eklenecek' where address is null;

-- people tablosunda 'Daha sonra eklenecek' tüm boş değerleri değiştirin -- COALESCE ALANLARA GİDER VE BOŞ DEĞERLERİ İKİNCİ PARAMETREYE DEĞİŞTİRİN

