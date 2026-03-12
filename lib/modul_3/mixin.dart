// Mixin 1: Kemampuan Mengajar
mixin Mengajar {
  void mengajar() {
    print('Mengajar mahasiswa di kelas.');
  }
}

// Mixin 2: Kemampuan Meneliti
mixin Meneliti {
  void meneliti() {
    print('Melakukan penelitian.');
  }
}

// Mixin 3: Kemampuan Pengabdian
mixin Mengabdi {
  void mengabdi() {
    print('Melakukan pengabdian kepada masyarakat.');
  }
}

// Class dasar Pegawai
class Pegawai {
  String nama;
  String nip;

  Pegawai(this.nama, this.nip);

  void tampilkanInfo() {
    print('Nama: $nama');
    print('NIP: $nip');
  }
}

// Class Dosen mewarisi Pegawai dan menggunakan ketiga mixin
class Dosen extends Pegawai with Mengajar, Meneliti, Mengabdi {
  String fakultas;

  Dosen(String nama, String nip, this.fakultas) : super(nama, nip);

  @override
  void tampilkanInfo() {
    super.tampilkanInfo();
    print('Fakultas: $fakultas');
  }
}

// Class Fakultas (tanpa mixin, tapi bisa menggunakan mixin jika diperlukan)
class Fakultas {
  String namaFakultas;
  List<Dosen> daftarDosen = [];

  Fakultas(this.namaFakultas);

  void tambahDosen(Dosen dosen) {
    daftarDosen.add(dosen);
    print('${dosen.nama} ditambahkan ke Fakultas $namaFakultas');
  }

  void tampilkanDosen() {
    print('Daftar dosen di Fakultas $namaFakultas:');
    for (var d in daftarDosen) {
      print('- ${d.nama}');
    }
  }
}

void main() {
  // Membuat objek Dosen
  var dosen1 = Dosen('Prof. Kholis', '197001012005011001', 'FTI');
  var dosen2 = Dosen('Dr. Abdi', '197502152010012002', 'FTI');

  print('=== Informasi Dosen ===');
  dosen1.tampilkanInfo();
  print('\nKemampuan Dosen:');
  dosen1.mengajar();
  dosen1.meneliti();
  dosen1.mengabdi();

  // Membuat Fakultas
  var fti = Fakultas('Teknologi Informasi');
  fti.tambahDosen(dosen1);
  fti.tambahDosen(dosen2);
  fti.tampilkanDosen();
}