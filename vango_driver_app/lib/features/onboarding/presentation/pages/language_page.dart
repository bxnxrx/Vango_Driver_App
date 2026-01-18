import 'package:flutter/material.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2E3559), // Matches your Figma background
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            // Globe Icon and Heading
            const Icon(Icons.language, size: 80, color: Colors.white),
            const SizedBox(height: 20),
            const Text(
              "Choose Language",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Spacer(),

            // White Container for Selection
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildLanguageButton("English"),
                  const SizedBox(height: 16),
                  _buildLanguageButton("සිංහල"),
                  const SizedBox(height: 16),
                  _buildLanguageButton("தமிழ்"),
                  const SizedBox(height: 40),

                  // Next Button
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to next screen
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF383F66),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "Next",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageButton(String title) {
    bool isSelected = selectedLanguage == title;
    return GestureDetector(
      onTap: () => setState(() => selectedLanguage = title),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF383F66) : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: const Color(0xFF383F66), width: 1.5),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : const Color(0xFF383F66),
          ),
        ),
      ),
    );
  }
}
