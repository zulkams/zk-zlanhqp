import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:setgaji/core/constants/app_theme.dart';
import 'package:setgaji/routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: appTheme,
      routerConfig: appRouter,
      title: 'SetGaji',
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return child!;
      },
    );
  }
}
