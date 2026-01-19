import 'package:flutter/material.dart';
import 'package:vango_driver_app/core/widgets/vango_bottom_nav.dart';
import 'package:vango_driver_app/features/pages/chat/chat_page.dart'; // Import the new page

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Now containing the actual ChatPage
  final List<Widget> _pages = [
    const Center(child: Text("Dashboard Placeholder")),
    const Center(child: Text("Trip Details Placeholder")),
    const ChatPage(), // Updated from placeholder to real page
    const Center(child: Text("Wallet Placeholder")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: IndexedStack(
        // Using IndexedStack preserves the scroll state of your chats
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: VanGoBottomNav(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}
