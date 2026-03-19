// File: lib/features/dosen/data/repositories/dosen_repository.dart
import 'package:dio/dio.dart';
import '../models/dosen_model.dart';

class DosenRepository {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://jsonplaceholder.typicode.com',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
    headers: {'Accept': 'application/json'},
  ));

  // Mendapatkan daftar dosen dari API menggunakan Dio
  Future<List<DosenModel>> getDosenList() async {
    try {
      final response = await _dio.get('/users');
      
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => DosenModel.fromJson(json)).toList();
      } else {
        throw Exception('Gagal memuat data dosen: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Dio error: ${e.message}');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Optional: method dengan HTTP biasa (untuk perbandingan)
  // Future<List<DosenModel>> getDosenListWithHttp() async { ... }
}