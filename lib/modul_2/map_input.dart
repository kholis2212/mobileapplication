import 'dart:io';

void main() {
  Map<String, String> kontak = {};
  
  print('=' * 50);
  print('PROGRAM BUKU KONTAK (MAP)');
  print('=' * 50);
  
  while (true) {
    print('\n--- MENU KONTAK ---');
    print('1. Tambah Kontak');
    print('2. Lihat Semua Kontak');
    print('3. Cari Kontak');
    print('4. Ubah Nomor');
    print('5. Hapus Kontak');
    print('6. Lihat Semua Nama');
    print('7. Lihat Semua Nomor');
    print('8. Hitung Jumlah Kontak');
    print('9. Keluar');
    print('Pilih menu (1-9): ');
    
    String? pilihan = stdin.readLineSync();
    
    switch (pilihan) {
      case '1':  // TAMBAH KONTAK
        print('\n-- TAMBAH KONTAK --');
        print('Masukkan nama: ');
        String? nama = stdin.readLineSync();
        
        if (nama != null && nama.isNotEmpty) {
          if (kontak.containsKey(nama)) {
            print('⚠️ Nama "$nama" sudah ada!');
            print('Gunakan menu Ubah untuk mengupdate nomor');
          } else {
            print('Masukkan nomor telepon: ');
            String? nomor = stdin.readLineSync();
            
            if (nomor != null && nomor.isNotEmpty) {
              kontak[nama] = nomor;
              print('✅ Kontak "$nama" berhasil ditambahkan!');
            }
          }
        }
        break;
        
      case '2':  // LIHAT SEMUA KONTAK
        print('\n-- SEMUA KONTAK --');
        if (kontak.isEmpty) {
          print('📭 Buku kontak kosong');
        } else {
          kontak.forEach((nama, nomor) {
            print('📞 $nama: $nomor');
          });
          print('📊 Total kontak: ${kontak.length}');
        }
        break;
        
      case '3':  // CARI KONTAK
        print('\n-- CARI KONTAK --');
        if (kontak.isEmpty) {
          print('📭 Buku kontak kosong');
          break;
        }
        
        print('Masukkan nama yang dicari: ');
        String? namaCari = stdin.readLineSync();
        
        if (namaCari != null && namaCari.isNotEmpty) {
          if (kontak.containsKey(namaCari)) {
            print('✅ Ditemukan: $namaCari = ${kontak[namaCari]}');
          } else {
            print('❌ Nama "$namaCari" tidak ditemukan');
          }
        }
        break;
        
      case '4':  // UBAH NOMOR
        print('\n-- UBAH NOMOR --');
        if (kontak.isEmpty) {
          print('📭 Buku kontak kosong');
          break;
        }
        
        print('Masukkan nama yang akan diubah: ');
        String? namaUbah = stdin.readLineSync();
        
        if (namaUbah != null && namaUbah.isNotEmpty) {
          if (kontak.containsKey(namaUbah)) {
            print('Nomor lama: ${kontak[namaUbah]}');
            print('Masukkan nomor baru: ');
            String? nomorBaru = stdin.readLineSync();
            
            if (nomorBaru != null && nomorBaru.isNotEmpty) {
              kontak[namaUbah] = nomorBaru;
              print('✅ Nomor $namaUbah berhasil diubah!');
            }
          } else {
            print('❌ Nama "$namaUbah" tidak ditemukan');
          }
        }
        break;
        
      case '5':  // HAPUS KONTAK
        print('\n-- HAPUS KONTAK --');
        if (kontak.isEmpty) {
          print('📭 Buku kontak kosong');
          break;
        }
        
        print('Masukkan nama yang akan dihapus: ');
        String? namaHapus = stdin.readLineSync();
        
        if (namaHapus != null && namaHapus.isNotEmpty) {
          if (kontak.containsKey(namaHapus)) {
            kontak.remove(namaHapus);
            print('✅ Kontak "$namaHapus" berhasil dihapus!');
          } else {
            print('❌ Nama "$namaHapus" tidak ditemukan');
          }
        }
        break;
        
      case '6':  // LIHAT SEMUA NAMA
        print('\n-- SEMUA NAMA --');
        if (kontak.isEmpty) {
          print('📭 Buku kontak kosong');
        } else {
          int i = 1;
          for (String nama in kontak.keys) {
            print('$i. $nama');
            i++;
          }
        }
        break;
        
      case '7':  // LIHAT SEMUA NOMOR
        print('\n-- SEMUA NOMOR --');
        if (kontak.isEmpty) {
          print('📭 Buku kontak kosong');
        } else {
          int i = 1;
          for (String nomor in kontak.values) {
            print('$i. $nomor');
            i++;
          }
        }
        break;
        
      case '8':  // HITUNG JUMLAH
        print('\n-- JUMLAH KONTAK --');
        print('📊 Total kontak: ${kontak.length}');
        break;
        
      case '9':  // KELUAR
        print('\n👋 Terima kasih!');
        return;
        
      default:
        print('❌ Pilihan tidak valid!');
    }
  }
}