import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:setgaji/core/constants/app_colors.dart';
import 'package:setgaji/core/widgets/app_button.dart';
import 'package:setgaji/routes/app_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SetGaji Assessment", style: TextStyle(color: fontWhite)),
        backgroundColor: primaryColor,
      ),

      body: buildContent(context),
    );
  }

  Widget buildContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AppButton(label: "Profile Screen", onPressed: () => context.push(AppRoute.profileRoute)),
          AppButton(label: "Marketplace Screen", onPressed: () => context.push(AppRoute.marketplaceRoute)),
          AppButton(label: "Claim Screen", onPressed: () => context.push(AppRoute.claimRoute)),
        ],
      ),
    );
  }
}
