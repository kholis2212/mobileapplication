// File: lib/features/mahasiswa/data/models/mahasiswa_model.dart
class MahasiswaModel {
  final String nama;
  final String nim;
  final String jurusan;
  final String angkatan;

  MahasiswaModel({
    required this.nama,
    required this.nim,
    required this.jurusan,
    required this.angkatan,
  });

  factory MahasiswaModel.fromJson(Map<String, dynamic> json) {
    return MahasiswaModel(
      nama: json['nama'] ?? '',
      nim: json['nim'] ?? '',
      jurusan: json['jurusan'] ?? '',
      angkatan: json['angkatan'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'nim': nim,
      'jurusan': jurusan,
      'angkatan': angkatan,
    };
  }
}