import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VanGoBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const VanGoBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          35,
        ), // Slightly sharper professional curve
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2E3559).withOpacity(0.15),
            blurRadius: 25,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(0, Icons.home_rounded, "Home"),
            _buildNavItem(1, Icons.assignment_rounded, "Trips"),
            _buildNavItem(2, Icons.chat_bubble_rounded, "Chat"),
            _buildNavItem(3, Icons.account_balance_wallet_rounded, "Wallet"),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    bool isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact(); // Stronger feedback for a "premium" feel
        onTap(index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          // Active icon gets a subtle background glow
          color: isSelected
              ? const Color(0xFF2E3559).withOpacity(0.1)
              : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          // Larger icons for better accessibility
          size: isSelected ? 32 : 28,
          color: isSelected ? const Color(0xFF2E3559) : Colors.grey.shade400,
        ),
      ),
    );
  }
}
