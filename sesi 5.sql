create table master_pemilik(
nik varchar (16) primary key,
nama_pemilik varchar (20),
alamat varchar (50)
);

insert into master_pemilik values
('3174011503980000','Clara Susanti','Jl.Melati Raya 2 Jakarta Timur'),
('3185011503980031','Doni Kusuma','Jl.Pesona Cipta 5 Jakarta Barat'),
('3100028503980451','Tomi Winata','Jl.Anggrek 8 Jakarta Selatan');



create table master_petugas(
id_petugas varchar (6) primary key,
nama_petugas varchar (30)
);

insert into master_petugas values 
('P-201','Bayu'),
('P-202','Andini'),
('P-203','Slamet');



create table transaksi(
no_kwitansi varchar (10) primary key,
nik varchar (16),
id_petugas varchar (6),
no_stnk varchar (10),
lama_terlambat int
);

insert into transaksi values
('K1487','3174011503980000','P-201','B6381HJ','14'),
('K1488','3185011503980031','P-202','D7419AY','8'),
('K1489','3100028503980451','P-203','F2260JP','12');



drop table transaksi;



create view kendaraan as select 
master_pemilik.*, 
master_petugas.*, 
transaksi.no_kwitansi,
transaksi.lama_terlambat,
transaksi.no_stnk, 
case 
when left(transaksi.no_stnk,1)='B' then 'Jakarta'
when left(transaksi.no_stnk,1)='D' then 'Bandung'
when left(transaksi.no_stnk,1)='F' then 'Bogor'
end as wilayah,

case 
when left(transaksi.no_stnk,1)='B' then 850000
when left(transaksi.no_stnk,1)='D' then 650000
when left(transaksi.no_stnk,1)='F' then 750000
end as biaya_pokok,

case 
when left(transaksi.no_stnk,1)='B' then 30000 
when left(transaksi.no_stnk,1)='D' then 15000
when left(transaksi.no_stnk,1)='F' then 20000
end as denda_terlambat,

transaksi.lama_terlambat *
case 
when left(transaksi.no_stnk,1)='B' then 30000 
when left(transaksi.no_stnk,1)='D' then 15000
when left(transaksi.no_stnk,1)='F' then 20000
end as biaya_terlambat,
(
case
when left(transaksi.no_stnk,1)='B' then 850000 
when left(transaksi.no_stnk,1)='D' then 650000
when left(transaksi.no_stnk,1)='F' then 750000
end
+
transaksi.lama_terlambat *
case
when left(transaksi.no_stnk,1)='B' then 30000
when left(transaksi.no_stnk,1)='D' then 15000
when left(transaksi.no_stnk,1)='F' then 20000
end
) as total_biaya
from master_pemilik inner join transaksi
on master_pemilik.nik = transaksi.nik
inner join master_petugas
on master_petugas.id_petugas = transaksi.id_petugas;


drop view kendaraan;