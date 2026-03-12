// File: lib/features/mahasiswa_aktif/data/repositories/mahasiswa_aktif_repository.dart
import '../models/mahasiswa_aktif_model.dart';

class MahasiswaAktifRepository {
  Future<List<MahasiswaAktifModel>> getMahasiswaAktifList() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      MahasiswaAktifModel(
        nama: 'Kholis Abdi Pamungkas',
        nim: '434241109',
        jurusan: 'Teknik Informatika',
        semester: '4',
      ),
      MahasiswaAktifModel(
        nama: 'Dian Pratama',
        nim: '202402002',
        jurusan: 'Sistem Informasi',
        semester: '4',
      ),
    ];
  }
}