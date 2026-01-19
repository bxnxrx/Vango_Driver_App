import 'package:flutter/material.dart';

class CreateGroupPage extends StatelessWidget {
  const CreateGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create New Group"),
        backgroundColor: const Color(0xFF2E3559),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text("Design for adding new groups will go here."),
      ),
    );
  }
}
