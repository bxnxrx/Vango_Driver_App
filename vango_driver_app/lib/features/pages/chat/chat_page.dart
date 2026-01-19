import 'package:flutter/material.dart';
import 'chat_detail_page.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  bool isParentsSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Text(
                "Inbox",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            // Custom Toggle Switch
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    _buildToggleButton("Parents", isParentsSelected),
                    _buildToggleButton("Groups", !isParentsSelected),
                  ],
                ),
              ),
            ),
            // Chat List
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => _buildChatItem(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton(String title, bool active) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => isParentsSelected = title == "Parents"),
        child: Container(
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: active ? const Color(0xFF4A80F0) : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              color: active ? Colors.white : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChatItem(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ChatDetailPage()),
      ),
      leading: const CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'),
      ),
      title: const Text(
        "Zuhran",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: const Text("Hi, Muntasir! 👋 Can you help...", maxLines: 1),
      trailing: const Text(
        "11:35",
        style: TextStyle(color: Colors.grey, fontSize: 12),
      ),
    );
  }
}
