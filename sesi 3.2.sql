create table master_customer
(id_customer varchar(10) primary key,
nama_customer varchar(30),
alamat_customer varchar(50)
);

insert into master_customer values
('CS-00001','Rosita', 'Dusun banjar harja');


create table master_kendaraan
(no_polisi varchar(10) primary key,
tipe varchar(30),
no_rangka varchar (30),
no_mesin varchar (30),
km int
);

insert into master_kendaraan values
('B001LN','Mobilio Rs CVT','MHR04870HJ701270','L15z13607551',38580);



create table master_mekanik
(id_mekanik varchar(10) primary key,
nama_mekanik varchar(30)
);

insert into master_mekanik values
('M001','Asep W');



create table master_biaya
(kode_biaya varchar(10) primary key,
jenis_biaya varchar(30),
uraian_biaya int
);

insert into master_biaya values
('SV001', 'Service', 155000),
('SV002', 'Parts', 37500),
('SV003', 'Powersteering', 3850000),
('SV004', 'Servis Gardan', 1920000);


create table master_aktivitas
(kode_aktivitas int primary key,
jenis_aktivitas varchar(30),
ongkos_kerja int
);

insert into master_aktivitas values
(1,'Servis mesin', 150000);


create table transaksi_header
(no_kwitansi varchar(10) primary key,
id_customer varchar(10),
no_polisi varchar(10),
id_mekanik varchar(10),
misc_charge int,
total int
);

insert into transaksi_header values
('K0001', 'CS-00001', 'B001LN', 'M001', 92000, 6204500);



create table transaksi_detail
(no_kwitansi varchar(10),
kode_biaya varchar(10),
kode_aktivitas int
);

insert into transaksi_detail values
('K0001','SV001',1),
('K0001','SV002',1),
('K0001','SV003',1),
('K0001','SV004',1);


select * from master_customer;
select * from master_kendaraan;
select * from master_mekanik;
select * from master_biaya;
select * from master_aktivitas;
select * from transaksi_header;
select * from transaksi_detail;

