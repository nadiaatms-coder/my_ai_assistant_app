import 'package:flutter/material.dart';
import '../models/message_model.dart';

class ChatBubble extends StatelessWidget {
  final Message message;

  ChatBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(14),
        margin: EdgeInsets.symmetric(vertical: 4),
        constraints: BoxConstraints(maxWidth: 400),
        decoration: BoxDecoration(
          color: message.isUser ? Color(0xFF1976D2) : Color(0xFFE1BEE7),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft:
                message.isUser ? Radius.circular(12) : Radius.circular(0),
            bottomRight:
                message.isUser ? Radius.circular(0) : Radius.circular(12),
          ),
        ),
        child: Text(
          message.text,
          style: TextStyle(
            color: message.isUser ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}