import 'package:flutter/material.dart';
import 'package:travel_app/pages/pages.dart';

abstract class AppRoutes {
  static const String detailPage = "detail_page";
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget screen;
    switch (settings.name) {
      default:
        screen = const DetailPage();
        break;
    }
    return MaterialPageRoute(builder: (_) => screen);
  }
}
