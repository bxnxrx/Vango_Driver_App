import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("VanGo Home"),
        backgroundColor: const Color(0xFF2E3559),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.home_work_outlined,
              size: 100,
              color: Color(0xFF2E3559),
            ),
            const SizedBox(height: 20),
            const Text(
              "Welcome to VanGo Driver Home",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text("This is a temporary page for testing."),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Back to Language Selection"),
            ),
          ],
        ),
      ),
    );
  }
}
