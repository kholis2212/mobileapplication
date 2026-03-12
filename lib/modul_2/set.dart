void main() {
  // MEMBUAT SET
  Set<String> burung = {'Merpati', 'Elang', 'Kakatua'};
  
  print('=' * 50);
  print('OPERASI SET');
  print('=' * 50);
  
  print('Data awal: $burung');
  
  // 1. MENAMBAH DATA (ADD)
  burung.add('Kenari');
  print('Setelah ditambah "Kenari": $burung');
  
  // 2. MENAMBAH DATA DUPLIKAT (TIDAK AKAN MASUK)
  bool berhasil = burung.add('Merpati');  // Merpati sudah ada
  print('Mencoba tambah "Merpati" (duplikat): $berhasil');
  print('Setelah tambah duplikat: $burung');  // Tetap sama
  
  // 3. MENAMBAH BANYAK DATA SEKALIGUS
  burung.addAll(['Beo', 'Cendrawasih']);
  print('Setelah tambah banyak: $burung');
  
  // 4. MENGHAPUS DATA
  burung.remove('Elang');
  print('Setelah hapus "Elang": $burung');
  
  // 5. CEK DATA TERTENTU
  print('\n-- PENCARIAN --');
  print('Apakah ada "Merpati"? ${burung.contains('Merpati')}');
  print('Apakah ada "Elang"? ${burung.contains('Elang')}');
  
  // 6. HITUNG JUMLAH DATA
  print('\n-- INFORMASI --');
  print('Jumlah data: ${burung.length}');
  print('Apakah kosong? ${burung.isEmpty}');
  
  // 7. MENAMPILKAN SEMUA DATA
  print('\n-- SEMUA DATA --');
  for (String b in burung) {
    print('• $b');
  }
  
  // 8. OPERASI HIMPUNAN
  print('\n-- OPERASI HIMPUNAN --');
  
  Set<String> setA = {1, 2, 3, 4, 5}.map((e) => 'Angka $e').toSet();
  Set<String> setB = {4, 5, 6, 7, 8}.map((e) => 'Angka $e').toSet();
  
  print('Set A: $setA');
  print('Set B: $setB');
  
  // Gabungan (union)
  print('Gabungan A dan B: ${setA.union(setB)}');
  
  // Irisan (intersection)
  print('Irisan A dan B: ${setA.intersection(setB)}');
  
  // Selisih (difference)
  print('Selisih A - B: ${setA.difference(setB)}');
}