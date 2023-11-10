import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isUser;
  const ChatBubble({super.key, required this.message, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isUser ? Colors.blue : Colors.blue.shade200,
      ),
      child: Text(
        message,
        style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }
}
