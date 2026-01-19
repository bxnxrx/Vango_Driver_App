import 'package:flutter/material.dart';
import 'package:vango_driver_app/features/pages/auth/signup_or_login.dart';
import 'package:vango_driver_app/features/pages/home/create_group_page.dart';
import 'package:vango_driver_app/features/pages/home/home_page.dart';
import 'package:vango_driver_app/features/pages/onbording/language_page.dart';
import 'package:vango_driver_app/features/pages/auth/create_account.dart';
<<<<<<< Updated upstream
<<<<<<< Updated upstream
import 'package:vango_driver_app/features/pages/auth/OTP_verification.dart'; // Adjust based on your actual auth path
=======
import 'package:vango_driver_app/features/pages/trips/trip_page.dart';
>>>>>>> Stashed changes
=======
import 'package:vango_driver_app/features/pages/trips/trip_page.dart';
>>>>>>> Stashed changes

class AppRoutes {
  static const String language = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String createaccount = '/create_account';
<<<<<<< Updated upstream
<<<<<<< Updated upstream
  static const String otpverification = '/otp_verification';
=======
  static const String createGroup = '/create-group';
  static const String activeTrip = '/active-trip';
>>>>>>> Stashed changes
=======
  static const String createGroup = '/create-group';
  static const String activeTrip = '/active-trip';
>>>>>>> Stashed changes

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case language:
        return MaterialPageRoute(builder: (_) => const LanguagePage());
      case login:
        return MaterialPageRoute(builder: (_) => const Login());
      case createaccount:
        return MaterialPageRoute(builder: (_) => const CreateAccount());
      case otpverification:
        return MaterialPageRoute(builder: (_) => const OTPVerification());
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case createGroup:
        return MaterialPageRoute(builder: (_) => const CreateGroupPage());
      case activeTrip:
        return MaterialPageRoute(builder: (_) => const ActiveTripPage());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
