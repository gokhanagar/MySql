create table workers
(
	worker_id smallint,
	worker_name varchar(50),
	worker_salary smallint,
	constraint worker_id_pk primary key(worker_id)
)

insert into workers values(101, 'ali can', 12000)
insert into workers values(102, 'veli han',2000)
insert into workers values(103, 'ayse kan',4000
insert into workers values(104, 'angie ocean',7000)

--veli han'in maas degerini en yuksek maas degerinin %20 dusugune yazdir
update workers
set worker_salary = (select max(worker_salary)*0.8 from workers )
where worker_id = 102

--Ali can maas degerini en dusuk maas degerinin %30 fazlasina getirin
update workers
set worker_salary = (select min(worker_salary*1.3) from workers)
where worker_id = 101

--Ortalama maas degerinden dusuk olan maaslari 1000 arttirin.
update workers
set worker_salary = worker_salary + 1000
where worker_salary < (select avg(worker_salary) from workers)

--ortalama maas degerinden dusuk maas degerlerine ortalama maas kadar arttirin
update workers
set worker_salary = (select avg(worker_salary) from workers)
where worker_salary< (select avg(worker_salary) from workers)


select worker_id as id, worker_name as isim from workers

-- Tabloda kucuk harfli ama buyuk harf olarak getir(upper)
select worker_id as id, worker_name as isim from workers
where upper(worker_name) = 'ALI CAN'


select  worker_name,worker_salary, worker_salary*1.3 as zamli from workers

























































