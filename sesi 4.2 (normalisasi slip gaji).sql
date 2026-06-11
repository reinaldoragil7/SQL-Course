create table master_karyawan
(id_karyawan varchar(10) primary key,
nama_karyawan varchar(30)
);

insert into master_karyawan values
('KRY-215','Alex Budianto'),
('KRY-216','Clara Susanti'),
('KRY-217','Joni Darmawan');


create table master_gaji
(kode_jabatan varchar(10) primary key);

insert into master_gaji values
('ST-IT'),
('ST-MR'),
('ST-OP');


create table transaksi
(no_slip_gaji varchar(10) primary key,
tanggal date,
id_karyawan varchar(10),
kode_jabatan varchar(10),
lama_lembur int
);

insert into transaksi values
('SG-1034','2020-05-28','KRY-215','ST-IT',10),
('SG-1035','2020-05-28','KRY-216','ST-MR',6),
('SG-1036','2020-05-28','KRY-217','ST-OP',8);



create view slip_gaji as
select master_karyawan.id_karyawan,
master_karyawan.nama_karyawan,
master_gaji.kode_jabatan,
transaksi.no_slip_gaji,
transaksi.tanggal,
transaksi.lama_lembur,

case 
when master_gaji.kode_jabatan='ST-IT' then 'Staff IT'
when master_gaji.kode_jabatan='ST-MR' then 'Staff Marketing'
when master_gaji.kode_jabatan='ST-OP' then 'Staff Operasional'
end as jabatan, 

case
when master_gaji.kode_jabatan='ST-IT' then 6500000
when master_gaji.kode_jabatan='ST-MR' then 6200000
when master_gaji.kode_jabatan='ST-OP' then 6000000
end as gaji_pokok, 

case
when master_gaji.kode_jabatan='ST-IT' then 600000
when master_gaji.kode_jabatan='ST-MR' then 1200000
when master_gaji.kode_jabatan='ST-OP' then 500000
end as tunjangan_transport, 

case
when master_gaji.kode_jabatan='ST-IT' then 40000
when master_gaji.kode_jabatan='ST-MR' then 50000
when master_gaji.kode_jabatan='ST-OP' then 60000
end as lembur_perjam

from master_karyawan inner join transaksi
on master_karyawan.id_karyawan = transaksi.id_karyawan
inner join master_gaji
on master_gaji.kode_jabatan = transaksi.kode_jabatan;



create view slip_gaji_akhir as
select slip_gaji.*,
slip_gaji.lama_lembur*slip_gaji.lembur_perjam as total_lembur,
slip_gaji.gaji_pokok+slip_gaji.tunjangan_transport+(slip_gaji.lama_lembur*slip_gaji.lembur_perjam) as total_gaji
from slip_gaji;
