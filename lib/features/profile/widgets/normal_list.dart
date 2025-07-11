import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:setgaji/core/constants/app_colors.dart';

// non expandable list (navigation?)
class NormalList extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final Function onTap;
  final int? badgeCount;
  const NormalList({super.key, required this.title, this.trailing, required this.onTap, this.badgeCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 6),
      child: InkWell(
        onTap: () {
          HapticFeedback.lightImpact();
          onTap();
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: fontBlue),
                ),
                SizedBox(width: 8),
                if (badgeCount != null) ...[Badge.count(count: badgeCount!, backgroundColor: badgeColor, padding: EdgeInsets.all(2)), SizedBox(width: 12)],
              ],
            ),
            Row(
              children: [
                if (trailing != null) ...[trailing!, SizedBox(width: 12)],
                Icon(HugeIcons.strokeRoundedArrowRight01, color: primaryColor, size: 28),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
