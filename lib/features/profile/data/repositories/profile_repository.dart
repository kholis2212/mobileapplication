// File: lib/features/profile/data/repositories/profile_repository.dart
import '../models/profile_model.dart';

class ProfileRepository {
  Future<ProfileModel> getProfile() async {
    await Future.delayed(const Duration(seconds: 1));
    return ProfileModel(
      nama: 'kholis Abdi Pamungkas',
      email: 'kholisabdi@gmail.com',
      nim: '434241109',
      jurusan: 'Teknik Informatika',
      fotoUrl: 'https://via.placeholder.com/150',
    );
  }
}