create view kwitansi_header as 
select transaksi_header.no_kwitansi, 
master_customer.id_customer,
master_customer.nama_customer,
master_customer.alamat_customer,
master_kendaraan.no_polisi,
master_kendaraan.tipe,
master_kendaraan.no_rangka,
master_kendaraan.no_mesin,
master_kendaraan.km,
master_mekanik.id_mekanik,
master_mekanik.nama_mekanik,
transaksi_header.misc_charge
from master_customer inner join transaksi_header
on master_customer.id_customer = transaksi_header.id_customer 
inner join master_kendaraan
on master_kendaraan.no_polisi = transaksi_header.no_polisi
inner join master_mekanik
on master_mekanik.id_mekanik = transaksi_header.id_mekanik


create view kwitansi_detail as 
select transaksi_detail.no_kwitansi,
master_biaya.kode_biaya,
master_biaya.jenis_biaya,
master_biaya.uraian_biaya,
master_aktivitas.kode_aktivitas,
master_aktivitas.jenis_aktivitas,
master_aktivitas.ongkos_kerja
from master_biaya inner join transaksi_detail
on master_biaya.kode_biaya = transaksi_detail.kode_biaya
inner join master_aktivitas
on master_aktivitas.kode_aktivitas = transaksi_detail.kode_aktivitas


create view total_uraian as 
select kwitansi_detail.no_kwitansi,
kwitansi_detail.kode_aktivitas,
sum(master_biaya.uraian_biaya) as total_uraian
from master_biaya inner join kwitansi_detail
on master_biaya.kode_biaya = kwitansi_detail.kode_biaya


create view total as 
select total_uraian.no_kwitansi,
total_uraian.total_uraian,
master_aktivitas.ongkos_kerja,
kwitansi_header.misc_charge,
total_uraian.total_uraian+master_aktivitas.ongkos_kerja+kwitansi_header.misc_charge as total
from master_aktivitas inner join total_uraian
on master_aktivitas.kode_aktivitas = total_uraian.kode_aktivitas
inner join kwitansi_header
on kwitansi_header.no_kwitansi = total_uraian.no_kwitansi


create view kwitansi_akhir as 
select total_uraian.no_kwitansi,
kwitansi_header.id_customer,
kwitansi_header.nama_customer,
kwitansi_header.alamat_customer,
kwitansi_header.no_polisi,
kwitansi_header.tipe,
kwitansi_header.no_rangka,
kwitansi_header.no_mesin,
kwitansi_header.km,
kwitansi_header.id_mekanik,
kwitansi_header.nama_mekanik,
kwitansi_detail.kode_biaya,
kwitansi_detail.jenis_biaya,
kwitansi_detail.uraian_biaya,
kwitansi_detail.kode_aktivitas,
kwitansi_detail.jenis_aktivitas,
total.ongkos_kerja,
total.misc_charge,
total.total
from kwitansi_header inner join total_uraian
on kwitansi_header.no_kwitansi = total_uraian.no_kwitansi
inner join kwitansi_detail
on kwitansi_header.no_kwitansi = kwitansi_detail.no_kwitansi
inner join total
on kwitansi_header.no_kwitansi = total.no_kwitansi;



