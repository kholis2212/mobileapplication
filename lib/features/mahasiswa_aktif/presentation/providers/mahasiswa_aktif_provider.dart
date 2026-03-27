// File: lib/features/mahasiswa_aktif/presentation/providers/mahasiswa_aktif_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/core/services/local_storage_service.dart';
import 'package:flutter_application_1/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart';
import 'package:flutter_application_1/features/mahasiswa_aktif/data/repositories/mahasiswa_aktif_repository.dart';

// Repository Provider
final mahasiswaAktifRepositoryProvider = Provider<MahasiswaAktifRepository>((ref) {
  return MahasiswaAktifRepository();
});

// LocalStorageService Provider (sudah ada, bisa digunakan langsung)
final localStorageServiceProvider = Provider<LocalStorageService>((ref) {
  return LocalStorageService();
});

// Provider semua data mahasiswa aktif yang disimpan
final savedMahasiswaAktifProvider = FutureProvider<List<Map<String, String>>>((ref) async {
  final storage = ref.watch(localStorageServiceProvider);
  return storage.getSavedUsers();
});

// Provider untuk membaca saved user dari local storage (opsional)
final savedMahasiswaAktifUserProvider = FutureProvider<Map<String, String?>>((ref) async {
  final storage = ref.watch(localStorageServiceProvider);
  final userId = await storage.getUserId();
  final username = await storage.getUsername();
  final token = await storage.getToken();
  return {'userId': userId, 'username': username, 'token': token};
});

// StateNotifier untuk mengelola state mahasiswa aktif
class MahasiswaAktifNotifier extends StateNotifier<AsyncValue<List<MahasiswaAktifModel>>> {
  final MahasiswaAktifRepository _repository;
  final LocalStorageService _storage;

  MahasiswaAktifNotifier(this._repository, this._storage) : super(const AsyncValue.loading()) {
    loadMahasiswaAktifList();
  }

  Future<void> loadMahasiswaAktifList() async {
    state = const AsyncValue.loading();
    try {
      final data = await _repository.getMahasiswaAktifList();
      state = AsyncValue.data(data);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> refresh() async {
    await loadMahasiswaAktifList();
  }

  /// Simpan mahasiswa aktif yang dipilih ke local storage (tanpa menghapus yang lama)
  Future<void> saveSelectedMahasiswaAktif(MahasiswaAktifModel mahasiswaAktif) async {
    await _storage.addUserToSavedList(
      userId: mahasiswaAktif.id.toString(),
      username: mahasiswaAktif.title,  // menggunakan title sebagai username
    );
  }

  /// Hapus user tertentu dari list
  Future<void> removeSavedMahasiswaAktif(String userId) async {
    await _storage.removeSavedUser(userId);
  }

  /// Hapus semua user dari list
  Future<void> clearSavedMahasiswaAktif() async {
    await _storage.clearSavedUsers();
  }
}

// Mahasiswa Aktif Notifier Provider
final mahasiswaAktifNotifierProvider = StateNotifierProvider.autoDispose<
    MahasiswaAktifNotifier, AsyncValue<List<MahasiswaAktifModel>>>((ref) {
  final repository = ref.watch(mahasiswaAktifRepositoryProvider);
  final storage = ref.watch(localStorageServiceProvider);
  return MahasiswaAktifNotifier(repository, storage);
});