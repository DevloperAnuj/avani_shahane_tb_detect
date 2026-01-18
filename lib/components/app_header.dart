import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        border: const Border(bottom: BorderSide(color: Colors.black, width: 2)),
      ),
      child: const Text(
        'TB DETECTION SYSTEM v2.0 - DIAGNOSTIC WORKSTATION',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}
