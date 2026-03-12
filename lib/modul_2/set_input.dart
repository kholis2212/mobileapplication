import 'dart:io';

void main() {
  Set<String> dataSet = {};
  
  print('=' * 50);
  print('PROGRAM MANAJEMEN SET (DATA UNIK)');
  print('=' * 50);
  print('Catatan: Set tidak boleh memiliki data duplikat!');
  
  while (true) {
    print('\n--- MENU SET ---');
    print('1. Tambah Data');
    print('2. Lihat Semua Data');
    print('3. Hapus Data');
    print('4. Cek Data');
    print('5. Hitung Jumlah Data');
    print('6. Hapus Semua Data');
    print('7. Keluar');
    print('Pilih menu (1-7): ');
    
    String? pilihan = stdin.readLineSync();
    
    switch (pilihan) {
      case '1':
        print('\n-- TAMBAH DATA --');
        print('Masukkan data: ');
        String? data = stdin.readLineSync();
        
        if (data != null && data.isNotEmpty) {
          bool ditambahkan = dataSet.add(data);
          if (ditambahkan) {
            print('✅ Data "$data" berhasil ditambahkan!');
          } else {
            print('⚠️ Data "$data" sudah ada! (Tidak boleh duplikat)');
          }
        }
        break;
        
      case '2':
        print('\n-- SEMUA DATA --');
        if (dataSet.isEmpty) {
          print('📭 Data masih kosong');
        } else {
          int i = 1;
          for (String data in dataSet) {
            print('$i. $data');
            i++;
          }
          print('📊 Total data unik: ${dataSet.length}');
        }
        break;
        
      case '3':
        print('\n-- HAPUS DATA --');
        if (dataSet.isEmpty) {
          print('📭 Data masih kosong');
          break;
        }
        
        print('Masukkan data yang ingin dihapus: ');
        String? dataHapus = stdin.readLineSync();
        
        if (dataHapus != null && dataHapus.isNotEmpty) {
          if (dataSet.remove(dataHapus)) {
            print('✅ Data "$dataHapus" berhasil dihapus!');
          } else {
            print('❌ Data "$dataHapus" tidak ditemukan!');
          }
        }
        break;
        
      case '4':
        print('\n-- CEK DATA --');
        print('Masukkan data yang dicek: ');
        String? dataCek = stdin.readLineSync();
        
        if (dataCek != null && dataCek.isNotEmpty) {
          if (dataSet.contains(dataCek)) {
            print('✅ Data "$dataCek" ADA dalam set');
          } else {
            print('❌ Data "$dataCek" TIDAK ADA dalam set');
          }
        }
        break;
        
      case '5':
        print('\n-- JUMLAH DATA --');
        print('📊 Total data unik: ${dataSet.length}');
        break;
        
      case '6':
        print('\n-- HAPUS SEMUA DATA --');
        print('Yakin ingin menghapus semua data? (y/n): ');
        String? konfirmasi = stdin.readLineSync();
        
        if (konfirmasi?.toLowerCase() == 'y') {
          dataSet.clear();
          print('✅ Semua data berhasil dihapus!');
        }
        break;
        
      case '7':
        print('\n👋 Terima kasih!');
        return;
        
      default:
        print('❌ Pilihan tidak valid!');
    }
  }
}