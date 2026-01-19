import 'package:flutter/material.dart';
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
import 'package:vango_driver_app/core/widgets/vango_bottom_nav.dart';
import 'package:vango_driver_app/features/pages/chat/chat_page.dart';
// 1. ADD THIS IMPORT
import 'package:vango_driver_app/features/pages/wallet/wallet_page.dart';
=======
import 'package:vango_driver_app/core/routes/app_routes.dart';
import 'package:vango_driver_app/core/widgets/vango_bottom_nav.dart'; // Ensure path is correct
import 'package:vango_driver_app/features/pages/chat/chat_page.dart';
>>>>>>> Stashed changes
=======
import 'package:vango_driver_app/core/routes/app_routes.dart';
import 'package:vango_driver_app/core/widgets/vango_bottom_nav.dart'; // Ensure path is correct
import 'package:vango_driver_app/features/pages/chat/chat_page.dart';
>>>>>>> Stashed changes
=======
import 'package:vango_driver_app/core/routes/app_routes.dart';
import 'package:vango_driver_app/core/widgets/vango_bottom_nav.dart'; // Ensure path is correct
import 'package:vango_driver_app/features/pages/chat/chat_page.dart';
>>>>>>> Stashed changes
=======
import 'package:vango_driver_app/core/routes/app_routes.dart';
import 'package:vango_driver_app/core/widgets/vango_bottom_nav.dart'; // Ensure path is correct
import 'package:vango_driver_app/features/pages/chat/chat_page.dart';
>>>>>>> Stashed changes

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
  final List<Widget> _pages = [
    const Center(child: Text("Dashboard Placeholder")),
    const Center(child: Text("Trip Details Placeholder")),
    const ChatPage(),
    // 2. ADD THE WALLET PAGE HERE
    const WalletPage(),
  ];

=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
  @override
  Widget build(BuildContext context) {
    // List of pages to display based on index
    final List<Widget> pages = [
      _buildDashboardBody(context), // Index 0
      const Center(child: Text("Trips Page")), // Index 1
      const ChatPage(), // Index 2
      const Center(child: Text("Wallet Page")), // Index 3
    ];

    return Scaffold(
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
      backgroundColor: const Color(0xFFF5F5F5),
      body: IndexedStack(index: _selectedIndex, children: _pages),
=======
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
      backgroundColor: const Color(0xFFF8FAFC),
      // body handles showing the correct content
      body: pages[_selectedIndex],

      // Integrating your custom global footer menu
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
      bottomNavigationBar: VanGoBottomNav(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  // Your modern Driver Dashboard UI logic
  Widget _buildDashboardBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader(context),
          _buildMapPreview(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                _buildTripSummaryCard(),
                const SizedBox(height: 20),
                _buildNextTripCard(),
                const SizedBox(height: 20),
                _buildQuickActions(),
                const SizedBox(height: 20),
                _buildEarningsSnapshot(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- Dashboard UI Components ---

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
      color: const Color(0xFF2E3559),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'),
          ),
          const SizedBox(width: 15),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello, John!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Ready for Trip",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          // New Add Group Icon
          IconButton(
            icon: const Icon(
              Icons.add_circle_outline_rounded,
              color: Colors.white,
              size: 28,
            ),
            onPressed: () =>
                Navigator.pushNamed(context, AppRoutes.createGroup),
          ),
          const Icon(
            Icons.notifications_none_rounded,
            color: Colors.white,
            size: 28,
          ),
        ],
      ),
    );
  }

  Widget _buildMapPreview() {
    return Container(
      height: 220, // Increased height for better visibility
      width: double.infinity,
      decoration: BoxDecoration(
        // We use a network image for temporary use
        image: const DecorationImage(
          image: NetworkImage(
            'https://static-maps.yandex.ru/1.x/?lang=en_US&ll=79.9700,6.9000&z=14&l=sat&size=600,400',
          ),
          fit: BoxFit.cover,
        ),
        // Adding a subtle shadow at the bottom of the map
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Optional Overlay: A blue dot representing the vehicle position
          Center(
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const CircleAvatar(
                radius: 6,
                backgroundColor: Colors.blueAccent,
              ),
            ),
          ),
          // "Live" Status Indicator
          Positioned(
            top: 15,
            left: 15,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  Icon(Icons.gps_fixed, size: 14, color: Colors.blue),
                  SizedBox(width: 5),
                  Text(
                    "GPS Active",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTripSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildSummaryItem("Passengers", "12"),
          _buildSummaryItem("Stops", "08"),
          _buildSummaryItem("Absentees", "02"),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  Widget _buildNextTripCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF2E3559),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Morning School Run",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4A80F0),
              ),
              child: const Text(
                "START TRIP",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildActionBtn("Attendance", Icons.fact_check_outlined),
        _buildActionBtn("Route", Icons.map_outlined),
        _buildActionBtn("Safety", Icons.security_outlined),
        _buildActionBtn("Support", Icons.help_outline_rounded),
      ],
    );
  }

  Widget _buildActionBtn(String label, IconData icon) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(icon, color: const Color(0xFF2E3559)),
        ),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildEarningsSnapshot() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFE2EDFF),
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Today's Earnings",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          Text("Rs. 4,500.00", style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
