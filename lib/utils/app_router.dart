import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/models/trips.dart';
import 'package:travel_app/ui/pages/pages.dart';

class AppRouter {
  static final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
      ),
      GoRoute(
        path: '/detail',
        builder: (BuildContext context, GoRouterState state) {
          return DetailPage(
            trip: Trips.fromJson(state.queryParams),
          );
        },
      ),
      GoRoute(
        path: '/checkout',
        builder: (BuildContext context, GoRouterState state) {
          return CheckoutPage(
            trip: Trips.fromJson(state.queryParams),
          );
        },
      ),
      GoRoute(
        path: '/show-snackbar',
        builder: (context, state) {
          return const SnackBar(
            content: Text('Order succeed'),
          );
        },
      ),
    ],
  );
}
