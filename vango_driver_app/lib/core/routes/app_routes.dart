import 'package:flutter/material.dart';
import 'package:vango_driver_app/features/onboarding/presentation/pages/language_page.dart';
import 'package:vango_driver_app/features/onboarding/presentation/pages/home_page.dart';

class AppRoutes {
  // Route Name Constants
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
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
