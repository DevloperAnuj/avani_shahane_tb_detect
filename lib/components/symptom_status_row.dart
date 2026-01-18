import 'package:flutter/material.dart';

class SymptomStatusRow extends StatelessWidget {
  final String label;
  final bool value;
  final bool isHighWeight;

  const SymptomStatusRow({
    super.key,
    required this.label,
    required this.value,
    this.isHighWeight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            child: Text(
              value ? '✓' : '✗',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: value ? Colors.green[800] : Colors.red[800],
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: isHighWeight ? Colors.red : Colors.black,
                fontWeight: isHighWeight ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
