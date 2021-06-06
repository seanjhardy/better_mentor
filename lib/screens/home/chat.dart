import 'package:flutter/material.dart';

class ChatMenu extends StatelessWidget {
  final Color color;

  ChatMenu(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}