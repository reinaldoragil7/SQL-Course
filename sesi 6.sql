create table master_kasir
(id_kasir varchar(6) primary key,
nama_kasir varchar(20)
);

create table master_pelanggan
(id_pelanggan varchar(10) primary key,
nama_pelanggan varchar(30),
no_telepon varchar(20)
);

create table master_produk
(kode_produk varchar(10) primary key,
nama_produk varchar(50),
harga int
);

create table transaksi_header
(no_nota varchar(10) primary key,
id_kasir varchar(6),
id_pelanggan varchar(10)
);

create table transaksi_detail
(no_nota varchar(10),
kode_produk varchar(10),
qty int
);



create table histori_kasir
(id int auto_increment primary key,
keterangan varchar(50),
waktu datetime
);

create table histori_pelanggan
(id int auto_increment primary key,
keterangan varchar(50),
waktu datetime
);

create table histori_produk
(id int auto_increment primary key,
keterangan varchar(50),
waktu datetime
);

create table histori_transaksi_header
(id int auto_increment primary key,
keterangan varchar(50),
waktu datetime
);

create table histori_transaksi_detail
(id int auto_increment primary key,
keterangan varchar(50),
waktu datetime
);



delimiter $$
create trigger trg_kasir
after insert on master_kasir
for each row 
begin
insert into histori_kasir values('','Telah terjadi input data',now());
end$$
delimiter ;


delimiter $$
create trigger trg_pelanggan
after insert on master_pelanggan
for each row 
begin
insert into histori_pelanggan values('','Telah terjadi input data',now());
end$$
delimiter ;

delimiter $$
create trigger trg_produk
after insert on master_produk
for each row 
begin
insert into histori_produk values('','Telah terjadi input data',now());
end$$
delimiter ;

delimiter $$
create trigger trg_transaksi_header
after insert on transaksi_header
for each row 
begin
insert into histori_transaksi_header values('','Telah terjadi input data',now());
end$$
delimiter ;

delimiter $$
create trigger trg_transaksi_detail
after insert on transaksi_detail
for each row 
begin
insert into histori_transaksi_detail values('','Telah terjadi input data',now());
end$$
delimiter ;


insert into master_kasir values
('CS-03','Sukma'),
('CS-02','Burhan');

insert into master_pelanggan values
('PL-501','Deni Heryawan','089814425790'),
('PL-427','Kumala Sari','081215525784');

insert into master_produk values
('DM-1003','TV Polytron 32 inch','2750000'),
('IM-3249','Kulkas Sharp 2 Pintu','2230000'),
('IM-1124','AC Samsung 1PK','5000000'),
('DM-1150','Mesin Cuci Polytron','1265000'),
('IM-1008','Kipas Angin Sanken','136000');

insert into transaksi_header values
('NT-2030','CS-03','PL-501'),
('NT-2165','CS-02','PL-427');

insert into transaksi_detail values
('NT-2030','DM-1003','1'),
('NT-2030','IM-3249','2'),
('NT-2165','IM-1124','1'),
('NT-2165','DM-1150','2'),
('NT-2165','IM-1008','1');


create view nota_pembelian as
select 
transaksi_header.no_nota,
transaksi_header.id_kasir,
master_kasir.nama_kasir,
transaksi_header.id_pelanggan,
master_pelanggan.nama_pelanggan,
master_pelanggan.no_telepon,
transaksi_detail.kode_produk,
master_produk.nama_produk,
case
when left(transaksi_detail.kode_produk,2)='DM' then 'Domestik'
when left(transaksi_detail.kode_produk,2)='IM' then 'Impor'
end as asal_produk,
master_produk.harga,
transaksi_detail.qty,
round(master_produk.harga*transaksi_detail.qty,0) as total_harga,
case
when left(transaksi_detail.kode_produk,2)='DM' then 10
when left(transaksi_detail.kode_produk,2)='IM' then 15
end as pajak,
round(
(master_produk.harga*transaksi_detail.qty) * 
(case
when left(transaksi_detail.kode_produk,2)='DM' then 10
when left(transaksi_detail.kode_produk,2)='IM' then 15
end / 100
)
,0)
as jumlah_pajak,
round(
(master_produk.harga*transaksi_detail.qty)  + 
(master_produk.harga*transaksi_detail.qty) *
(case
when left(transaksi_detail.kode_produk,2)='DM' then 10
when left(transaksi_detail.kode_produk,2)='IM' then 15
end / 100
)
,0)
as subtotal,
round(
sum(
(master_produk.harga*transaksi_detail.qty)  + 
(master_produk.harga*transaksi_detail.qty) *
(case
when left(transaksi_detail.kode_produk,2)='DM' then 10
when left(transaksi_detail.kode_produk,2)='IM' then 15
end / 100
) 
)
over(partition by transaksi_header.no_nota)
,0)
as total_bayar
from transaksi_header inner join master_kasir
on transaksi_header.id_kasir = master_kasir.id_kasir
inner join master_pelanggan
on transaksi_header.id_pelanggan = master_pelanggan.id_pelanggan
inner join transaksi_detail
on transaksi_header.no_nota = transaksi_detail.no_nota
inner join master_produk
on transaksi_detail.kode_produk = master_produk.kode_produk;




