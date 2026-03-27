// File: lib/features/mahasiswa/data/repositories/mahasiswa_repository.dart
import 'package:flutter_application_1/core/network/dio_client.dart';
import 'package:flutter_application_1/features/mahasiswa/data/models/mahasiswa_model.dart';
import 'package:dio/dio.dart';

class MahasiswaRepository {
  final DioClient _dioClient;

  // Jika tidak ada dioClient yang dimasukkan, otomatis membuat yang baru
  MahasiswaRepository({DioClient? dioClient})
      : _dioClient = dioClient ?? DioClient();

  /// Fungsi untuk mengambil daftar mahasiswa (comments) dari API
  Future<List<MahasiswaModel>> getMahasiswaList() async {
    try {
      final Response response = await _dioClient.dio.get('/comments');
      final List<dynamic> data = response.data;
      
      // Mengubah setiap data JSON menjadi objek MahasiswaModel
      return data.map((json) => MahasiswaModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception(
        'Gagal memuat data mahasiswa: ${e.response?.statusCode ?? ""} ${e.message}',
      );
    }
  }
}