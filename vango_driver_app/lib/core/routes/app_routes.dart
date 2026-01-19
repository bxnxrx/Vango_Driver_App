import 'package:flutter/material.dart';
import 'package:vango_driver_app/features/pages/auth/Signup_or_login.dart';
import 'package:vango_driver_app/features/pages/home/home_page.dart';
import 'package:vango_driver_app/features/pages/onbording/language_page.dart'; // Adjust based on your actual auth path

class AppRoutes {
  static const String language = '/';
  static const String home = '/home';
  static const String login = '/login';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case language:
        return MaterialPageRoute(builder: (_) => const LanguagePage());
      case login:
        return MaterialPageRoute(builder: (_) => const Login());
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
