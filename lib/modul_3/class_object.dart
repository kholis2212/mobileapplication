import 'dart:io';

// Definisi class Mahasiswa
class Mahasiswa {
  String nama;
  String nim;
  String jurusan;

  // Constructor
  Mahasiswa(this.nama, this.nim, this.jurusan);

  // Method untuk menampilkan data
  void tampilkanInfo() {
    print('Nama: $nama');
    print('NIM: $nim');
    print('Jurusan: $jurusan');
  }

  // Method untuk mengubah nama
  void ubahNama(String namaBaru) {
    nama = namaBaru;
    print('Nama berhasil diubah menjadi $nama');
  }
}

void main() {
  // Membuat objek dari class Mahasiswa
  Mahasiswa mhs = Mahasiswa('Kholis', '123456', 'D4 TI');
  mhs.tampilkanInfo();

  // Interaksi dengan user
  stdout.write('Masukkan nama baru: ');
  String? namaBaru = stdin.readLineSync();
  if (namaBaru != null && namaBaru.isNotEmpty) {
    mhs.ubahNama(namaBaru);
  }

  // Tampilkan lagi setelah diubah
  mhs.tampilkanInfo();
}