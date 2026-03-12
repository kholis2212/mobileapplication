// Class dasar Mahasiswa
class Mahasiswa {
  String nama;
  String nim;
  String jurusan;

  Mahasiswa(this.nama, this.nim, this.jurusan);

  void tampilkanInfo() {
    print('Nama: $nama');
    print('NIM: $nim');
    print('Jurusan: $jurusan');
  }
}

// Class turunan MahasiswaAktif
class MahasiswaAktif extends Mahasiswa {
  int semester;
  String status = 'Aktif';

  MahasiswaAktif(String nama, String nim, String jurusan, this.semester)
      : super(nama, nim, jurusan);

  @override
  void tampilkanInfo() {
    super.tampilkanInfo();
    print('Semester: $semester');
    print('Status: $status');
  }

  void ikutKuliah() {
    print('$nama sedang mengikuti perkuliahan.');
  }
}

// Class turunan MahasiswaAlumni
class MahasiswaAlumni extends Mahasiswa {
  int tahunLulus;
  String status = 'Alumni';

  MahasiswaAlumni(String nama, String nim, String jurusan, this.tahunLulus)
      : super(nama, nim, jurusan);

  @override
  void tampilkanInfo() {
    super.tampilkanInfo();
    print('Tahun Lulus: $tahunLulus');
    print('Status: $status');
  }

  void bekerja() {
    print('$nama sedang bekerja.');
  }
}

void main() {
  print('=== Mahasiswa Aktif ===');
  var aktif = MahasiswaAktif('Kholis', '123456', 'D4 TI', 5);
  aktif.tampilkanInfo();
  aktif.ikutKuliah();

  print('\n=== Mahasiswa Alumni ===');
  var alumni = MahasiswaAlumni('Abdi', '654321', 'D4 TI', 2023);
  alumni.tampilkanInfo();
  alumni.bekerja();
}