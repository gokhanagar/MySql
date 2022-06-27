use test;
CREATE TABLE personel4 
(
id int(9), 
isim varchar(50), 
sehir varchar(50), 
maas int(20), 
sirket varchar(20)
);

INSERT INTO personel4 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO personel4 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO personel4 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
INSERT INTO personel4 VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO personel4 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel4 VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO personel4 VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
SELECT * FROM personel4;

-- sirketlerin toplam maaslarini gosteren bir sorgu yazin
select sirket, sum(maas)
from personel4
group by sirket;
-- Eger sirketin odedigi toplam maas 10000'den fazla ise 
-- sirketlerin isimlerini ve toplam maaslarini 
select sirket, sum(maas) as toplam_maas
from personel4
group by sirket
having toplam_maas > 10000;

-- sirket isimleri ve  calistirdiklari personel sayisini listeleyen sorgu yazin
select sirket, count(isim)
from personel4
group by sirket;

-- calistirdigi personel sayisi 1 den fazla olan sirket isimlerini ve personel sayilarini listeleyin
select sirket, count(isim) as personel_sayisi
from personel4
group by sirket
having personel_sayisi>1;

-- Ayni isimdeki personelin aldigi max maasi listeleyin
select isim , max(maas)
from personel4
group by isim;

-- ayni isimdeki kisilerden maximum maasi alan kisinin maasi 5000'den cok ise
-- isim ve max maasi listeleyin
select isim, max(maas) as max_maas
from personel4
group by isim
having max_maas > 5000;
-- HAVING komutu AGGREGATE FONKSIYONLAR'i filtrelemek icin kullanilir
-- (normal sorgularda WHERE komutunun yaptigi islev)

-- UNION 
-- Eger tek sorguda birlestiremeyecegim iki sorgunun sonucunu ayni tabloda 
-- gormek istersek UNION islemi kullanilir
-- BU durumda dikkat etmemiz gereken konu iki sorguda da field sayisi ve 
-- alt alta gelecek field data tiplerinin ayni olmasidir
-- 1) Maasi 4000’den cok olan isci isimlerini ve 
--     5000 liradan fazla maas alinan sehirleri  gosteren sorguyu yaziniz

select isim from personel4 where maas>4000
union 
select sehir from personel4 where maas>5000;
--  Ismi Mehmet Ozturk olan kisilerin isim ve maaslarini ve
-- Istanbulda calisanlarin sehir adi ve maaslarini coktan aza sirali olarak listeleyin
select isim,maas from personel4 where isim = 'Mehmet Ozturk'
union
select sehir,maas from personel4 where sehir = 'Istanbul' order by maas desc;

-- union ile yaptigimiz sorguyu siralamak istersek
-- 2.sorgudan sonra ORDER BY yazabiliriz

CREATE TABLE personel_bilgi 
(
id int(9), 
tel char(10) UNIQUE , 
cocuk_sayisi int(2)
); 

INSERT INTO personel_bilgi VALUES(123456789, '5302345678' ,5);
INSERT INTO personel_bilgi VALUES(234567890, '5422345678', 4);
INSERT INTO personel_bilgi VALUES(345678901, '5354561245', 3); 
INSERT INTO personel_bilgi VALUES(456789012, '5411452659', 3);
INSERT INTO personel_bilgi VALUES(567890123, '5551253698', 2);
INSERT INTO personel_bilgi VALUES(456789012, '5524578574', 2);
INSERT INTO personel_bilgi VALUES(123456710, '5537488585', 1);
SELECT * FROM personel_bilgi;

-- id’si 123456789 olan personelin  Personel4 tablosundan sehir ve maasini, 
-- personel_bilgi tablosundan da tel ve cocuk sayisini yazdirin  
select sehir as tel_num_veya_sehir ,maas as cocuk_sayisi_veya_maas from personel4 where id =123456789
union 
select tel,cocuk_sayisi  from personel_bilgi where id = 123456789;

-- UNION ALL
-- personel4 tablosunda ankarada calisan personelin isim ve maaslarini listeleyin
SELECT isim,maas
FROM personel4
WHERE sehir='Ankara';

