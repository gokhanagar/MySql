create table ogrenciler
(
	id char(3),
	isim varchar(50),
	veli_isim varchar(50),
	not_ort  smallint,
	constraint ogrenciler_pk primary key(id)
)

insert into ogrenciler values(123,'ali can', 'hasan', 75)
insert into ogrenciler values(124,'merve gul', 'ayse', '85')
insert into ogrenciler values(125,'kemal yasa', 'mehmet', '85')
insert into ogrenciler values(126,'fatma gun', 'mehmet', '90')
insert into ogrenciler values(127,'veli han', 'murat', '91')

create table notlar
(
	ogrenci_id char(3),
	ders_adi varchar(50),
	yazili_notu smallint,
	not_ort  smallint,
	constraint notlar_fk foreign key (ogrenci_id) references ogrenciler(id)
)

insert into notlar values(123,'kimya',75)
insert into notlar values(124,'fizik',65)
insert into notlar values(125,'tarih',90)
insert into notlar values(126,'mat',90)
insert into notlar values(127,'ing',90)


select * from notlar

update ogrenciler
set not_ort= (select yazili_notu from notlar where ogrenciler.id = notlar.ogrenci_id)
where id>='120'

delete from notlar
where ders_adi in ('mat','ing')


delete from ogrenciler
where isim = 'ali can'





















