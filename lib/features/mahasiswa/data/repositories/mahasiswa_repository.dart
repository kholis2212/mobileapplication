// File: lib/features/mahasiswa/data/repositories/mahasiswa_repository.dart
import '../models/mahasiswa_model.dart';

class MahasiswaRepository {
  Future<List<MahasiswaModel>> getMahasiswaList() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      MahasiswaModel(
        nama: 'Kholis Abdi Pamungkas',
        nim: '434241109',
        jurusan: 'Teknik Informatika',
        angkatan: '2024',
      ),
      MahasiswaModel(
        nama: 'M. Faris Sabiq',
        nim: '434241067',
        jurusan: 'Teknik Informatika',
        angkatan: '2024',
      ),
      MahasiswaModel(
        nama: 'Rozan Aiman Ramadani',
        nim: '434241069',
        jurusan: 'Teknik Informatika',
        angkatan: '2024',
      ),
    ];
  }
}