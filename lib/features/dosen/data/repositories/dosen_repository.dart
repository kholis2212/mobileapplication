// File: lib/features/dosen/data/repositories/dosen_repository.dart

import 'package:flutter_application_1/features/dosen/data/models/dosen_model.dart';

class DosenRepository {
  /// Mendapatkan daftar dosen (simulasi data dummy)
  Future<List<DosenModel>> getDosenList() async {
    // Simulasi network delay
    await Future.delayed(const Duration(seconds: 1));

    // Data dummy dosen
    return [
      DosenModel(
        nama: 'Anank Prasetyo',
        nip: '123456789',
        email: 'anank.prasetyo@example.com',
        jurusan: 'Teknik Informatika',
      ),
      DosenModel(
        nama: 'Rachman Sinatriya',
        nip: '987654321',
        email: 'rachman.sinatriya@example.com',
        jurusan: 'Teknik Informatika',
      ),
      DosenModel(
        nama: 'Alfian Sukma',
        nip: '456789123',
        email: 'alfian.sukma@example.com',
        jurusan: 'Teknik Informatika',
      ),
    ];
  }

}