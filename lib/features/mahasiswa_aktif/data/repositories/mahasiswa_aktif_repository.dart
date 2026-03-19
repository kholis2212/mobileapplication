// File: lib/features/mahasiswa_aktif/data/repositories/mahasiswa_aktif_repository.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import '../models/mahasiswa_aktif_model.dart';

class MahasiswaAktifRepository {
  final String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  // Menggunakan HTTP
  Future<List<MahasiswaAktifModel>> getMahasiswaAktifListWithHttp() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => MahasiswaAktifModel.fromJson(json)).toList();
      } else {
        throw Exception('Gagal memuat: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Menggunakan Dio
  Future<List<MahasiswaAktifModel>> getMahasiswaAktifListWithDio() async {
    final Dio _dio = Dio(BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ));

    try {
      final response = await _dio.get('/posts');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => MahasiswaAktifModel.fromJson(json)).toList();
      } else {
        throw Exception('Gagal memuat: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Dio error: ${e.message}');
    }
  }

  // Method utama yang dipakai (bisa pilih salah satu)
  Future<List<MahasiswaAktifModel>> getMahasiswaAktifList() async {
    // return getMahasiswaAktifListWithHttp();  // pakai HTTP
    return getMahasiswaAktifListWithDio();      // pakai Dio
  }
}