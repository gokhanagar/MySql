use test;
CREATE TABLE musteriler
(
urun_id int(10),
musteri_isim varchar(50),
urun_isim varchar(50)
);

INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler  VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (20, 'John', 'Apple');
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm');
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple');
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange');
INSERT INTO musteriler VALUES (40, 'John', 'Apricot');
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');

-- musteriler tablosundan orange veya apple alan musterileri listeleyin
select * from musteriler where urun_isim = 'Orange' or urun_isim = 'Apple';

-- ismi mark,john veya adem olan musterilerin aldiklari urun isimlerini listeleyin
select urun_isim from musteriler where musteri_isim in('Mark','John','Adem');

-- orange,palm veya apricot alan musterilerin tum bilgilerini listeleyin
select * from musteriler where urun_isim in('Orange','Apricot','Palm');

-- urun id si 20 den buyuk ve 40 dan kucuk olan urunleri alan musteri isimlerini listeleyin
select musteri_isim from musteriler where urun_id>20 and urun_id<40;

-- urun id si 20 ye esit veya buyuk ve 40 dan kucuk veya esit olan urunleri alan musteri isimlerini listeleyin
select musteri_isim from musteriler where urun_id>=20 and urun_id<=40;

-- sinirlar dahil ise BETWEEN komutunu kullaniriz 
select musteri_isim from musteriler where urun_id between 20 and 40;

-- musteri isminin ilk harfi b'den sonra k'dan once olan musterilerin aldiklari urunleri listeleyin
select musteri_isim from musteriler where musteri_isim between 'B' and 'K';

-- urun id si 20 den kucuk veya 30 dan buyuk olan urunleri satin alan musteri isimlerini listeleyin
select musteri_isim from musteriler where urun_id not between 20 and 30;
-- Eger bir aralikta olmayan degerleri bulmak istiyorsak NOT BETWEEN kullanabiliriz


CREATE TABLE workers(
id CHAR(9) UNIQUE,
isim VARCHAR(50) ,
soyisim VARCHAR(50),
email VARCHAR(50),
ise_bas_tar DATE,
is_unvani VARCHAR(100),
maas int(5)
);

INSERT INTO WORKERS VALUES (123456789,'Ali','Can','alican@gmail.com','10-05-10','isci',5000);
INSERT INTO WORKERS VALUES (123456788,'Veli','Cem','velicem@gmail.com','10-05-12','isci',5500);
INSERT INTO WORKERS VALUES (123456787,'Ayse','Gul','aysegul@gmail.com','01-06-14','muhasebeci',4500);
INSERT INTO WORKERS VALUES (123456786,'Fatma','Yasa','fatmayasa@gmail.com','10-05-09','muhendis',7500);

-- maasi 5000'den az olan veya unvani isci olan kisilerin isim soyisimlerini yazdirin
select isim,soyisim from workers where maas<5000 or is_unvani='isci';

-- ismi B harfi ile L harfi arasinda olan kisilerin unvan ve maaslarini listeleyin
select is_unvani,maas from workers where isim between 'B' and 'L';

-- maasi 6000'den az olanlara %10 zam yapin
update workers
set maas = maas *1.1
where maas<6000;

-- 1 ocak 2011 den once ise girenlere 500 lira zam yapin
update workers
set maas = maas + 500
where ise_bas_tar < '01-01-11';











