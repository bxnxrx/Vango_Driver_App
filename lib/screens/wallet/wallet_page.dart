import 'package:flutter/material.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

// Your list of options
const List<String> list = <String>[
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];

class _WalletPageState extends State<WalletPage> {
  // 1. Create a variable to hold the current selection
  String dropdownValue = list.first;

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

            // Balance Card (Middle Box)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFF4A80F0),
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
                    // 2. Row containing "Total Balance" and the new Dropdown
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total Balance",
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                        // THE DROPDOWN WIDGET
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(
                              0.2,
                            ), // Light background
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                              ),
                              dropdownColor: const Color(
                                0xFF4A80F0,
                              ), // Dropdown menu background
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              onChanged: (String? value) {
                                // Update the state when user selects a new item
                                setState(() {
                                  dropdownValue = value!;
                                });
                              },
                              items: list.map<DropdownMenuItem<String>>((
                                String value,
                              ) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
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

            // Transaction List
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) => _buildTransactionItem(index),
              ),
            ),
          ],
        ),
      ),
    );
  }

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

  Widget _buildTransactionItem(int index) {
    bool isCredit = index % 2 == 0;
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.grey[100],
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
