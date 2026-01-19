import 'package:flutter/material.dart';
import 'package:vango_driver_app/core/widgets/vango_bottom_nav.dart';
import 'package:vango_driver_app/features/pages/chat/chat_page.dart';
// 1. ADD THIS IMPORT
import 'package:vango_driver_app/features/pages/wallet/wallet_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Center(child: Text("Dashboard Placeholder")),
    const Center(child: Text("Trip Details Placeholder")),
    const ChatPage(),
    // 2. ADD THE WALLET PAGE HERE
    const WalletPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: VanGoBottomNav(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}
