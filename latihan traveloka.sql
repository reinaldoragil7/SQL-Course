create table master_pemesan
(nama_pemesan varchar(25) primary key,
email_pemesan varchar(40),
no_kontak varchar(20)
);

create table master_perusahaan
(nama_perusahaan varchar(25) primary key,
npwp varchar(30),
alamat_perusahaan varchar(200)
);

create table master_hotel
(nama_hotel varchar(50) primary key,
alamat_hotel varchar(60)
);

create table master_barang
(nomor int,
jenis_barang varchar(30) primary key,
deskripsi_barang varchar(100),
harga int
);

create table transaksi_header 
(no_po varchar(15) primary key,
pembelian_melalui varchar(15),
detail_transaksi varchar(10),	
nama_pemesan varchar(25),
nama_perusahaan varchar(25),
check_in varchar(15),
durasi varchar(10)
);

create table transaksi_detail 
(no_po varchar(15),
nama_hotel varchar(50),
jenis_barang varchar(30),
jumlah int
);


insert into master_pemesan values
("Dewi Sandra","Sdewi055@gmail.com","+6285341899012");

insert into master_perusahaan values
("Trinusa Travelindo","31.616.320.3-031.000","Traveloka Campus [d/h Green Office Park 1] South Tower Lantai 2 Zone 10, Jl. Grand Boulevard BSD Green Office Park, Sampora, Cisauk, Kab. Tangerang, Banten, 15345");

insert into master_hotel values
("Awwan Sewu Boutique Hotel & Suite","Jl Simpang Sekayu, Semarang Tengah, Kota Semarang");

insert into master_barang values
("1","Akomodasi","Awwan Sewu Boutique Hotel & Suite, Kamar Twin Deluxe - 2 tamu","4570640"),
("2","Asuransi Hotel CHUBB","Asuransi Hotel CHUBB oleh Chubb General Insurance Indonesia","26625");

insert into transaksi_header values
("827769731","Bank Transfer","Lunas","Dewi Sandra","Trinusa Travelindo","12-05-2022","5 malam");

insert into transaksi_detail values
("827769731","Awwan Sewu Boutique Hotel & Suite","Akomodasi","1"),
("827769731","Awwan Sewu Boutique Hotel & Suite","Asuransi Hotel CHUBB","1");


create view invoice_pembayaran as
	select
	transaksi_header.no_po,
	transaksi_header.pembelian_melalui,
	transaksi_header.detail_transaksi,
	transaksi_header.nama_pemesan,
	master_pemesan.email_pemesan,
	master_pemesan.no_kontak,
	transaksi_header.nama_perusahaan,
	master_perusahaan.npwp,
	master_perusahaan.alamat_perusahaan,
	transaksi_detail.nama_hotel,
	master_hotel.alamat_hotel,
	transaksi_header.check_in,
	transaksi_header.durasi,
	master_barang.nomor,
	master_barang.jenis_barang,
	master_barang.deskripsi_barang,
	transaksi_detail.jumlah,
	master_barang.harga,
	round(master_barang.harga*transaksi_detail.jumlah,0) as total,
	round(
		sum(master_barang.harga*transaksi_detail.jumlah)
	over(partition by transaksi_header.no_po)
	,0)
	as jumlah_pembayaran
	from transaksi_header inner join master_pemesan
	on transaksi_header.nama_pemesan = master_pemesan.nama_pemesan
	inner join master_perusahaan
	on transaksi_header.nama_perusahaan = master_perusahaan.nama_perusahaan
	inner join transaksi_detail
	on transaksi_header.no_po = transaksi_detail.no_po
	inner join master_hotel
	on transaksi_detail.nama_hotel = master_hotel.nama_hotel
	inner join master_barang
	on transaksi_detail.jenis_barang = master_barang.jenis_barang;



