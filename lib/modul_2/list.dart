void main() {
  // MEMBUAT LIST DENGAN 3 DATA AWAL
  List<String> names = ['Alfa', 'beta', 'Charlie'];
  print('Data awal: $names');
  
  // 1. MENAMBAH DATA (ADD)
  // Menambahkan data baru di akhir list
  names.add('Delta');
  print('Setelah ditambah: $names');
  
  // 2. MENGAKSES DATA BERDASARKAN INDEX
  // Mengambil data pada posisi tertentu
  print('Elemen index 0: ${names[0]}');  // Mengambil data pertama
  print('Elemen index 1: ${names[1]}');  // Mengambil data kedua
  print('Elemen index 2: ${names[2]}');  // Mengambil data ketiga
  print('Elemen index 3: ${names[3]}');  // Mengambil data keempat
  
  // 3. MENGAKSES DATA DENGAN VARIABEL
  int indexYangDicari = 2;
  print('Data index $indexYangDicari: ${names[indexYangDicari]}');
  
  // 4. MENGUBAH DATA (UPDATE)
  // Mengubah data pada index tertentu
  names[1] = 'Bravo';  // Mengubah data index 1 dari 'beta' menjadi 'Bravo'
  print('Setelah diubah: $names');
  
  // 5. MENGHAPUS DATA (DELETE)
  // Menghapus berdasarkan nilai
  names.remove('Charlie');  // Menghapus data 'Charlie'
  print('Setelah dihapus: $names');
  
  // 6. MENGHAPUS DATA BERDASARKAN INDEX
  // names.removeAt(0);  // Menghapus data index 0
  
  // 7. MENGHITUNG JUMLAH DATA
  print('Jumlah data: ${names.length}');
  
  // 8. CEK APAKAH LIST KOSONG
  print('Apakah list kosong? ${names.isEmpty}');
  print('Apakah list tidak kosong? ${names.isNotEmpty}');
  
  // 9. MENAMPILKAN SEMUA DATA DENGAN PERULANGAN (LOOPING)
  print('\nMenampilkan semua data dengan for loop:');
  for (int i = 0; i < names.length; i++) {
    print('Index $i: ${names[i]}');
  }
  
  // 10. MENAMPILKAN DENGAN FOREACH (CARA LAIN)
  print('\nMenampilkan dengan foreach:');
  for (String name in names) {
    print(name);
  }
  
  // 11. MENCARI DATA
  print('\nApakah ada "Bravo"? ${names.contains('Bravo')}');
  print('Index dari "Bravo": ${names.indexOf('Bravo')}');
  
  // 12. MENYISIPKAN DATA DI POSISI TERTENTU
  names.insert(1, 'Sisipan');  // Menyisipkan di index 1
  print('Setelah disisipkan: $names');
}