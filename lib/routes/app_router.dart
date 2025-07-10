import 'package:go_router/go_router.dart';
import 'package:setgaji/features/profile/screens/profile_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/profile',
  routes: [
    // GoRoute(path: '/home', name: 'home', builder: (context, state) => const HomeScreen()),
    GoRoute(path: '/profile', name: 'profile', builder: (context, state) => const ProfileScreen()),
    // GoRoute(path: '/marketplace', name: 'marketplace', builder: (context, state) => const MarketplaceScreen()),
    // GoRoute(path: '/claim', name: 'claim', builder: (context, state) => const ClaimScreen()),
  ],
);
