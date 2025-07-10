import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:setgaji/core/constants/app_colors.dart';

// custom leading widget fr appbar
class AppDropdownLeading extends StatelessWidget {
  const AppDropdownLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: backgroundWhite,
              shape: BoxShape.circle,
              border: Border.all(color: dividerColor, width: 1),
            ),
            alignment: Alignment.center,
            child: Icon(HugeIcons.strokeRoundedArrowDown01, size: 18),
          ),
          const SizedBox(width: 3),
          Icon(HugeIcons.strokeRoundedArrowDown01, size: 18),
        ],
      ),
    );
  }
}
