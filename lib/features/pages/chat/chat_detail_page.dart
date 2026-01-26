import 'package:flutter/material.dart';

class ChatDetailPage extends StatelessWidget {
  const ChatDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            const CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Zuhran",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                Text(
                  "Active Now",
                  style: TextStyle(color: Colors.green, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                _buildMessageBubble(
                  "Hi, parent ! can i have my this month fee?.",
                  true,
                ),
                _buildMessageBubble(
                  "Absolutely, I'd love to pay via vango app!",
                  false,
                ),
              ],
            ),
          ),
          _buildInputBar(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(String text, bool isSender) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: isSender ? const Color(0xFF4A80F0) : const Color(0xFFF1F4F7),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(15),
            topRight: const Radius.circular(15),
            bottomLeft: Radius.circular(isSender ? 15 : 0),
            bottomRight: Radius.circular(isSender ? 0 : 15),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: isSender ? Colors.white : Colors.black87),
        ),
      ),
    );
  }

  Widget _buildInputBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 30),
      color: Colors.white,
      child: Row(
        children: [
          const Icon(Icons.attach_file, color: Colors.grey),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Type you message",
                fillColor: const Color(0xFFF1F4F7),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          const CircleAvatar(
            backgroundColor: Color(0xFF1CB19B),
            child: Icon(Icons.send, color: Colors.white, size: 20),
          ),
        ],
      ),
    );
  }
}
