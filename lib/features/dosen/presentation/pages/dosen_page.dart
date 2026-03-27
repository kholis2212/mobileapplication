import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/features/dosen/data/models/dosen_model.dart';
import 'package:flutter_application_1/features/dosen/presentation/providers/dosen_provider.dart';

class DosenPage extends ConsumerWidget {
  const DosenPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dosenState = ref.watch(dosenNotifierProvider);
    final savedUsersAsync = ref.watch(savedUsersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Dosen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep),
            onPressed: () async {
              await ref.read(dosenNotifierProvider.notifier).clearSavedUsers();
              ref.invalidate(savedUsersProvider);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Bagian List User yang disimpan di Lokal (Atas)
          savedUsersAsync.when(
            data: (savedUsers) => savedUsers.isEmpty
                ? const SizedBox.shrink()
                : Container(
                    height: 100,
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: savedUsers.length,
                      itemBuilder: (context, index) {
                        final user = savedUsers[index];
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      user['username'] ?? '',
                                      style: const TextStyle(fontWeight: FontWeight.bold),
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
                                        .read(dosenNotifierProvider.notifier)
                                        .removeSavedUser(user['user_id']!);
                                    ref.invalidate(savedUsersProvider);
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

          // Bagian List Dosen dari API (Bawah)
          Expanded(
            child: dosenState.when(
              data: (dosenList) => DosenListWithSave(
                dosenList: dosenList,
                onRefresh: () =>
                    ref.read(dosenNotifierProvider.notifier).refresh(),
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Gagal memuat data: $error'),
                    ElevatedButton(
                      onPressed: () =>
                          ref.read(dosenNotifierProvider.notifier).refresh(),
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

class DosenListWithSave extends ConsumerWidget {
  final List<DosenModel> dosenList;
  final VoidCallback onRefresh;

  const DosenListWithSave({
    super.key,
    required this.dosenList,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () async => onRefresh(),
      child: ListView.builder(
        itemCount: dosenList.length,
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
        itemBuilder: (context, index) {
          final dosen = dosenList[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: CircleAvatar(child: Text('${dosen.id}')),
              title: Text(dosen.name),
              subtitle: Text(
                "${dosen.username} (${dosen.email})\n${dosen.address.city}",
              ),
              isThreeLine: true,
              trailing: IconButton(
                icon: const Icon(Icons.save, size: 18),
                tooltip: 'Simpan user ini',
                onPressed: () async {
                  await ref
                      .read(dosenNotifierProvider.notifier)
                      .saveSelectedDosen(dosen);
                  
                  ref.invalidate(savedUsersProvider);

                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "${dosen.username} berhasil disimpan ke local storage",
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}