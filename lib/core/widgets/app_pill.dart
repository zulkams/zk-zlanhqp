import 'package:flutter/material.dart';
import 'package:setgaji/core/constants/app_colors.dart';

/// reusable pill jade container
class AppPill extends StatelessWidget {
  const AppPill({super.key, required this.child, this.horizontalPadding = 12, this.verticalPadding = 5});
  final Widget child;
  final double horizontalPadding;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
      decoration: BoxDecoration(color: jadeGreen, borderRadius: BorderRadius.circular(24)),
      child: child,
    );
  }
}
