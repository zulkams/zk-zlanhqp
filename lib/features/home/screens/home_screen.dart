import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:setgaji/core/constants/app_colors.dart';
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
        children: [
          ElevatedButton(onPressed: () => context.push(AppRoute.profileRoute), child: Text("Profile Screen")),
          ElevatedButton(onPressed: () => context.push(AppRoute.marketplaceRoute), child: Text("Marketplace Screen")),
          ElevatedButton(onPressed: () => context.push(AppRoute.claimRoute), child: Text("Claim Screen")),
        ],
      ),
    );
  }
}
