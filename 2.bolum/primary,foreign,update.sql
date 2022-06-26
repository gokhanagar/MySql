use okul;

create table sehirler (
alan_kodu char(3) primary key,
isim varchar(30) not null,
nufus int(8)

);

insert into sehirler values(312,'Ankara',5750000);
insert into sehirler values(232,'Izmir',3650000);
insert into sehirler values(212,'Istanbul',15750000);

select * from sehirler;
-- ogrenciler4 tablosu olusturalim ve id field'ini PK yapalim

create table ogrenciler4
(
id char(4),
isim varchar(30) not null,
not_ortalamasi mediumint(5.2),
adres varchar(50),
kayit_tarihi date,
constraint ogrenciler_pk primary key(id)
);

INSERT INTO ogrenciler4 VALUES (1235,'Veli Cem',90.6,'Ankara','2019-05-05');
select * from ogrenciler4;

-- ogrenciler5 tablosunu olusturun ve id,isim hanelerinin birlesimini Primary Key yapin
CREATE TABLE ogrenciler5
(
id char(4),
isim varchar(50),
not_ortalamasi mediumint(5.2),
adres varchar(50),
kayit_tarihi date,
CONSTRAINT ogrenciler5_pk PRIMARY KEY (id,isim)
);

INSERT INTO ogrenciler5 VALUES (null,'Veli Cem',90.6,'Ankara','2019-05-05'); 
INSERT INTO ogrenciler5 VALUES (1234,null,90.6,'Ankara','2019-05-05');
INSERT INTO ogrenciler5 VALUES (1234,'Ali Can',90.6,'Ankara','2019-05-15');
INSERT INTO ogrenciler5 VALUES (1234,'Veli Cem',90.6,'Ankara','2019-05-25'); 
INSERT INTO ogrenciler5 VALUES (1234,'Oli Can',90.6,'Ankara','2019-05-05');

select * from ogrenciler5;

-- “tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”, “iletisim_isim” field’lari olsun 
-- ve “tedarikci_id” yi Primary Key yapin.
-- “urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve 
-- “tedarikci_id” yi Foreign Key yapin.

CREATE TABLE tedarikciler3
(
tedarikci_id char(4),
tedarikci_ismi varchar(40),
iletisim_isim varchar(50),
CONSTRAINT tedarikciler3_pk PRIMARY KEY (tedarikci_id)
);
INSERT INTO tedarikciler3 VALUES('1234','Pazarlama as','Mehmet bey');

CREATE TABLE urunler(
tedarikci_id char(4),
urun_id CHAR(5),
CONSTRAINT urunler_fk FOREIGN KEY (tedarikci_id) REFERENCES tedarikciler3 (tedarikci_id)
);

INSERT  INTO urunler VALUES ('1234','34567');
INSERT  INTO urunler VALUES ('1234','34586');


-- bir tablodaki PK ile baska bir tablodaki FK iliskililendirilecekse DATA TIPLERI uyumlu olmalidir
-- eger PK veya FK birden fazla field'in birlesiminden olusuyorsa BIRLESIMLE OLUSAN DATA TIPLERI birbiriyle uyumlu olmalidir


-- son constraint
-- CHECK yanina yazdigimiz field'in istedigimiz veya belirttigimiz sartta uymasini kontrol eder

create table sehirler2(
alan_kodu char(3),
isim varchar(50),
nufus mediumint(8) check(nufus>1000)
);

INSERT INTO sehirler2 VALUES ('312','Ankara',5750000); 
INSERT INTO sehirler2 VALUES ('232','izmir',375); 
INSERT INTO sehirler2 VALUES ('232','izmir',3750000);
INSERT INTO sehirler2 VALUES ('436','Maras',null); -- 344

select * from sehirler2;

update sehirler2
set alan_kodu= 344
where isim = 'Maras';

update sehirler2
set nufus=756000
where alan_kodu =344; 
