// File: lib/features/mahasiswa/presentation/widgets/mahasiswa_widget.dart
import 'package:flutter/material.dart';
import '../../data/models/mahasiswa_model.dart';

class MahasiswaCard extends StatelessWidget {
  final MahasiswaModel mahasiswa;
  final VoidCallback? onTap;

  const MahasiswaCard({Key? key, required this.mahasiswa, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(mahasiswa.name.isNotEmpty ? mahasiswa.name[0] : '?'),
        ),
        title: Text(mahasiswa.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email: ${mahasiswa.email}'),
            const SizedBox(height: 4),
            Text(
              mahasiswa.body,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
        isThreeLine: true,
        onTap: onTap,
      ),
    );
  }
}