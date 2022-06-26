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































