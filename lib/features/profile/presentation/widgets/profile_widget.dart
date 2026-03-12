// File: lib/features/profile/presentation/widgets/profile_widget.dart
import 'package:flutter/material.dart';
import '../../data/models/profile_model.dart';

class ProfileDetailWidget extends StatelessWidget {
  final ProfileModel profile;

  const ProfileDetailWidget({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(profile.fotoUrl),
          ),
          const SizedBox(height: 16),
          Text(
            profile.nama,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildInfoRow(Icons.email, 'Email', profile.email),
                  const Divider(),
                  _buildInfoRow(Icons.badge, 'NIM', profile.nim),
                  const Divider(),
                  _buildInfoRow(Icons.school, 'Jurusan', profile.jurusan),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey[700]),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              Text(value, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ],
    );
  }
}