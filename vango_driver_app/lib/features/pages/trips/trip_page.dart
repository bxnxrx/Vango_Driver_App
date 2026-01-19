import 'package:flutter/material.dart';
import 'package:vango_driver_app/core/widgets/vango_bottom_nav.dart';

class ActiveTripPage extends StatelessWidget {
  const ActiveTripPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      // We use a Stack so the bottom buttons stay on top of the scrollable list
      body: Stack(
        children: [
          // 1. Main Scrollable Content
          SingleChildScrollView(
            // IMPORTANT: The bottom padding (200) ensures the list can scroll
            // all the way up past the height of the buttons.
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 220),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60), // Account for Status Bar
                _buildTripHeaderInfo(),
                const SizedBox(height: 20),
                _buildPassengerSection("Picked Up (Inside Bus)", true),
                const SizedBox(height: 30),
                _buildPassengerSection("To Be Picked", false),
              ],
            ),
          ),

          // 2. Fixed Floating Action Panel
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildStickyActionArea(context),
          ),
        ],
      ),
      bottomNavigationBar: const VanGoBottomNav(currentIndex: 1),
    );
  }

  Widget _buildTripHeaderInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Morning School Run",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2E3559),
              ),
            ),
            Text(
              "In Progress",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFF2E3559),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            "00:45:12",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  // Use your existing Passenger Section code here, but ensure it doesn't have its own scroll
  Widget _buildPassengerSection(String title, bool isPicked) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 15),
        // Important: No internal ListView here, just a Column of items
        ...List.generate(3, (index) => _buildPassengerCard(isPicked)),
      ],
    );
  }

  Widget _buildPassengerCard(bool isPicked) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Color(0xFFE2EDFF),
            child: Icon(Icons.person, color: Color(0xFF2E3559)),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Sakith Mandira",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  isPicked ? "Picked at 07:12 AM" : "Dist: 1.2km • 07:25 AM",
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Icon(
            isPicked ? Icons.check_circle : Icons.access_time_filled,
            color: isPicked ? Colors.green : Colors.orange,
          ),
        ],
      ),
    );
  }

  Widget _buildStickyActionArea(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: _buildBtn("EMERGENCY", Colors.red, Icons.warning),
              ),
              const SizedBox(width: 10),
              Expanded(child: _buildBtn("PAUSE", Colors.orange, Icons.pause)),
            ],
          ),
          const SizedBox(height: 10),
          _buildBtn(
            "END TRIP",
            const Color(0xFF2E3559),
            Icons.stop,
            isFull: true,
          ),
        ],
      ),
    );
  }

  Widget _buildBtn(
    String text,
    Color col,
    IconData icon, {
    bool isFull = false,
  }) {
    return SizedBox(
      height: 55,
      width: isFull ? double.infinity : null,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(icon, color: Colors.white, size: 20),
        label: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: col,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
