void main() {
  // MEMBUAT MAP
  // Map<String, String> artinya: Key String, Value String
  Map<String, String> kontak = {
    'Anang': '081234567890',   // Key: 'Anang', Value: '081234567890'
    'Arman': '082345678901',   // Key: 'Arman', Value: '082345678901'
    'Doni': '083456789012'     // Key: 'Doni', Value: '083456789012'
  };
  
  print('=' * 50);
  print('OPERASI MAP');
  print('=' * 50);
  
  print('Data awal: $kontak');
  
  // 1. MENAMBAH DATA
  kontak['Rio'] = '084567890123';  // Menambah dengan key 'Rio'
  print('\nSetelah ditambah Rio: $kontak');
  
  // 2. MENAMBAH BANYAK DATA
  kontak.addAll({
    'Siti': '085678901234',
    'Budi': '086789012345'
  });
  print('Setelah ditambah banyak: $kontak');
  
  // 3. MENGAKSES DATA BERDASARKAN KEY
  print('\n-- MENGAKSES DATA --');
  print('Nomor Anang: ${kontak['Anang']}');
  print('Nomor Rio: ${kontak['Rio']}');
  
  // 4. MENGUBAH DATA
  kontak['Arman'] = '087654321098';  // Ubah nomor Arman
  print('\nSetelah ubah Arman: $kontak');
  
  // 5. MENGHAPUS DATA
  kontak.remove('Doni');
  print('Setelah hapus Doni: $kontak');
  
  // 6. CEK KEY TERTENTU
  print('\n-- PENCARIAN --');
  print('Apakah ada key "Anang"? ${kontak.containsKey('Anang')}');
  print('Apakah ada key "Doni"? ${kontak.containsKey('Doni')}');
  
  // 7. CEK VALUE TERTENTU
  print('Apakah ada nomor "081234567890"? ${kontak.containsValue('081234567890')}');
  
  // 8. HITUNG JUMLAH DATA
  print('\n-- INFORMASI --');
  print('Jumlah kontak: ${kontak.length}');
  
  // 9. TAMPILKAN SEMUA KEY
  print('Semua nama: ${kontak.keys}');
  
  // 10. TAMPILKAN SEMUA VALUE
  print('Semua nomor: ${kontak.values}');
  
  // 11. LOOPING MAP
  print('\n-- DAFTAR KONTAK --');
  kontak.forEach((key, value) {
    print('📞 $key: $value');
  });
  
  // 12. CEK APAKAH MAP KOSONG
  print('\nApakah kontak kosong? ${kontak.isEmpty}');
}