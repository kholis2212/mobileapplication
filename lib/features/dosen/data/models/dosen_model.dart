// File: lib/features/mahasiswa/data/model/dosen_model.dart

class DosenModel {
  final String nama;
  final String nip;
  final String email;
  final String jurusan;

  DosenModel({
    required this.nama,
    required this.nip,
    required this.email,
    required this.jurusan,
  });

  factory DosenModel.fromJson(Map<String, dynamic> json) {
    return DosenModel(
      nama: json['nama'] ?? '',
      nip: json['nip'] ?? '',
      email: json['email'] ?? '',
      jurusan: json['jurusan'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'nip': nip,
      'email': email,
      'jurusan': jurusan,
    };
  }

  // Optional: copyWith method untuk memudahkan pembaruan
  DosenModel copyWith({
    String? nama,
    String? nip,
    String? email,
    String? jurusan,
  }) {
    return DosenModel(
      nama: nama ?? this.nama,
      nip: nip ?? this.nip,
      email: email ?? this.email,
      jurusan: jurusan ?? this.jurusan,
    );
  }
}