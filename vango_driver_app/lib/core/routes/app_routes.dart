import 'package:flutter/material.dart';
import 'package:vango_driver_app/features/pages/home_page.dart';
import 'package:vango_driver_app/features/pages/language_page.dart'; // Adjust based on your actual auth path

class AppRoutes {
  static const String language = '/';
  static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case language:
        return MaterialPageRoute(builder: (_) => const LanguagePage());
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
