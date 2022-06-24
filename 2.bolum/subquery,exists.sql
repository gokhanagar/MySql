use test;
CREATE TABLE personel3 
(
id int(9), 
isim varchar(50), 
sehir varchar(50), 
maas int(20), 
sirket varchar(20)
);

INSERT INTO personel3 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Honda');
INSERT INTO personel3 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'Toyota');
INSERT INTO personel3 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Honda');
INSERT INTO personel3 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Ford');
INSERT INTO personel3 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Hyundai');
INSERT INTO personel3 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Ford');
INSERT INTO personel3 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Honda');
select * from personel3;

CREATE TABLE sirketler
(
sirket_id int(9), 
sirket varchar(20), 
personel_sayisi int(20)
);

INSERT INTO sirketler VALUES(100, 'Honda', 12000);
INSERT INTO sirketler VALUES(101, 'Ford', 18000);
INSERT INTO sirketler VALUES(102, 'Hyundai', 10000);
INSERT INTO sirketler VALUES(103, 'Toyota', 21000);
INSERT INTO sirketler VALUES(104, 'Mazda', 17000);
select * from sirketler;

-- izmirde calisan Veli YIlmaz'in maasini 2000 yapin
update personel3
set maas = 2000
where sehir = 'Izmir';

-- personel sayisi 10000 olan sirketten personel 3 tablosunda bulunan kisinin maasini 6000 yapin
update personel3
set maas = 6000
where sirket = (select sirket from sirketler where personel_sayisi = 10000);
-- WHERE komutundan sonra = kullaniyorsak esitligin sonrasinda sorgunun sadece 1 deger dondureceginden emin olmaliyiz
-- eger sorgunun kac sonuc dondurecegini bilmiyorsak veya birden fazla sonuc dondurecegini biliyorsak
-- o zaman WHERE komutundan sonra = yerine IN kullanmaliyiz

-- izmir,istanbul veya bursada personeli bulunan sirketlerin calisan sayilarini listeleyin
select personel_sayisi, sirket from sirketler 
where sirket in (select sirket from personel3 where sehir in('Izmir','Istanbul','Bursa'));

-- Personel sayisi 15.000’den cok olan sirketlerin isimlerini ve bu sirkette calisan personelin isimlerini listeleyin
select isim, sirket from personel3 where sirket in (select sirket from sirketler where personel_sayisi>15000);

-- Sirket_id’si 101’den buyuk olan sirketlerin verdikleri maaslari ve o maasi alanlarin sehirlerini listeleyiniz                                 
select maas, sehir from personel3 where sirket in(select sirket from sirketler where sirket_id>101);

-- SELECT'den sonra kullanilabilir
-- Honda'da calisan personelin id,isim ve maaslarini listeleyin
-- *** SELECT den sonra SUBQUERY yazarsak sorgu sonucunun sadece 1 deger getireceginden emin olmaliyiz
-- bir tablodan tek deger getirebilmek icin ortalama AVG , toplam SUM, adet COUNT, MIN, MAX  gibi
-- fonksiyonlar kullanilir ve bu fonksiyonlara AGGREGATE FONKSIYONLAR denir
select id,isim,maas from personel3 where sirket ='Honda';

-- Her sirketin ismini, personel sayisini ve personelin ortalama maasini listeleyen bir QUERY yazin.
select sirket , personel_sayisi, (select avg (maas) from personel3 where sirketler.sirket = personel3.sirket) as ortalama_maas
from sirketler;

-- sirketlerin id, isim ve max maas miktarini listeleyin
select sirket_id,sirket,(select max(maas) from personel3 where sirketler.sirket = personel3.sirket) as maksimum_maas
from sirketler;

-- sirket ismi,personel sayisi ve bulundugu toplam sehir sayisini listeleyin
select sirket,personel_sayisi,(select count(sehir) from personel3 where sirketler.sirket = personel3.sirket) as sehir_sayisi
from sirketler;

-- sirket id,sirket adi ve tablodaki personele odenen toplam maasi listeleyin
select sirket_id,sirket,(select sum(maas) from personel3 where sirketler.sirket = personel3.sirket) as toplam_maas 
from sirketler;

-- sirket id, sirket ismi, sirketteki min maas, sirketteki max maas, sirketteki ort.maas lari yazdirin 
select sirket_id,sirket,(select max(maas) from personel3 where sirketler.sirket = personel3.sirket) as maksimum_maas,
(select min(maas) from personel3 where sirketler.sirket = personel3.sirket) as minumum_maas,
(select avg (maas) from personel3 where sirketler.sirket = personel3.sirket) as ortalama_maas
from sirketler;



-- IN : eger istedigimiz degerleri AND,OR gibi mantiksal operatorlerlerle tek tek yazmak istemiyorsak
-- IN (istegimiz tum degerler ) seklinde yazabiliriz

-- EXISTS () komutu da IN ile ayni kullanima sahiptir

CREATE TABLE mart_satislar2 
(
urun_id int(10),
musteri_isim varchar(50), 
urun_isim varchar(50)
);

INSERT INTO mart_satislar2 VALUES (10, 'Mark', 'Honda');
INSERT INTO mart_satislar2 VALUES (10, 'Mark', 'Honda');
INSERT INTO mart_satislar2 VALUES (20, 'John', 'Toyota');
INSERT INTO mart_satislar2 VALUES (30, 'Amy', 'Ford');
INSERT INTO mart_satislar2 VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart_satislar2 VALUES (10, 'Adem', 'Honda');
INSERT INTO mart_satislar2 VALUES (40, 'John', 'Hyundai');
INSERT INTO mart_satislar2 VALUES (20, 'Eddie', 'Toyota');

SELECT *
FROM mart_satislar2;


CREATE TABLE nisan_satislar 
(
urun_id int(10),
musteri_isim varchar(50), 
urun_isim varchar(50)
);

INSERT INTO nisan_satislar VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan_satislar  VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan_satislar VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan_satislar VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan_satislar VALUES (20, 'Mine', 'Toyota');

SELECT *
FROM nisan_satislar;

SELECT urun_id,musteri_isim
FROM mart_satislar2
WHERE urun_id IN (SELECT urun_id
                                FROM nisan_satislar
                                WHERE nisan_satislar.urun_id = mart_satislar2.urun_id);
                                
SELECT urun_id,musteri_isim
FROM mart_satislar2
WHERE NOT EXISTS (SELECT urun_id
                                FROM nisan_satislar
                                WHERE nisan_satislar.urun_id = mart_satislar2.urun_id);



