// File: lib/features/mahasiswa/presentation/pages/mahasiswa_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/features/mahasiswa/data/models/mahasiswa_model.dart';
import 'package:flutter_application_1/features/mahasiswa/presentation/providers/mahasiswa_provider.dart';

class MahasiswaPage extends ConsumerWidget {
  const MahasiswaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mahasiswaState = ref.watch(mahasiswaNotifierProvider);
    final savedMahasiswaAsync = ref.watch(savedMahasiswaProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Mahasiswa'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep),
            onPressed: () async {
              await ref.read(mahasiswaNotifierProvider.notifier).clearSavedMahasiswa();
              ref.invalidate(savedMahasiswaProvider);
            },
            tooltip: 'Hapus semua mahasiswa tersimpan',
          ),
        ],
      ),
      body: Column(
        children: [
          // Bagian List Mahasiswa yang disimpan di Lokal (Atas)
          savedMahasiswaAsync.when(
            data: (savedMahasiswa) => savedMahasiswa.isEmpty
                ? const SizedBox.shrink()
                : Container(
                    height: 100,
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: savedMahasiswa.length,
                      itemBuilder: (context, index) {
                        final user = savedMahasiswa[index];
                        return Card(
                          color: Colors.green.shade50,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      user['username'] ?? '',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "ID: ${user['user_id']}",
                                      style: const TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  icon: const Icon(Icons.close, size: 16, color: Colors.red),
                                  onPressed: () async {
                                    await ref
                                        .read(mahasiswaNotifierProvider.notifier)
                                        .removeSavedMahasiswa(user['user_id']!);
                                    ref.invalidate(savedMahasiswaProvider);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
            loading: () => const LinearProgressIndicator(),
            error: (err, stack) => Text('Error: $err'),
          ),

          const Divider(),

          // Bagian List Mahasiswa dari API (Bawah)
          Expanded(
            child: mahasiswaState.when(
              data: (mahasiswaList) => MahasiswaListWithSave(
                mahasiswaList: mahasiswaList,
                onRefresh: () =>
                    ref.read(mahasiswaNotifierProvider.notifier).refresh(),
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Gagal memuat data: $error'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () =>
                          ref.read(mahasiswaNotifierProvider.notifier).refresh(),
                      child: const Text('Coba Lagi'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MahasiswaListWithSave extends ConsumerWidget {
  final List<MahasiswaModel> mahasiswaList;
  final VoidCallback onRefresh;

  const MahasiswaListWithSave({
    super.key,
    required this.mahasiswaList,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () async => onRefresh(),
      child: ListView.builder(
        itemCount: mahasiswaList.length,
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
        itemBuilder: (context, index) {
          final mahasiswa = mahasiswaList[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green.shade100,
                child: Text(
                  '${mahasiswa.id}',
                  style: TextStyle(color: Colors.green.shade800),
                ),
              ),
              title: Text(
                mahasiswa.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mahasiswa.email,
                    style: const TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    mahasiswa.body.length > 60
                        ? '${mahasiswa.body.substring(0, 60)}...'
                        : mahasiswa.body,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              isThreeLine: true,
              trailing: IconButton(
                icon: const Icon(Icons.save, size: 20, color: Colors.green),
                tooltip: 'Simpan mahasiswa ini',
                onPressed: () async {
                  await ref
                      .read(mahasiswaNotifierProvider.notifier)
                      .saveSelectedMahasiswa(mahasiswa);
                  
                  ref.invalidate(savedMahasiswaProvider);

                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "${mahasiswa.name} berhasil disimpan ke local storage",
                        ),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                },
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (dialogContext) => AlertDialog(
                    title: Text(mahasiswa.name),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email: ${mahasiswa.email}'),
                        const SizedBox(height: 8),
                        Text('Post ID: ${mahasiswa.postId}'),
                        const SizedBox(height: 8),
                        const Divider(),
                        Text(
                          'Komentar:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(mahasiswa.body),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(dialogContext),
                        child: const Text('Tutup'),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}