import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VanGoBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap; // This is now required to drive the shell

  const VanGoBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2E3559).withOpacity(0.12),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(0, Icons.home_rounded, "Home"),
          _buildNavItem(1, Icons.assignment_rounded, "Trips"),
          _buildNavItem(2, Icons.chat_bubble_rounded, "Chat"),
          _buildNavItem(3, Icons.account_balance_wallet_rounded, "Wallet"),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    bool isSelected = currentIndex == index;
    Color activeColor = const Color(0xFF2E3559);
    Color inactiveColor = Colors.grey.shade400;

    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        onTap(index); // Simply notify the HomePage to switch the view
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: isSelected ? 34 : 30,
            color: isSelected ? activeColor : inactiveColor,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color: isSelected ? activeColor : inactiveColor,
            ),
          ),
        ],
      ),
    );
  }
}
