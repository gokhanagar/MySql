use test;
CREATE TABLE sirketler2(
sirket_id int(9),
sirket_isim varchar(20)
);

INSERT INTO sirketler2 VALUES(100, 'Toyota');
INSERT INTO sirketler2 VALUES(101, 'Honda');
INSERT INTO sirketler2 VALUES(102, 'Ford');
INSERT INTO sirketler2 VALUES(103, 'Hyundai');
select * from sirketler2;

CREATE TABLE siparisler(
siparis_id int(9),
sirket_id int(9),
siparis_tarihi date
);
select * from siparisler;

INSERT INTO siparisler VALUES(11, 101, '17.05.2020');
INSERT INTO siparisler VALUES(22, 102, '18-Apr-2020');
INSERT INTO siparisler VALUES(33, 103, '19-Apr-2020');
INSERT INTO siparisler VALUES(44, 104, '20-Apr-2020');
INSERT INTO siparisler VALUES(55, 105, '21-Apr-2020');

-- her iki tabloda ortak olan sirket_id'leri icin sirketler tablosundan sirket ismi,
-- siparisler tablosundan siparis_tarhi bilgilerini lsitelyen sorgu yaziniz
select sirketler2.sirket_id, siparisler.siparis_tarihi
from sirketler2 inner join siparisler
on sirketler2.sirket_id = siparisler.sirket_id;
-- INNER JOIN: her iki tabloda ortak olan record'lara ait bilgileri getirir

-- sirketler2 tablosunda bulunan tum sirketler icin,sirket ismi
-- ve varolan siparis_id'lerini yazdiran sorgu yazdirin
select sirketler2.sirket_id, siparisler.siparis_id
from sirketler2 left join siparisler
on sirketler2.sirket_id = siparisler.sirket_id;

-- tum siparis id ve siparis tarihlerini ve varsa sirket isimlerini listeleyen sorgu yaziniz
select sirketler2.sirket_isim, siparisler.siparis_id,siparisler.siparis_tarihi
from siparisler right join sirketler2
on sirketler2.sirket_id = siparisler.sirket_id;

-- LEFT JOIN de tum kayitlari almak istedigimiz tabloyu sola (left)
-- RIGHT JOIN de tum kayitlari almak istedigimiz tabloyu saga(right) yaziyoruz
-- Kullanimda bunun disinda her hangi bir fark yok

-- Her iki tabloda bulunan tum kayitlar icin sirket ismi ve siparis tarihlerini yazdirin
select sirketler2.sirket_isim, siparisler.siparis_tarihi
from sirketler2 FULL JOIN siparisler
on sirketler2.sirket_id = siparisler.sirket_id;


CREATE TABLE musteriler2
(
id int(10) UNIQUE,
isim varchar(50) NOT NULL, 
gelir int(6)
);

INSERT INTO musteriler2 (id, isim, gelir) VALUES (1001, 'Ali', 62000);
INSERT INTO musteriler2 (id, isim, gelir) VALUES (1002, 'Ayse', 57500);
INSERT INTO musteriler2 (id, isim, gelir) VALUES (1003, 'Feride', 71000);
INSERT INTO musteriler2 (id, isim, gelir) VALUES (1004, 'Fatma', 42000);
INSERT INTO musteriler2 (id, isim, gelir) VALUES (1005, 'Kasim', 44000);

-- id 'si 1002 den buyuk olan isimleri ve gelirleri yazdirin
SELECT isim,gelir
FROM musteriler2
WHERE id>1002;

-- ismi F ile baslayan musterileri ve gelirlerini yazdirin
SELECT isim,gelir
FROM musteriler2
WHERE isim LIKE 'F%';

-- ismi Fa ile baslayan
SELECT isim,gelir
FROM musteriler2
WHERE isim LIKE 'Fa%';

-- ismi e ile biten

SELECT isim,gelir
FROM musteriler2
WHERE isim LIKE '%e';

-- isminin icinde i harfi olanlar 
SELECT isim,gelir
FROM musteriler2
WHERE isim LIKE '%i%';

-- minumum 5 harfli isimleri getiren 
SELECT isim,gelir
FROM musteriler2
WHERE isim LIKE '%_____%';

-- ikinci harfi a olanlari getiren
SELECT isim,gelir
FROM musteriler2
WHERE isim LIKE '_a%';

-- isminin ilk harfi haric atma olan
SELECT isim,gelir
FROM musteriler2
WHERE isim LIKE '_atma';


