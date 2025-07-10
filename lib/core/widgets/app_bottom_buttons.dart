import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:setgaji/core/constants/app_colors.dart';
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
        AppIconButton(icon: HugeIcons.strokeRoundedHeadset, onPressed: HapticFeedback.lightImpact),
        const SizedBox(width: 12),
        Expanded(
          child: _AppJadeButton(label: middleButtonTitle, onPressed: onMiddleButtonPressed, disabled: disabled),
        ),
        const SizedBox(width: 12),
        AppIconButton(icon: HugeIcons.strokeRoundedClock02, onPressed: HapticFeedback.lightImpact),
      ],
    );
  }
}

// jade main action button
class _AppJadeButton extends StatelessWidget {
  const _AppJadeButton({required this.label, required this.onPressed, this.disabled = false});
  final String label;
  final VoidCallback onPressed;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ElevatedButton(
        onPressed: disabled ? null : onPressed,
        style: ButtonStyle(
          elevation: const WidgetStatePropertyAll(0),
          backgroundColor: disabled ? WidgetStatePropertyAll(quaternaryColor) : WidgetStatePropertyAll(jadeGreen),
          foregroundColor: const WidgetStatePropertyAll(fontWhite),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
        ),
        child: Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
