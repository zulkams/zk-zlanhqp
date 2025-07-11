import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:setgaji/core/constants/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.disabled = false,
    this.color = jadeGreen,
    this.radius = 12,
    this.fontSize = 16,
    this.fontWeight = FontWeight.bold,
    this.height = 56,
  });
  final String label;
  final VoidCallback onPressed;
  final bool disabled;
  final Color color;
  final double radius;
  final double fontSize;
  final FontWeight fontWeight;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: disabled
            ? null
            : () {
                HapticFeedback.lightImpact();
                onPressed();
              },
        style: ButtonStyle(
          elevation: const WidgetStatePropertyAll(0),
          backgroundColor: disabled ? WidgetStatePropertyAll(quaternaryColor) : WidgetStatePropertyAll(color),
          foregroundColor: const WidgetStatePropertyAll(fontWhite),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius))),
        ),
        child: Text(
          label,
          style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
        ),
      ),
    );
  }
}
