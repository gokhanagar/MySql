use test;
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
select * from mart_satislar2;

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
SELECT * FROM nisan_satislar;


select urun_id,urun_isim 
from mart_satislar2
where urun_id in (select urun_id from nisan_satislar where mart_satislar2.urun_id = nisan_satislar.urun_id);

select urun_id,urun_isim 
from nisan_satislar
where exists (select urun_id from mart_satislar2 where mart_satislar2.urun_id = nisan_satislar.urun_id);

-- EXISTS kullanimi IN kullanimina benzer ancak bazi farklililklar var
-- 1)//IN kullanicinca IN komutundan once field ismi yazmak zorundayiz ama exists de field ismi yok
-- 2)//IN komutundan once hangi field ismi yazildiysa subquery de ayni field ismi ile sorgu yapilabilir.
 -- Exists de ilk sorgu ile subquery nin eslesmesi gibi bir sart yok
 -- Exists komutu parantez icinde bir sonuc var mi? diye bakar ve varsa o sonuca gore ilk sorguyu calistiririz
 -- Mart ayinda satilip nisan ayinda satilmayan urun+id ve o urunleri alan musteri isimlerini getiren sorgu yaziniz
select urun_id,urun_isim
from mart_satislar2
where not exists ( select urun_id from nisan_satislar where  nisan_satislar.urun_id=mart_satislar2.urun_id);  

select urun_id,urun_isim
from nisan_satislar
where not exists ( select urun_id from mart_satislar2 where  nisan_satislar.urun_id=mart_satislar2.urun_id);  

CREATE TABLE insanlar
(
ssn char(9),
isim varchar(50),
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa');
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');
select * from insanlar;

 -- isim field i bos olan kayitlarin butun bilgilerini getirin.
select * from insanlar where isim is null;

  -- isim hanesi bos olan kayitlarda isim olarak ISIM Girilmemistir yazdiralim
update insanlar
set isim = 'isim girilmemistir' 
where isim is null;

  -- isim fieldleri bos olmayan kayitlarin tum bilgilerini getiren sorgu yaziniz
select * from insanlar where isim is not null; 

CREATE TABLE insanlar3
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),
adres varchar(50)
);
INSERT INTO insanlar3 VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar3 VALUES(234567890, 'Veli','Cem', 'Ankara');
INSERT INTO insanlar3 VALUES(345678901, 'Mine','Bulut', 'Ankara');
INSERT INTO insanlar3 VALUES(256789012, 'Mahmut','Bulut', 'Istanbul');
INSERT INTO insanlar3 VALUES (344678901, 'Mine','Yasa', 'Ankara');
INSERT INTO insanlar3 VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');
select * from insanlar3;

-- ankarada ki tum insanlari soy isim sirasina gore listeleyen bir sorgu yaziniz
select * from insanlar3 where adres = 'Ankara' order by soyisim;

select * from insanlar3 where adres = 'Ankara' order by soyisim asc;
select * from insanlar3 where soyisim = 'Bulut' order by isim asc;
select * from insanlar3 where adres = 'IStanbul' order by ssn desc;

CREATE TABLE manav 
(
isim varchar(50), 
Urun_adi varchar(50), 
Urun_miktar int(9) 
);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);
select * from manav;

-- isme gore alinan toplam urun miktarini (kg) gosteren bir sorgu yaziniz
select isim, sum(urun_miktari) as toplam_urun_miktari 
from manav
group by isim;  

-- isme gore alinan farkli alisveris sayisini listeleyen sorgu yazin
select isim, count(urun_adi) as alisveris_sayisi
from manav
group by isim;
-- urun adina gore alis veris yapan kisi sayisini veren bir sorgu yazin
select urun_adi, count(isim)
from manav
group by urun_adi;

-- urun'e gore satilan toplam miktari sirali olarak veren sorgu yazin
select urun_adi, sum(urun_miktari)
from manav
group by urun_adi;








