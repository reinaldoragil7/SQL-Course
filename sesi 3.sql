create table master_pasien
(no_mr_pasien int primary key,
nama_pasien varchar(30),
umur int,
sex varchar (10),
perusahaan varchar (30)
);

insert into master_pasien values
(293,'Aan Rumianto',43,'Male','BPJS KES');


create table master_dokter
(id_dokter varchar(5) primary key,
nama_dokter varchar(30)
);

insert into master_dokter values
('D001', 'dr.Estu Rudiktyo, SP.JP');


create table master_obat
(kode_obat varchar(10) primary key,
nama_obat varchar(30),
harga double
);

insert into master_obat values
('OB001','Bisoprol', 1925),
('OB002','Amlodipin', 1632),
('OB003','Lansoprazole', 4054.05);


create table transaksi_header
(no_bill int primary key,
tanggal date,
no_mr_pasien int,
id_dokter varchar(5)
);

insert into transaksi_header values
(1,'2019-04-16',293,'D001');


create table transaksi_detail
(no_bill int,
kode_obat varchar(10),
qty int,
discount double
);

insert into transaksi_detail values
(1,'OB001',15,0),
(1,'OB002',10,0),
(1,'OB003',6,0);


select * from master_pasien;
select * from master_dokter;
select * from master_obat;
select * from transakasi_header;
select * from transakasi_detail;



create view jumlah 
as select transaksi_detail.no_bill,
master_obat.kode_obat, 
transaksi_detail.qty, 
master_obat.harga,
transaksi_detail.qty * master_obat.harga as jumlah,
transaksi_detail.discount, 
(transaksi_detail.qty * master_obat.harga)-transaksi_detail.discount as jumlah_setelah_discount

from master_obat inner join  transaksi_detail
on master_obat.kode_obat = transaksi_detail.kode_obat;

drop view jumlah;
select * from jumlah;


create view transaksi
as select transaksi_header.no_bill, 
transaksi_header.tanggal,
jumlah.qty,
jumlah.jumlah,
jumlah.discount,
jumlah.jumlah_setelah_discount,
master_pasien.no_mr_pasien,
master_dokter.id_dokter,
jumlah.kode_obat

from 
master_pasien inner join transaksi_header
on master_pasien.no_mr_pasien=transaksi_header.no_mr_pasien
inner join master_dokter
on master_dokter.id_dokter=transaksi_header.id_dokter
inner join jumlah
on transaksi_header.no_bill=jumlah.no_bill;


create view total_harga 
as select 
transaksi.no_bill,
sum(transaksi.jumlah_setelah_discount) as total_harga
from transaksi;


create view kwitansi
as select transaksi.tanggal,
master_pasien.nama_pasien,
transaksi.no_mr_pasien,
master_pasien.umur,
master_pasien.sex,
master_dokter.nama_dokter,
transaksi.no_bill,
master_obat.nama_obat,
transaksi.qty,
master_obat.harga,
total_harga.total_harga,
transaksi.jumlah,
transaksi.discount,
transaksi.jumlah_setelah_discount,
master_pasien.perusahaan
from master_pasien inner join transaksi
on master_pasien.no_mr_pasien=transaksi.no_mr_pasien
inner join master_dokter
on master_dokter.id_dokter=transaksi.id_dokter
inner join master_obat 
on master_obat.kode_obat=transaksi.kode_obat
inner join total_harga
on total_harga.no_bill=transaksi.no_bill;

















