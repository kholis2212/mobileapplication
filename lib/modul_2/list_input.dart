import 'dart:io';  // Library untuk input-output

void main() {
  // Membuat list kosong
  List<String> dataList = [];
  
  print('=' * 50);
  print('PROGRAM MANAJEMEN DATA LIST');
  print('=' * 50);
  
  // Program akan terus berjalan sampai user memilih keluar
  while (true) {
    // MENU UTAMA
    print('\n--- MENU ---');
    print('1. Tambah Data');
    print('2. Lihat Semua Data');
    print('3. Lihat Data Berdasarkan Index');
    print('4. Ubah Data Berdasarkan Index');
    print('5. Hapus Data Berdasarkan Index');
    print('6. Hapus Data Berdasarkan Nilai');
    print('7. Hitung Jumlah Data');
    print('8. Cari Data');
    print('9. Keluar');
    print('Pilih menu (1-9): ');
    
    // Membaca input user
    String? pilihan = stdin.readLineSync();
    
    // Proses berdasarkan pilihan user
    switch (pilihan) {
      case '1':  // TAMBAH DATA
        print('\n-- TAMBAH DATA --');
        print('Masukkan data: ');
        String? data = stdin.readLineSync();
        
        if (data != null && data.isNotEmpty) {
          dataList.add(data);
          print('✅ Data "$data" berhasil ditambahkan!');
        } else {
          print('❌ Data tidak boleh kosong!');
        }
        break;
        
      case '2':  // LIHAT SEMUA DATA
        print('\n-- SEMUA DATA --');
        if (dataList.isEmpty) {
          print('📭 Data masih kosong');
        } else {
          for (int i = 0; i < dataList.length; i++) {
            print('[$i] ${dataList[i]}');
          }
          print('📊 Total data: ${dataList.length}');
        }
        break;
        
      case '3':  // LIHAT DATA BERDASARKAN INDEX
        print('\n-- LIHAT DATA BY INDEX --');
        if (dataList.isEmpty) {
          print('📭 Data masih kosong');
          break;
        }
        
        print('Masukkan index (0-${dataList.length-1}): ');
        String? indexStr = stdin.readLineSync();
        
        if (indexStr != null) {
          try {
            int index = int.parse(indexStr);
            if (index >= 0 && index < dataList.length) {
              print('📌 Data index $index: ${dataList[index]}');
            } else {
              print('❌ Index tidak valid!');
            }
          } catch (e) {
            print('❌ Harus masukkan angka!');
          }
        }
        break;
        
      case '4':  // UBAH DATA
        print('\n-- UBAH DATA --');
        if (dataList.isEmpty) {
          print('📭 Data masih kosong');
          break;
        }
        
        print('Masukkan index yang ingin diubah (0-${dataList.length-1}): ');
        String? indexStr = stdin.readLineSync();
        
        if (indexStr != null) {
          try {
            int index = int.parse(indexStr);
            if (index >= 0 && index < dataList.length) {
              print('Data lama: ${dataList[index]}');
              print('Masukkan data baru: ');
              String? dataBaru = stdin.readLineSync();
              
              if (dataBaru != null && dataBaru.isNotEmpty) {
                dataList[index] = dataBaru;
                print('✅ Data berhasil diubah!');
              } else {
                print('❌ Data baru tidak boleh kosong!');
              }
            } else {
              print('❌ Index tidak valid!');
            }
          } catch (e) {
            print('❌ Harus masukkan angka!');
          }
        }
        break;
        
      case '5':  // HAPUS DATA BERDASARKAN INDEX
        print('\n-- HAPUS DATA BY INDEX --');
        if (dataList.isEmpty) {
          print('📭 Data masih kosong');
          break;
        }
        
        print('Masukkan index yang ingin dihapus (0-${dataList.length-1}): ');
        String? indexStr = stdin.readLineSync();
        
        if (indexStr != null) {
          try {
            int index = int.parse(indexStr);
            if (index >= 0 && index < dataList.length) {
              String dataHapus = dataList.removeAt(index);
              print('✅ Data "$dataHapus" berhasil dihapus!');
            } else {
              print('❌ Index tidak valid!');
            }
          } catch (e) {
            print('❌ Harus masukkan angka!');
          }
        }
        break;
        
      case '6':  // HAPUS DATA BERDASARKAN NILAI
        print('\n-- HAPUS DATA BY NILAI --');
        if (dataList.isEmpty) {
          print('📭 Data masih kosong');
          break;
        }
        
        print('Masukkan data yang ingin dihapus: ');
        String? dataHapus = stdin.readLineSync();
        
        if (dataHapus != null && dataHapus.isNotEmpty) {
          if (dataList.contains(dataHapus)) {
            dataList.remove(dataHapus);
            print('✅ Data "$dataHapus" berhasil dihapus!');
          } else {
            print('❌ Data "$dataHapus" tidak ditemukan!');
          }
        }
        break;
        
      case '7':  // HITUNG JUMLAH DATA
        print('\n-- JUMLAH DATA --');
        print('📊 Total data: ${dataList.length}');
        break;
        
      case '8':  // CARI DATA
        print('\n-- CARI DATA --');
        if (dataList.isEmpty) {
          print('📭 Data masih kosong');
          break;
        }
        
        print('Masukkan data yang dicari: ');
        String? dataCari = stdin.readLineSync();
        
        if (dataCari != null && dataCari.isNotEmpty) {
          if (dataList.contains(dataCari)) {
            int index = dataList.indexOf(dataCari);
            print('✅ Data "$dataCari" ditemukan di index $index');
          } else {
            print('❌ Data "$dataCari" tidak ditemukan!');
          }
        }
        break;
        
      case '9':  // KELUAR
        print('\n👋 Terima kasih! Program selesai.');
        return;  // Keluar dari program
        
      default:  // PILIHAN TIDAK VALID
        print('❌ Pilihan tidak valid! Pilih 1-9');
    }
  }
}