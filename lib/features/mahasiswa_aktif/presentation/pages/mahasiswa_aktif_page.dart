// File: lib/features/mahasiswa_aktif/presentation/pages/mahasiswa_aktif_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart';
import 'package:flutter_application_1/features/mahasiswa_aktif/presentation/providers/mahasiswa_aktif_provider.dart';

class MahasiswaAktifPage extends ConsumerWidget {
  const MahasiswaAktifPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mahasiswaAktifState = ref.watch(mahasiswaAktifNotifierProvider);
    final savedMahasiswaAktifAsync = ref.watch(savedMahasiswaAktifProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mahasiswa Aktif (Posts)'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep),
            onPressed: () async {
              await ref.read(mahasiswaAktifNotifierProvider.notifier).clearSavedMahasiswaAktif();
              ref.invalidate(savedMahasiswaAktifProvider);
            },
            tooltip: 'Hapus semua postingan tersimpan',
          ),
        ],
      ),
      body: Column(
        children: [
          // Bagian List Postingan yang disimpan di Lokal (Atas)
          savedMahasiswaAktifAsync.when(
            data: (savedMahasiswaAktif) => savedMahasiswaAktif.isEmpty
                ? const SizedBox.shrink()
                : Container(
                    height: 100,
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: savedMahasiswaAktif.length,
                      itemBuilder: (context, index) {
                        final user = savedMahasiswaAktif[index];
                        return Card(
                          color: Colors.orange.shade50,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 120,
                                      child: Text(
                                        user['username'] ?? '',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
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
                                        .read(mahasiswaAktifNotifierProvider.notifier)
                                        .removeSavedMahasiswaAktif(user['user_id']!);
                                    ref.invalidate(savedMahasiswaAktifProvider);
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

          // Bagian List Posts dari API (Bawah)
          Expanded(
            child: mahasiswaAktifState.when(
              data: (mahasiswaAktifList) => MahasiswaAktifListWithSave(
                mahasiswaAktifList: mahasiswaAktifList,
                onRefresh: () =>
                    ref.read(mahasiswaAktifNotifierProvider.notifier).refresh(),
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
                          ref.read(mahasiswaAktifNotifierProvider.notifier).refresh(),
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

class MahasiswaAktifListWithSave extends ConsumerWidget {
  final List<MahasiswaAktifModel> mahasiswaAktifList;
  final VoidCallback onRefresh;

  const MahasiswaAktifListWithSave({
    super.key,
    required this.mahasiswaAktifList,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () async => onRefresh(),
      child: ListView.builder(
        itemCount: mahasiswaAktifList.length,
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
        itemBuilder: (context, index) {
          final post = mahasiswaAktifList[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.orange.shade100,
                child: Text(
                  '${post.id}',
                  style: TextStyle(color: Colors.orange.shade800),
                ),
              ),
              title: Text(
                post.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'User ID: ${post.userId}',
                    style: const TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    post.body.length > 80
                        ? '${post.body.substring(0, 80)}...'
                        : post.body,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              isThreeLine: true,
              trailing: IconButton(
                icon: const Icon(Icons.save, size: 20, color: Colors.orange),
                tooltip: 'Simpan postingan ini',
                onPressed: () async {
                  await ref
                      .read(mahasiswaAktifNotifierProvider.notifier)
                      .saveSelectedMahasiswaAktif(post);
                  
                  ref.invalidate(savedMahasiswaAktifProvider);

                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "${post.title} berhasil disimpan ke local storage",
                        ),
                        backgroundColor: Colors.orange,
                      ),
                    );
                  }
                },
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (dialogContext) => AlertDialog(
                    title: Text(
                      post.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('User ID: ${post.userId}'),
                        Text('Post ID: ${post.id}'),
                        const SizedBox(height: 8),
                        const Divider(),
                        Text(
                          'Isi Postingan:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(post.body),
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