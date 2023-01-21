============================================================
interview questions 
CREATE TABLE personel6
(
id int, 
isim varchar(50), 
sehir varchar(50), 
maas int, 
sirket varchar(20)
);

INSERT INTO personel6 VALUES(123456789, 'Johnny Walk', 'New Hampshire', 2500, 'IBM');
INSERT INTO personel6 VALUES(234567891, 'Brian Pitt', 'Florida', 1500, 'LINUX');
INSERT INTO personel6 VALUES(245678901, 'Eddie Murphy', 'Texas', 3000, 'WELLS FARGO');
INSERT INTO personel6 VALUES(456789012, 'Teddy Murphy', 'Virginia', 1000, 'GOOGLE');  
INSERT INTO personel6 VALUES(567890124, 'Eddie Murphy', 'Massachuset', 7000, 'MICROSOFT');
INSERT INTO personel6 VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'TD BANK');
INSERT INTO personel6 VALUES(123456719, 'Adem Stone', 'New Jersey', 2700, 'IBM');

SELECT *
FROM personel6;

CREATE TABLE isciler 
(
id int,
isim varchar(50), 
sehir varchar(50), 
maas int, 
sirket varchar(20)
);

INSERT INTO isciler VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO isciler VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO isciler VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO isciler VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO isciler VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO isciler VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO isciler VALUES(123456710, 'Mark Stone', 'texas', 2700, 'IBM');

SELECT *
FROM isciler;

-- 1) Her iki tablodaki ortak id’leri ve 
--     personel6 tablosunda bu id’ye sahip isimleri
-- isme gore sirali olarak listeleyen query yaziniz

select isim,id from personel6
where exists(select id from isciler where personel6.id = isciler.id )
order by isim

-- 2) Her iki tablodaki ortak id ve isme sahip kayitlari listeleyen query yaziniz
SELECT id, isim
FROM personel6

INTERSECT

SELECT id, isim
FROM isciler;

-- 3) Personel6 tablosunda kac farkli sehirden personel var?
select count(distinct sehir) asfarkli_sehir_sayisi from personel6

-- 4) Personel6 tablosunda id’si cift sayi olan personel’in tum bilgilerini listeleyen Query yaziniz
select * from personel6
where mod(id,2)=0

-- 5) Personel6 tablosunda kac tane kayit oldugunu gosteren query yazin
select count(*) as kayit_sayisi from personel6

-- 6) Isciler tablosunda en yuksek maasi alan kisinin tum bilgilerini gosteren query yazin
select * from isciler where maas = (select max(maas) from isciler  )

-- 7) Personel6 tablosunda en dusuk maasi alan kisinin tum bilgilerini gosteren query yazin
select * from personel6 where maas = (select min(maas) from personel6)

-- 8) Isciler tablosunda ikinci en yuksek maasi maasi gosteren query yazin
select maas,isim from isciler where exists (select maas from isciler  )
order by maas desc limit 1 offset 1

SELECT MAX(maas),isim
FROM isciler
group by isim
having max(maas)<(SELECT MAX(maas) FROM isciler) limit 1;
                            
-- Isciler tablosunda ikinci en yuksek maasi alan kisinin tum bilgilerini listeleyen sorgu yaziniz
select * from isciler where exists (select maas from isciler  )
order by maas desc limit 1 offset 1

SELECT *
FROM isciler 
WHERE maas=(SELECT MAX(maas) FROM isciler
                        WHERE maas<>(SELECT MAX(maas) FROM isciler));
                                                     
													 
-- Isciler tablosunda en yuksek maasi alan iscinin disindaki tum iscilerin, tum bilgilerini gosteren query yazin
select * from isciler where maas <> (select max(maas) from isciler)
































