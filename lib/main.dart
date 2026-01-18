import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const TBDetectionApp());
}

class TBDetectionApp extends StatelessWidget {
  const TBDetectionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Early TB Detection',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Courier',
        scaffoldBackgroundColor: Colors.grey[300],
        primaryColor: Colors.grey[400],
      ),
      home: const HomePage(),
    );
  }
}
