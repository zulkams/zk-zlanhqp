import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:setgaji/core/widgets/app_button.dart';
import 'package:setgaji/core/widgets/app_icon_button.dart';

class AppBottomButtons extends StatelessWidget {
  const AppBottomButtons({super.key, required this.middleButtonTitle, required this.onMiddleButtonPressed, this.disabled = false});

  final String middleButtonTitle;
  final VoidCallback onMiddleButtonPressed;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppIconButton(icon: HugeIcons.strokeRoundedHeadset, onPressed: () {}),
        const SizedBox(width: 12),
        Expanded(
          child: AppButton(label: middleButtonTitle, onPressed: onMiddleButtonPressed, disabled: disabled),
        ),
        const SizedBox(width: 12),
        AppIconButton(icon: HugeIcons.strokeRoundedClock02, onPressed: () {}),
      ],
    );
  }
}
