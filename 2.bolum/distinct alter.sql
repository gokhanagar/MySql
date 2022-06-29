use test;
select * from insanlar;
select UPPER(isim) from insanlar;
select LOWER(isim) from insanlar;

-- Manav tablosundan isim ve urun adlarini kucuk  harf olarak listeleyin
select LOWER(isim),LOWER(urun_adi) from manav;

-- workers tablosunda Ismi kucuk harf, soyismi buyukharf, email'i sadece ilk harf buyuk olarak listeleyin
select LOWER(isim), UPPER(soyisim), UPPER(LEFT(email,1)) from workers;

-- MANAV daki tum urunleri listeleyin
select urun_adi from manav;
-- TEKRAR EDEN DEGERLERI gormek istemiyorsak DISTINCT komutu kullanilir
select DISTINCT urun_adi from manav;

-- Kac farkli musteri vardir?
select count(distinct(isim)) from manav;

-- Kac farkli urun satilmaktadir
select count(distinct(urun_adi)) from manav;

CREATE TABLE personel6 
(
id int(9), 
isim varchar(50), 
sehir varchar(50), 
maas int(20), 
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY (id)
);
INSERT INTO personel6 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO personel6 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO personel6 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
INSERT INTO personel6 VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO personel6 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel6 VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO personel6 VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
select * from personel6;
-- tabloya cocuk sayisi field'i ekleyelim
alter table personel6 add cocuk_sayisi int(2);

update personel6
set cocuk_sayisi=1
where isim='Mehmet Ozturk';

-- tabloda cocuk sayisi field'inda null degerler yerine 0 yazdirin
update personel6
set cocuk_sayisi=1
where cocuk_sayisi is null;

-- ULKE field'i ekleyin ve default olarak ulke ismini 'Turkiye' girin
alter table personel6 add ulke varchar(20) default 'Netherlands';

-- Telefon ve adres field'i ekleyin
alter table personel6 add (telefon char(11), adres varchar(50)); 

-- Tablodan ulke field'ini silin
alter table personel6 drop column ulke;
select * from personel6;

-- tablodan telefon'u silelim
alter table personel6 drop telefon;

-- tablodaki maas fieldinin adini aylik diye degistirin
alter table personel6
rename column maas to aylik;

-- Tablonun adini personel6 degil new_personel
ALTER TABLE personel6
RENAME TO new_personel;
select * from new_personel;


-- cocuk sayisi field'inin data tipini varchar2 yapalim
ALTER TABLE new_personel
MODIFY cocuk_sayisi VARCHAR(20);



