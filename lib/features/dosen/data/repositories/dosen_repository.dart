import 'package:flutter_application_1/core/network/dio_client.dart';
import 'package:flutter_application_1/features/dosen/data/models/dosen_model.dart';
import 'package:dio/dio.dart';

class DosenRepository {
  final DioClient _dioClient;

  // Jika tidak ada dioClient yang dimasukkan, otomatis membuat yang baru
  DosenRepository({DioClient? dioClient})
      : _dioClient = dioClient ?? DioClient();

  /// Fungsi untuk mengambil daftar dosen dari API
  Future<List<DosenModel>> getDosenList() async {
    try {
      final Response response = await _dioClient.dio.get('/users');
      final List<dynamic> data = response.data;
      
      // Mengubah setiap data JSON menjadi objek DosenModel
      return data.map((json) => DosenModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception(
        'Gagal memuat data dosen: ${e.response?.statusCode ?? ""} ${e.message}',
      );
    }
  }
}