import 'package:flutter/material.dart';
import 'package:setgaji/core/constants/app_colors.dart';

// reusable footer
class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Powered by Setlary MY", style: TextStyle(color: fontGrey, fontSize: 10));
  }
}
