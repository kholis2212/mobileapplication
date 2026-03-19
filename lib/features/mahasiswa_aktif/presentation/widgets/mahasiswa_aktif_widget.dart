// File: lib/features/mahasiswa_aktif/presentation/widgets/mahasiswa_aktif_widget.dart

import 'package:flutter/material.dart';
import '../../data/models/mahasiswa_aktif_model.dart';

class MahasiswaAktifCard extends StatelessWidget {
  final MahasiswaAktifModel mahasiswa;
  final VoidCallback? onTap;

  const MahasiswaAktifCard({Key? key, required this.mahasiswa, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(mahasiswa.title.isNotEmpty ? mahasiswa.title[0] : '?'),
        ),
        title: Text(mahasiswa.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID Post: ${mahasiswa.id}'),
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