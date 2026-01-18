// TB Detection System Widget Tests

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:early_detection_tb/main.dart';

void main() {
  testWidgets('TB Detection App loads successfully',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const TBDetectionApp());

    // Verify that the app header is displayed
    expect(find.text('TB DETECTION SYSTEM v2.0 - DIAGNOSTIC WORKSTATION'),
        findsOneWidget);

    // Verify that the first step (REGISTRATION) is displayed
    expect(find.text('PATIENT REGISTRATION'), findsOneWidget);

    // Verify that the patient ID field is present
    expect(find.text('PATIENT ID:'), findsOneWidget);
  });

  testWidgets('Step indicator shows all 6 steps', (WidgetTester tester) async {
    await tester.pumpWidget(const TBDetectionApp());

    // Verify all 6 workflow steps are present
    expect(find.text('REGISTRATION'), findsOneWidget);
    expect(find.text('PRIMARY'), findsOneWidget);
    expect(find.text('SILENT'), findsOneWidget);
    expect(find.text('RISK'), findsOneWidget);
    expect(find.text('IMAGING'), findsOneWidget);
    expect(find.text('RESULTS'), findsOneWidget);
  });

  testWidgets('Patient registration form has all required fields',
      (WidgetTester tester) async {
    await tester.pumpWidget(const TBDetectionApp());

    // Verify all registration fields are present
    expect(find.text('PATIENT ID:'), findsOneWidget);
    expect(find.text('NAME:'), findsOneWidget);
    expect(find.text('AGE:'), findsOneWidget);
    expect(find.text('GENDER:'), findsOneWidget);

    // Verify the initialize button is present
    expect(find.text('INITIALIZE RECORD'), findsOneWidget);
  });
}
