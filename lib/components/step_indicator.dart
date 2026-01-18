import 'package:flutter/material.dart';

class StepIndicator extends StatelessWidget {
  final int currentStep;

  const StepIndicator({
    super.key,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    const steps = [
      'REGISTRATION',
      'PRIMARY',
      'SILENT',
      'RISK',
      'IMAGING',
      'RESULTS'
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        border: const Border(bottom: BorderSide(color: Colors.black, width: 1)),
      ),
      child: Row(
        children: List.generate(
          6,
          (i) => Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 2.0),
              padding: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: currentStep == i ? Colors.grey[400] : Colors.grey[300],
                border: Border.all(
                  color: Colors.black,
                  width: currentStep == i ? 2 : 1,
                ),
              ),
              child: Text(
                steps[i],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 9,
                  fontWeight:
                      currentStep == i ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
