import 'package:go_router/go_router.dart';
import 'package:setgaji/features/claim/screens/claim_screen.dart';
import 'package:setgaji/features/home/screens/home_screen.dart';
import 'package:setgaji/features/profile/screens/profile_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', name: 'home', builder: (context, state) => const HomeScreen()),
    GoRoute(path: '/profile', name: 'profile', builder: (context, state) => const ProfileScreen()),
    // GoRoute(path: '/marketplace', name: 'marketplace', builder: (context, state) => const MarketplaceScreen()),
    GoRoute(path: '/claim', name: 'claim', builder: (context, state) => const ClaimScreen()),
  ],
);

// enum
enum AppRoutes { home, profile, marketplace, claim }

extension AppRoute on AppRoutes {
  static const homeRoute = "/";
  static const profileRoute = "/profile";
  static const marketplaceRoute = "/marketplace";
  static const claimRoute = "/claim";
}
