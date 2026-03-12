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
          child: Text(mahasiswa.nama[0]),
        ),
        title: Text(mahasiswa.nama),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('NIM: ${mahasiswa.nim}'),
            Text('Jurusan: ${mahasiswa.jurusan}'),
            Text('Angkatan: ${mahasiswa.angkatan}'),
          ],
        ),
        isThreeLine: true,
        onTap: onTap,
      ),
    );
  }
}