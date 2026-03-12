// File: lib/features/profile/data/models/profile_model.dart
class ProfileModel {
  final String nama;
  final String email;
  final String nim;
  final String jurusan;
  final String fotoUrl;

  ProfileModel({
    required this.nama,
    required this.email,
    required this.nim,
    required this.jurusan,
    required this.fotoUrl,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      nama: json['nama'] ?? '',
      email: json['email'] ?? '',
      nim: json['nim'] ?? '',
      jurusan: json['jurusan'] ?? '',
      fotoUrl: json['fotoUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'email': email,
      'nim': nim,
      'jurusan': jurusan,
      'fotoUrl': fotoUrl,
    };
  }
}