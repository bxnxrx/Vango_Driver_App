import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Importing using routes file
import 'package:vango_driver_app/routes/app_routes.dart';

void main() {
  runApp(const VanGoApp());
}

class VanGoApp extends StatelessWidget {
  const VanGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VanGo Driver',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        // Applying Poppins globally to match your Figma design
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E3559),
          primary: const Color(0xFF2E3559),
        ),
        useMaterial3: true,
      ),
      // Directs the app to start at the Language Selection Screen
      initialRoute: AppRoutes.language,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
