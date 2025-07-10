import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:setgaji/core/constants/app_colors.dart';

/// custom icon button
class AppIconButton extends StatelessWidget {
  const AppIconButton({super.key, required this.icon, required this.onPressed, this.borderless = false, this.buttonSize = 56, this.iconSize = 24, this.badgeCount});
  final IconData icon;
  final VoidCallback onPressed;
  final bool borderless;
  final double? buttonSize;
  final double iconSize;
  final int? badgeCount;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: buttonSize,
          width: buttonSize,
          decoration: BoxDecoration(
            color: backgroundWhite,
            border: borderless ? null : Border.all(color: dividerColor, width: 1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: IconButton(
            highlightColor: Colors.transparent,
            onPressed: onPressed,
            icon: HugeIcon(icon: icon, color: primaryColor, size: iconSize),
          ),
        ),
        if (badgeCount != null)
          Positioned(
            top: 0,
            right: 0,
            child: Badge.count(count: badgeCount!, backgroundColor: badgeColor),
          ),
      ],
    );
  }
}
