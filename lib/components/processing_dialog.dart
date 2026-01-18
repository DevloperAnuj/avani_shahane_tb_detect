import 'package:flutter/material.dart';
import 'dart:async';

class ProcessingDialog extends StatefulWidget {
  final List<String> logs;
  final int totalSeconds;

  const ProcessingDialog({
    super.key,
    required this.logs,
    required this.totalSeconds,
  });

  @override
  State<ProcessingDialog> createState() => _ProcessingDialogState();
}

class _ProcessingDialogState extends State<ProcessingDialog> {
  final List<String> _displayedLogs = [];
  Timer? _timer;
  int _step = 0;
  int _elapsedSeconds = 0;

  @override
  void initState() {
    super.initState();

    final intervalMs =
        (widget.totalSeconds * 1000 / widget.logs.length).floor();

    _timer = Timer.periodic(Duration(milliseconds: intervalMs), (timer) {
      if (_step < widget.logs.length) {
        setState(() {
          _displayedLogs.add(widget.logs[_step++]);
          _elapsedSeconds = ((timer.tick * intervalMs) / 1000).floor();
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final progress = _elapsedSeconds / widget.totalSeconds;

    return Dialog(
      backgroundColor: Colors.grey[300],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
        side: BorderSide(color: Colors.black, width: 2),
      ),
      child: Container(
        width: 500,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'PROCESSING...',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              height: 140,
              padding: const EdgeInsets.all(8.0),
              color: Colors.black,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _displayedLogs
                      .map((log) => Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Text(
                              '> $log',
                              style: const TextStyle(
                                color: Colors.greenAccent,
                                fontSize: 10,
                                fontFamily: 'Courier',
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
