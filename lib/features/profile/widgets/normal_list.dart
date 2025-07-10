import 'package:flutter/material.dart';
import 'package:setgaji/core/constants/app_colors.dart';

// non expandable list (navigation?)
class NormalList extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;
  final int? badgeCount;
  const NormalList({super.key, required this.title, this.trailing, this.onTap, this.badgeCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: fontBlue),
                ),
                const SizedBox(width: 8),
                if (badgeCount != null) ...[Badge.count(count: badgeCount!, backgroundColor: badgeColor, padding: const EdgeInsets.all(2)), const SizedBox(width: 12)],
              ],
            ),

            Row(
              children: [
                if (trailing != null) ...[trailing!, const SizedBox(width: 12)],
                const Icon(Icons.chevron_right, color: primaryColor, size: 28),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
