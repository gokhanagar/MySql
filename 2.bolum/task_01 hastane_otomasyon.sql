/* ========================== HASTA PROJESI =================================*/   
   
create database hastaKayitVeriTabani;   
use hastaKayitVeriTabani;   
   
create table hastanelerTablosu
(
id varchar(10) primary key,
isim varchar(40),
sehir varchar(20),
ozel varchar(2)

);   
   
 insert into hastanelerTablosu values('H101','ACIBADEM HASTANESI','ISTANBUL','Y');
 insert into hastanelerTablosu values('H102','HASEKI HASTANESI','ISTANBUL','N');
 insert into hastanelerTablosu values('H103','MEDIKOL HASTANESI','ISTANBUL','Y');
 insert into hastanelerTablosu values('H104','SISLI HASTANESI','ISTANBUL','Y');
 select * from hastanelerTablosu;  

   
create table hastalarTablosu   
(
kimlik_no varchar(15) primary key,
isim varchar(40),
teshis varchar(20)

);   

insert into hastalarTablosu values('12345678901','Ali Can','Gizli Seker');
insert into hastalarTablosu values('45679801121','Ayse Yilmaz','Hipertansiyon');
insert into hastalarTablosu values('78901123451','Kemal Gur','Pankreatit ');
insert into hastalarTablosu values('12345678902','Omer Yilmaz','Kanser');
select * from hastalarTablosu;   

create table bolumlerTablosu
(
bolum_id varchar(10) primary key,
bolum_adi varchar(30)
);   

insert into   bolumlerTablosu values('DHL', 'Dahiliye');
insert into   bolumlerTablosu values('KBB', 'Kulak-Burun-Bogaz');
insert into   bolumlerTablosu values('NRJ', 'Noroloji');
insert into   bolumlerTablosu values('GAST', 'Gastroloji');
insert into   bolumlerTablosu values('KARD', 'Kardioloji');
insert into   bolumlerTablosu values('PSK', 'Psikiyatri');
insert into   bolumlerTablosu values('GOZ', 'Goz hastaliklari');
 select * from bolumlerTablosu;
 
create table hastalarKayitlar  
(
kimlik_no varchar(20) primary key,
hasta_isim varchar(40),
hastane_adi varchar(20),
bolum_adi varchar(20),
teshis varchar(30)
);     
   
  insert into  hastalarKayitlar  values('1111','noname',null,null,null); 
  insert into  hastalarKayitlar  values('2222','noname',null,null,null); 
  insert into  hastalarKayitlar  values('3333','noname',null,null,null); 
   select * from hastalarKayitlar;
   
   
update hastalarKayitlar
set kimlik_no = '99991111222', 
hasta_isim = 'Salvadore Dali', 
hastane_adi = 'John Hopins',
bolum_adi = 'Noroloji',
teshis = 'Parkinson'
where kimlik_no = 3333;
select * from hastalarKayitlar;
    
update hastalarKayitlar
set hasta_isim = (select isim from hastalarTablosu where isim='Ali Can'), 
 hastane_adi = (select isim from hastanelerTablosu where isim='SISLI HASTANESI') ,
 bolum_adi = (select bolum_adi from bolumlerTablosu where bolum_adi = 'Dahiliye'),
 teshis = (select teshis from hastalarTablosu where teshis = 'Gizli Seker'),
 kimlik_no=(select kimlik_no from hastalarTablosu where kimlik_no = '12345678901')  where kimlik_no='1111';

select * from hastalarKayitlar;

update hastalarKayitlar
set hasta_isim = ( select isim from hastalarTablosu where isim ='Ayse Yilmaz' ), 
hastane_adi = ( select isim from hastanelerTablosu where id = 'H103' ),
bolum_adi = (select bolum_adi from bolumlerTablosu where bolum_id = 'KBB'),
teshis = (select teshis from hastalarTablosu where isim = 'Omer Yilmaz'),
kimlik_no = (select kimlik_no from hastalarTablosu where isim ='Kemal Gur')  where kimlik_no='2222';

select * from hastalarKayitlar;


 
   
   
   
   
   
   
   
   
   
   
   
   