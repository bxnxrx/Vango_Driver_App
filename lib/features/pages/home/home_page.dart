import 'package:flutter/material.dart';
import 'package:vango_driver_app/core/widgets/vango_bottom_nav.dart';
import 'package:vango_driver_app/features/pages/chat/chat_page.dart';
import 'package:vango_driver_app/features/pages/trips/trip_page.dart';
import 'package:vango_driver_app/features/pages/wallet/wallet_page.dart'; // Added Wallet import
import 'package:vango_driver_app/core/routes/app_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // These pages are now managed within one single Scaffold (Master Shell)
  late final List<Widget> _pages = [
    _buildDashboardBody(),
    const ActiveTripPage(),
    const ChatPage(),
    const WalletPage(), // Replaced placeholder with your real WalletPage
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      // body switches views while keeping the bottomNavigationBar persistent
      body: IndexedStack(index: _selectedIndex, children: _pages),
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

  // --- Dashboard Logic ---
  Widget _buildDashboardBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader(context),
          _buildMapPreview(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                _buildNextTripCard(),
                const SizedBox(height: 20),
                _buildQuickActions(),
                const SizedBox(height: 20),
                _buildEarningsSnapshot(),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ... (Keep your _buildHeader, _buildMapPreview, etc. from your existing file)
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
                  "Hello john!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
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
          IconButton(
            icon: const Icon(
              Icons.add_circle_outline,
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
      height: 220,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://static-maps.yandex.ru/1.x/?lang=en_US&ll=79.9700,6.9000&z=13&l=sat&size=600,400',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildNextTripCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Next Trip",
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const Text(
            "Morning School Run",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const Divider(height: 30),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () => setState(
                () => _selectedIndex = 1,
              ), // This stays in the shell!
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0066A1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Text(
                "Start Trip",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // (Include _buildQuickActions and _buildEarningsSnapshot as they were)
  Widget _buildQuickActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildActionItem("Attendance", Icons.fact_check_outlined),
        _buildActionItem("Route", Icons.map_outlined),
        _buildActionItem("Safety", Icons.security_outlined),
        _buildActionItem("Support", Icons.help_outline),
      ],
    );
  }

  Widget _buildActionItem(String label, IconData icon) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black12),
          ),
          child: Icon(icon, color: const Color(0xFF2E3559)),
        ),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildEarningsSnapshot() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFE2EDFF),
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Today's Earnings",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            "Rs. 4,500.00",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF0066A1),
            ),
          ),
        ],
      ),
    );
  }
}
