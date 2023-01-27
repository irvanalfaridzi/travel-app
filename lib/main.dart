import 'package:flutter/material.dart';
import 'package:travel_app/utils/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      theme: ThemeData.light().copyWith(
        colorScheme: const ColorScheme.light().copyWith(
          primary: Colors.white
        )
      ),
      initialRoute: AppRoutes.detailPage,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
