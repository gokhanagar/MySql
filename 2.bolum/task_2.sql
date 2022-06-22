/* 
1) 
calisanlar tablosu --> id, isim, maas 
'1001', 'Ahmet Aslan', 7000
'1002', 'Mehmet Yılmaz' ,12000
'1003', 'Meryem ', 7215
'1004', 'Veli Han', 5000

      aileler tablosu --> id, cocuk_sayisi, ek_gelir
'1001', 4, 2000
'1002', 2, 1500
'1003', 1, 2200
'1004', 3, 2400

 create ediniz
*/
create table if not exists calisanlar(
id char(4),
isim varchar(50),
maas int,
constraint id_pk primary key (id)
);

insert into calisanlar values ('1001','Ahmet Aslan', 7000);
insert into calisanlar values ('1002','Mehmet Yılmaz', 12000);
insert into calisanlar values ('1003','Meryem ', 7215);
insert into calisanlar values ('1004','Veli Han', 5000);

CREATE TABLE aileler
(
id CHAR(4),
cocuk_sayisi VARCHAR(50),
ek_gelir int,
CONSTRAINT id_fk FOREIGN KEY (id) REFERENCES calisanlar(id)
);

insert into aileler values ('1001',4, 2000);
insert into aileler values ('1002',2, 1500);
insert into aileler values ('1003',1, 2200);
insert into aileler values ('1004',3, 2400);


select * from calisanlar;
select * from aileler;

 -- 2) Veli Han'ın maaşına %20 zam yapınız.
    update calisanlar set 
    maas = maas*1.2 
    where id ='1004';
    
 -- 3) Maaşı ortalamanın altında olanlara %20 zam yapınız.
update calisanlar set maas =maas*1.2 where maas < (select avg(maas) from calisanlar);
                    
-- 4) calisanların isim ve cocuk_sayisi'ni listeyen sorguyu yazınız.
select isim, (select cocuk_sayisi from aileler where calisanlar.id = aileler.id) as x from calisanlar;

-- 2.yol
select isim,cocuk_sayisi from calisanlar,aileler where calisanlar.id = aileler.id;
            
-- 5) calisanlar' ın  isim ve toplam_gelir'lerini gösteren bir sorgu yazınız. 
-- toplam_gelir = calisanlar.maas + aileler.ek_gelir 
select isim, (select maas+ek_gelir from aileler where calisanlar.id = aileler.id) as toplam_gelir from calisanlar;

-- 2.yol
select isim, (select maas+ek_gelir) as toplam_gelir from calisanlar, aileler where calisanlar.id = aileler.id;

-- 6) eğer bir ailenin kişi başı geliri 2000 TL den daha az ise o çalışanın  maaşına ek %10 aile yardım zammı yapınız. 
-- kisi_basi_gelir = toplam_gelir / cocuk_sayisi + 2 (anne ve baba)
update calisanlar
set maas = maas*1.1
where (select (maas+a.ek_gelir)/(cocuk_sayisi+2)  from aileler where calisanlar.id = aileler.id)<2000;
   
   
   