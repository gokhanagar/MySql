use okul;
create table mart_satislar(
urun_id char(2),
musteri_isim varchar(30),
urun_isim varchar(30),
urun_fiyat varchar(15)
);

INSERT INTO mart_satislar VALUES (10, 'Ali', 'Honda',75000);
INSERT INTO mart_satislar VALUES (10, 'Ayse', 'Honda',95200);
INSERT INTO mart_satislar VALUES (20, 'Hasan', 'Toyota',107500);
INSERT INTO mart_satislar VALUES (30, 'Mehmet' , 'Ford', 112500);
INSERT INTO mart_satislar VALUES (20, 'Ali', 'Toyota',88000);
INSERT INTO mart_satislar VALUES (10, 'Hasan', 'Honda',150000);
INSERT INTO mart_satislar VALUES (40, 'Ayse', 'Hyundai',140000);
INSERT INTO mart_satislar VALUES (20, 'Hatice', 'Toyota',60000);

select musteri_isim from mart_satislar;
-- urun id 40 olan tum urunlerin musteri isimlerini  listeleyecek bir sorgu (Query) yazin
select musteri_isim from mart_satislar where urun_id = 40;

-- urun fiyati 90000 den fazla olan urun isimlerini listeleyen query yaziniz
select musteri_isim from mart_satislar where urun_fiyat >90000;

-- urun id si 20 den buyuk olan urunlerin ismlerini ve musteri isimlerini yazdiran query yaziniz
select urun_isim,musteri_isim from mart_satislar where urun_id>20;

-- urun id si 20'den kucuk veya 30'dan buyuk olan urunlerin fiyatlarini listeleleyen query yazin
select urun_fiyat from mart_satislar where urun_id<20 or urun_id>30;

-- ismi ali veya urun ismi Honda olanlarin urun id ve urun fiyatlarini yazdirin
select urun_id, urun_fiyat from mart_satislar where musteri_isim = 'Ali' or urun_isim = 'Honda';

-- mehmet ismini bana getirecek bir sorgu yazin
select * from mart_satislar where musteri_isim = 'Mehmet';































