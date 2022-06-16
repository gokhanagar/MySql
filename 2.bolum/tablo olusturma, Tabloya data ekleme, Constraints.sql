use hastaKayitVeriTabani;
create table ogrenciler
( 
ogrenci_id char(4), 
Isim_soyisim varchar(50), 
not_ort int(5.2), -- 100,00
kayit_tarihi date -- 14-Jan-2021
);

-- Tabloya nasil data eklenir
-- insert into komutu kullanilir ve burada her field'a data tipine uygun olarak bir data eklenir

insert into ogrenciler values ('1234', 'mehmet guzel',85.70,'2022-07-20');
-- tabloya data eklerken tablo olusturma sirasinda kullandigimiz siralalamaya da uymaliyiz
insert into ogrenciler values('Ali Can',65.25,'12-Jan-2021','2345'); 


insert into ogrenciler (ogrenci_id,isim_soyisim) values ('6524','Veli Cem'); 
-- bu durumda deger girmedigimiz field'lar icin database null degeri atar

insert into ogrenciler values('5633', 'Ali Cam',null,'2022-06-21');
delete from ogrenciler where kayit_tarihi = '2014-06-20';

select * from ogrenciler;


-- “tedarikciler” isminde bir tablo olusturun ve “tedarikci_id”, “tedarikci_ismi”, “tedarikci_adres” ve “ulasim_tarihi”   field’lari olsun. 
-- Tablo olusturduktan sonra 3 tane kayit ekleyelim.

CREATE TABLE tedarikciler (
tedarikci_id CHAR(4),
tedarikci_ismi VARCHAR(50),
tedarikci_adres VARCHAR(100),
ulasim_tarihi DATE
);

insert into tedarikciler values ('1234','saticilar as','ankara cankaya','2022-02-25');
insert into tedarikciler values ('1256','pazarlama as','izmir cankaya','2022-03-15');
insert into tedarikciler values ('1534','Mehmet guzel','istanbul','2022-01-17');

SELECT * FROM tedarikciler;


-- Varolan bir tablodan yeni tablo olusturma

CREATE TABLE tedarikci_isim_adres
AS SELECT tedarikci_ismi,tedarikci_adres
FROM tedarikciler;

SELECT  *
FROM tedarikci_isim_adres;

-- ogrenciler tablosundan isim_soyisim ve not_ort fieldlarini alarak yeni bir tablo olusturun

CREATE TABLE ogrenciler_notlar
AS SELECT isim_soyisim,not_ort
FROM ogrenciler;


SELECT *
FROM ogrenciler_notlar;

-- CONSTRAINTS sinirlandirmalar
-- NOT NULL : bir field ile ilgili NOT NULL tanimlamasi yapilirsa o field bos birakilamaz
-- ogrenciler 2 tablosu olusturalim ve id fieldini bos birakilamaz yapalim


CREATE TABLE ogrenciler2
( 
ogrenci_id char(4) NOT NULL, 
Isim_soyisim varchar(50), 
not_ort int(5.2), -- 100,00
kayit_tarihi date -- 14-Jan-2021
);

SELECT *
FROM ogrenciler2;

insert into ogrenciler2 VALUES ('1234', 'hasan yaman',75.70,'2022.07.14');
insert into ogrenciler2 VALUES ('1334', 'Ayse Gul',null,null);
insert into ogrenciler2 (ogrenci_id,isim_soyisim) VALUES ('6587','Hatice Sen');
insert into ogrenciler2 VALUES (null, 'veli gur',85.70,'2022.07.14'); -- id field'i NOT NULL oldugu icin bu kayit eklenmez
INSERT INTO ogrenciler2 (isim_soyisim,not_ort) VALUES ('Yasar Sen',95.73); -- field ismi yazilmayan field'lara SQL otomatik olarak NULL degeri atar
                                                                                                                               --  id field'i NOT NULL oldugu icin bu kayit eklenmez


-- UNIQUE constraint
-- tedarikciler2 tablosu olusturalim, tedarikci_id UNIQUE olsun


CREATE TABLE tedarikciler2 (
tedarikci_id CHAR(4) UNIQUE,
tedarikci_ismi VARCHAR(50),
tedarikci_adres VARCHAR(100),
ulasim_tarihi DATE
);

insert into tedarikciler2 VALUES ('1234','saticilar as','ankara cankaya','2022.01.01');
insert into tedarikciler2 VALUES (null,'balci as','izmir cankaya','2022.01.15');
insert into tedarikciler2 VALUES (null,'mehmet yaman','ankara','2022.01.19');
update tedarikciler2
set ulasim_tarihi = '2022.01.15'
where tedarikci_ismi = 'balci as';

update tedarikciler2
set ulasim_tarihi = '2022.01.19'
where tedarikci_ismi = 'mehmet yaman';

-- unique constraint dublication'a izin vermez ancak null degerini kabul eder ve birden fazla null degerini de kabul eder
insert into tedarikciler2 VALUES ('1234','hasan yaman','ankara','2022-05-07'); -- ORA-00001: unique constraint (HR.SYS_C007014) violated
insert into tedarikciler2 VALUES ('1235','saticilar as','ankara cankaya','2022-05-09');

SELECT *
FROM tedarikciler2;

-- bir tabloya data eklerken mutlaka constraint'lere dikkat etmeliyiz


-- PRIMARY KEY
-- primary key olusturmanin 2 yolu var
-- 1.yol : diger constraintlerde oldugu gibi Primary Key yapmak istedigimiz field in yanina PRIMARY KEY yazabiliriz
-- ogrenciler3 tablosu olusturalim ve ogrenci_id 'yi PRIMARY KEY yapalim


CREATE TABLE ogrenciler3
( 
ogrenci_id char(4) PRIMARY KEY, 
Isim_soyisim varchar(50), 
not_ort int(5.2), -- 100,00
kayit_tarihi date -- 14-Jan-2021
);

SELECT *
FROM ogrenciler3;

insert into ogrenciler3 VALUES ('1234', 'hasan yaman',75.70,'2022-05-09');
insert into ogrenciler3 VALUES (null, 'veli yaman',85.70,'2022-05-09'); -- error
insert into ogrenciler3 VALUES ('1234', 'Ali Can',55.70,'2022-05-10'); -- error
insert into ogrenciler3 (isim_soyisim) VALUES ( 'Veli Cem'); -- error
insert into ogrenciler3 (ogrenci_id) VALUES ( '5687');











