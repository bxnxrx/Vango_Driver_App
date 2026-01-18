import 'package:flutter/material.dart';
import 'package:vango_driver_app/core/widgets/vango_bottom_nav.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // These will eventually be your different feature screens
  final List<Widget> _pages = [
    const Center(child: Text("Dashboard Placeholder")),
    const Center(child: Text("Trip Details Placeholder")),
    const Center(child: Text("Chat Placeholder")),
    const Center(child: Text("Wallet Placeholder")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: _pages[_selectedIndex],
      bottomNavigationBar: VanGoBottomNav(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}
