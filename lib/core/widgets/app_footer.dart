import 'package:flutter/material.dart';
import 'package:setgaji/core/constants/app_colors.dart';

// reusable footer
class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text("Powered by Setlary MY", style: TextStyle(color: fontGrey, fontSize: 10)),
    );
  }
}
