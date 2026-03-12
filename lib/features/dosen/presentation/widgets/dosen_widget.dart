import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/dosen/data/models/dosen_model.dart';

// ====================== Simple Dosen Card ======================
class DosenCard extends StatelessWidget {
  final DosenModel dosen;
  final VoidCallback? onTap;

  const DosenCard({Key? key, required this.dosen, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(dosen.nama.isNotEmpty ? dosen.nama[0] : '?'),
        ),
        title: Text(dosen.nama, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('NIP: ${dosen.nip}'),
            Text('Email: ${dosen.email}'),
            Text('Jurusan: ${dosen.jurusan}'),
          ],
        ),
        isThreeLine: true,
        onTap: onTap,
      ),
    );
  }
}

// ====================== Modern Dosen Card with Animation ======================
class ModernDosenCard extends StatefulWidget {
  final DosenModel dosen;
  final List<Color>? gradientColors;
  final VoidCallback? onTap;

  const ModernDosenCard({
    Key? key,
    required this.dosen,
    this.gradientColors,
    this.onTap,
  }) : super(key: key);

  @override
  State<ModernDosenCard> createState() => _ModernDosenCardState();
}

class _ModernDosenCardState extends State<ModernDosenCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.97,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final gradientColors = widget.gradientColors ??
        [theme.primaryColor, theme.primaryColor.withOpacity(0.7)];

    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        widget.onTap?.call();
      },
      onTapCancel: () => _controller.reverse(),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, gradientColors[0].withOpacity(0.05)],
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: gradientColors[0].withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Avatar dengan gradient
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: gradientColors,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: gradientColors[0].withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      widget.dosen.nama.isNotEmpty
                          ? widget.dosen.nama.substring(0, 1).toUpperCase()
                          : '?',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Informasi dosen
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.dosen.nama,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.3,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      _buildInfoRow(
                        Icons.badge_outlined,
                        'NIP: ${widget.dosen.nip}',
                      ),
                      const SizedBox(height: 4),
                      _buildInfoRow(Icons.email_outlined, widget.dosen.email),
                      const SizedBox(height: 4),
                      _buildInfoRow(
                        Icons.school_outlined,
                        widget.dosen.jurusan,
                      ),
                    ],
                  ),
                ),
                // Ikon panah
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: gradientColors[0].withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                    color: gradientColors[0],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 14, color: Colors.grey[600]),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 13, color: Colors.grey[700]),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

// ====================== Dosen List View ======================
class DosenListView extends StatelessWidget {
  final List<DosenModel> dosenList;
  final VoidCallback onRefresh;
  final bool useModernCard;

  const DosenListView({
    Key? key,
    required this.dosenList,
    required this.onRefresh,
    this.useModernCard = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => onRefresh(),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: dosenList.length,
        itemBuilder: (context, index) {
          final dosen = dosenList[index];
          if (useModernCard) {
            return ModernDosenCard(
              dosen: dosen,
              onTap: () => _showDetailDialog(context, dosen),
            );
          } else {
            return DosenCard(
              dosen: dosen,
              onTap: () => _showDetailDialog(context, dosen),
            );
          }
        },
      ),
    );
  }

  void _showDetailDialog(BuildContext context, DosenModel dosen) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(dosen.nama),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('NIP: ${dosen.nip}'),
            Text('Email: ${dosen.email}'),
            Text('Jurusan: ${dosen.jurusan}'),
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
  }
}