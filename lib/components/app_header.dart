import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  final VoidCallback? onViewRecords;

  const AppHeader({super.key, this.onViewRecords});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        border: const Border(bottom: BorderSide(color: Colors.black, width: 2)),
      ),
      child: Row(
        children: [
          const Text(
            'TB DETECTION SYSTEM v2.0 - DIAGNOSTIC WORKSTATION',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const Spacer(),
          if (onViewRecords != null)
            ElevatedButton.icon(
              onPressed: onViewRecords,
              icon: const Icon(Icons.folder, size: 16),
              label: const Text('PATIENT RECORDS'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[500],
                foregroundColor: Colors.black,
                elevation: 0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                  side: BorderSide(color: Colors.black, width: 2),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
