use test;

create table trainee
(
id int,
isim varchar(40),
adres varchar(100),
sinav_notu int
);

insert into trainee values('120','Ali Can','Ankara','95');
insert into trainee values('121','Canan Yaman','Trabzon','45');
insert into trainee values('122','Meltem Tan','Istanbul','65');
insert into trainee values('123','Omer Atalay','Mersin','75');

-- SELECT -WHERE
/*
Verileri SELECT komutu ile veritabanindan cekerken filtreleme yapmak icin SELECT
ile birlikte WHERE komutu kullanilir.
select sutun1, sutun2 ....
from tablo adi where kosul
*/

-- Soru01: Sinav notu 80'den buyuk olan ogrencilerin bilgilerini listele
select * from trainee where sinav_notu>80; 

-- Soru02: Adresi Ankara olan ogrencilerin isim ve adres bilgilerini listele
select isim, adres from trainee where adres ='Ankara';

-- Soru03:id'si 123 olan ogrencilerin tum bilgilerini listele
select * from trainee where id=123;

-- Soru04: id'si 121 olan ogrencilerin adres ve sinav notunu listele
select adres, sinav_notu from trainee where id=121;

create table personel
(
id char(4),
isim varchar(40),
maas int
);

insert into personel values('1001','Ali Can','70000');
insert into personel values('1002','Canan Yaman','85000');
insert into personel values('1003','Meltem Tan','65000');
insert into personel values('1004','Omer Atalay','75000');

select * from personel;

-- Between
-- Belirttigimiz 2 veri arasindaki bilgileri listeler

-- Soru05: id'si 1002 ile 1005 arasinda olan personel bilgilerini listeleyiniz
select * from personel where id between 1002 and 1004;
select * from personel where id>= 1002 and id<=1004;
-- Soru06: Ali Can ve Omer Atalay arasindaki personel bilgilerini listeleyiniz
select * from personel where isim between 'Ali Can' and 'Omer Atalay';

-- Soru07: id'si 1001,1002 ve 1004 olan personel bilgilerini listeleyiniz
select * from personel where id= '1001' or id='1002' or id='1004';
select * from personel where id in(1001,1002,1004);

-- Soru08: Maasi 70000 ve 100000 olan personlei listele
select * from personel where maas in (70000, 100000);

-- or:belirtilen sartlar saglanirsa kayit listelenir

/*
SELECT - LIKE
like: sorgulama yaparken belirli patternleri kullanabilmemiz saglar

select sutun1, sutun2, ...
from tablo_adi where sutun like pattern

Pattern icin
% -> 0 veya daha fazla karakteri belirtir
_ -> Tek bir karakteri belirtir
*/

-- Soru09: ismi A harfi ile baslayan personeli listele
select * from personel where isim like 'A%';

-- Soru10: ismi N harfi ile biten personeli listele 
select * from personel where isim like 'N%';

-- Soru11: ismi 2. harfi E olan personeli listele
select * from personel where isim like '_E%';

-- Soru12: isminin 2. harfi E olup diger harflerinde Y olan personel
select * from personel where isim like '_E%Y';

-- Soru13: isminde A harfi olmayan personeli listeleyin
select * from personel where isim not like '%A%';

-- Soru14: Maasi 6 haneli olan personeli listeleyin
select * from personel where maas like '______';

-- Soru15: 1. harfi A ve 7. harfi A olan personeli listeleyin
select * from personel where isim like 'A_____A%';


/* ====================== SELECT - REGEXP_LIKE ================================
    Daha karmaşık pattern ile sorgulama işlemi için REGEXP_LIKE kullanılabilir.
     -- 'c' => case-sensitive demektir
     -- 'i' => incase-sensitive demektir ve default incase-sensitive aktiftir..
    Syntax:
    --------
    REGEXP_LIKE(sutun_adı, 'pattern[] ', 'c' ] )
/* ========================================================================== */


use test;
CREATE TABLE kelimeler
(
id int UNIQUE,
kelime VARCHAR(50) NOT NULL,
harf_sayisi int
);
    INSERT INTO kelimeler VALUES (1001, 'hot', 3);
    INSERT INTO kelimeler VALUES (1002, 'hat', 3);
    INSERT INTO kelimeler VALUES (1003, 'hit', 3);
    INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
    INSERT INTO kelimeler VALUES (1005, 'hct', 3);
    INSERT INTO kelimeler VALUES (1006, 'adem', 4);
    INSERT INTO kelimeler VALUES (1007, 'selim', 5);
    INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
    INSERT INTO kelimeler VALUES (1009, 'hip', 3);
    INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
    INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
    INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
    INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
    INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
    INSERT INTO kelimeler VALUES (1015, 'hooooot', 5);

select * from kelimeler;
-- SORU16: İçerisinde 'ot' veya 'at' bulunan kelimeleri küçük harfe dikkat ederek listeleyiniz
select * from kelimeler where regexp_like ( kelime, 'ot|at', 'c');
-- VEYA işlemi için | karakteri kullanılır.

-- SORU17: İçerisinde 'ot' veya 'at' bulunan kelimeleri büyük-küçük harfe dikkat etmeksizin listeleyeniz
select * from kelimeler where regexp_like ( kelime, 'ot|at', 'i');
select * from kelimeler where regexp_like ( kelime, 'ot|at');

-- SORU18: 'ho' veya 'hi' ile başlayan kelimeleri büyük-küçük harfe dikkat etmeksizin listeleyeniz
-- Başlangıcı göstermek için ^ karakteri kullanılır.
select * from kelimeler where regexp_like ( kelime, '^ho|^hi');

-- SORU18: Sonu 't' veya 'm' ile bitenleri büyük-küçük harfe dikkat etmeksizin listeleyeniz.
select * from kelimeler where regexp_like ( kelime, 't$|m$ ');  /* 't$|m'  bu da calısır*/
-- Bitişi göstermek için $ karakteri kullanılır.

-- SORU19: h ile başlayıp t ile biten 3 harfli kelimeleri (h ile t küçük harfli olanlari) listeleyeniz
select * from kelimeler where regexp_like ( kelime, 'h[a-zA-Z0-9]t','c' ); 
-- 3 HARF -> h1.harf / [] 2.harf / t 3.harf
-- SORU19A: h ile başlayıp t ile biten 4 harfli kelimeleri (h ile t küçük harfli olanlari) listeleyeniz
select * from kelimeler where regexp_like ( kelime, 'h[a-zA-Z0-9][a-zA-Z0-9]t' ,'c' ); 

-- SORU20: İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tüm bilgilerini sorgulayalım.
select * from kelimeler where regexp_like ( kelime, 'h[a|i]t' ); 

-- SORU21: İçinde m veya i veya e olan kelimelerin tüm bilgilerini listeleyiniz.
select * from kelimeler where regexp_like(kelime, 'i|e|m');
select * from kelimeler where regexp_like(kelime, '[mie]');

-- SORU22: a veya s ile başlayan kelimelerin tüm bilgilerini listeleyiniz.
select * from kelimeler where regexp_like(kelime, '^a|^s');

-- SORU23: içerisinde en az 2 adet oo barıdıran kelimelerin tüm bilgilerini listeleyiniz.
select * from kelimeler where regexp_like(kelime, 'oo');
-- SORU24: içerisinde en az 4 adet oooo barıdıran kelimelerin tüm bilgilerini listeleyiniz.
select * from kelimeler where regexp_like(kelime, 'oooo');
-- SORU25: ilk harfi s veya b , 3. harfi l olan ve 5 harfli olan kelimelerin küçük harfe dikkat ederek listeleyiniz.
select * from kelimeler where regexp_like(kelime, '^s|^b_[l]__','c');





































