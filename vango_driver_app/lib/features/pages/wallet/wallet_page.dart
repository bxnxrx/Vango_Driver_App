import 'package:flutter/material.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Text(
                "Wallet",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),

            // Balance Card (Themed like the active toggle button)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(
                    0xFF4A80F0,
                  ), // Same blue as your 'Parents' toggle
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF4A80F0).withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Total Balance",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "\$1,250.00",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        _buildActionButton(Icons.add, "Top Up"),
                        const SizedBox(width: 15),
                        _buildActionButton(Icons.arrow_upward, "Withdraw"),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Section Title
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Text(
                "Transactions",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            // Transaction List (Themed like your Chat List)
            Expanded(
              child: ListView.builder(
                itemCount: 6, // Dummy count
                itemBuilder: (context, index) => _buildTransactionItem(index),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for the buttons inside the blue card
  Widget _buildActionButton(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 18),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for list items (Themed like your _buildChatItem)
  Widget _buildTransactionItem(int index) {
    bool isCredit = index % 2 == 0; // Alternating for dummy data

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.grey[100], // Matches your toggle background
        child: Icon(
          isCredit ? Icons.arrow_downward : Icons.arrow_upward,
          color: isCredit ? const Color(0xFF4A80F0) : Colors.black87,
        ),
      ),
      title: Text(
        isCredit ? "Top Up Wallet" : "Ride Payment",
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        isCredit ? "Today, 10:23 AM" : "Yesterday, 4:50 PM",
        maxLines: 1,
        style: const TextStyle(color: Colors.grey),
      ),
      trailing: Text(
        isCredit ? "+\$50.00" : "-\$15.50",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: isCredit ? Colors.green : Colors.black87,
        ),
      ),
    );
  }
}
