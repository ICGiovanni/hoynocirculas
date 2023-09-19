import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hoy_no_circulas/features/auth/presentation/screens/screens.dart';
import 'package:hoy_no_circulas/features/auth/presentation/providers/auth_provider.dart';
import 'package:hoy_no_circulas/features/main/presentation/screens/screens.dart';
import 'package:hoy_no_circulas/features/vehicule/presentation/screens/screens.dart';

import 'app_router_notifier.dart';

final goRouterProvider = Provider((ref) {
  //final goRouterNotifier = ref.read(goRouterNotifierProvider);

  return GoRouter(
    initialLocation: '/splash',
    // refreshListenable: goRouterNotifier,
    routes: [
      ///* Auth Routes
      GoRoute(
        path: '/splash',
        builder: (context, state) => const CheckAuthStatusScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/gps-access',
        builder: (context, state) => const GpsAccessScreen(),
      ),
      GoRoute(
        path: '/new-vehicle',
        builder: (context, state) => const NewVehicleScreen(),
      ),
    ],
    redirect: (context, state) {
      // final isGoingTo = state.location;
      // final authStatus = goRouterNotifier.authStatus;
      // final isAllGrantedStatus = goRouterNotifier.isAllGrantedStatus;
      // final isGpsEnabled = goRouterNotifier.isGpsEnabled;
      // final isGpsPermissionGranted = goRouterNotifier.isGpsPermissionGranted;

      // if (isGoingTo == '/splash' && authStatus == AuthStatus.checking) {
      //   return null;
      // }

      // if (authStatus == AuthStatus.notAuthenticate) {
      //   if (isGoingTo == '/login' || isGoingTo == '/register') {
      //     return null;
      //   }

      //   return '/login';
      // }

      // if (authStatus == AuthStatus.authenticated) {
      //   if (isGoingTo == '/login' ||
      //       isGoingTo == '/register' ||
      //       isGoingTo == '/splash') {
      //     if (isAllGrantedStatus) {
      //       return '/';
      //     } else if (!isGpsEnabled || !isGpsPermissionGranted) {
      //       return '/gps-access';
      //     }
      //   }
      // }

      // return null;
    },
  );
});
