// File: lib/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart
class MahasiswaAktifModel {
  final String nama;
  final String nim;
  final String jurusan;
  final String semester;

  MahasiswaAktifModel({
    required this.nama,
    required this.nim,
    required this.jurusan,
    required this.semester,
  });

  factory MahasiswaAktifModel.fromJson(Map<String, dynamic> json) {
    return MahasiswaAktifModel(
      nama: json['nama'] ?? '',
      nim: json['nim'] ?? '',
      jurusan: json['jurusan'] ?? '',
      semester: json['semester'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'nim': nim,
      'jurusan': jurusan,
      'semester': semester,
    };
  }
}