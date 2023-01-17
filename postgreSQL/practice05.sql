create table workers
(
	id int,
	name varchar(20),
	title varchar(20),
	manager_id int
)

INSERT INTO workers VALUES(1, 'Ali Can', 'Dev', 2);
INSERT INTO workers VALUES(2, 'John Davis', 'QA', 3);
INSERT INTO workers VALUES(3, 'Angie Star', 'Dev Lead', 4);
INSERT INTO workers VALUES(4, 'Amy Sky', 'CEO', 5 );

select * from workers

-- 1 Tabloya company_industry isminde sütun ekleyiniz
alter table workers add company_industry varchar(20);

-- TABLOYA worker_address sütunu ve default olarakta 'Miami, FL, USA' adresini ekleyiniz.
alter table workers add worker_address varchar(100) default 'Miami, FL, USA'

-- tablodaki worker_address sütununu siliniz
alter table workers drop worker_address;

-- Tablodaki company_industry sütununu, company_profession olarak değiştiriniz.
alter table workers rename company_industry to company_profession;
select * from workers

-- Tablonun ismini employees olarak değişitiriniz.
alter table workers rename to employees; 
select * from employees

-- Tablodaki title sütununa data tipini VARCHAR(50) olarak değiştiriniz.
alter table employees alter  title type varchar(40); --alter table employees alter column title type varchar(50);

-- Tablodaki title sütununa "UNIQUE" kısitlaması ekleyiniz.
alter table employees add constraint title unique(title);




































