import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vango_driver_app/core/routes/app_routes.dart'; // Ensure this import is correct

class VanGoBottomNav extends StatelessWidget {
  final int currentIndex;
  // We keep onTap optional now, so the widget handles navigation itself by default
  final Function(int)? onTap;

  const VanGoBottomNav({super.key, required this.currentIndex, this.onTap});

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
          _buildNavItem(context, 0, Icons.home_rounded, "Home", AppRoutes.home),
          _buildNavItem(
            context,
            1,
            Icons.assignment_rounded,
            "Trips",
            AppRoutes.activeTrip,
          ),
          _buildNavItem(
            context,
            2,
            Icons.chat_bubble_rounded,
            "Chat",
            null,
          ), // Update later
          _buildNavItem(
            context,
            3,
            Icons.account_balance_wallet_rounded,
            "Wallet",
            null,
          ), // Update later
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    int index,
    IconData icon,
    String label,
    String? routeName,
  ) {
    bool isSelected = currentIndex == index;
    Color activeColor = const Color(0xFF2E3559);
    Color inactiveColor = Colors.grey.shade400;

    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();

        // 1. If a custom onTap was provided, call it
        if (onTap != null) {
          onTap!(index);
        }

        // 2. Global Navigation Logic: Only navigate if we aren't already on that page
        if (!isSelected && routeName != null) {
          // pushReplacementNamed prevents the back-stack from getting too long
          Navigator.pushReplacementNamed(context, routeName);
        }
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
