import 'package:flutter/material.dart';
import '../components/custom_checkbox.dart';
import '../components/primary_button.dart';
import '../components/secondary_button.dart';

class SilentSymptomsScreen extends StatelessWidget {
  final bool fatigue;
  final bool anorexia;
  final bool dyspnea;
  final bool weightLoss;
  final ValueChanged<bool> onFatigueChanged;
  final ValueChanged<bool> onAnorexiaChanged;
  final ValueChanged<bool> onDyspneaChanged;
  final ValueChanged<bool> onWeightLossChanged;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  const SilentSymptomsScreen({
    super.key,
    required this.fatigue,
    required this.anorexia,
    required this.dyspnea,
    required this.weightLoss,
    required this.onFatigueChanged,
    required this.onAnorexiaChanged,
    required this.onDyspneaChanged,
    required this.onWeightLossChanged,
    required this.onNext,
    required this.onPrevious,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'SECONDARY/SILENT SYMPTOMS',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          CustomCheckbox(
            label: 'Extreme Fatigue / Lethargy',
            value: fatigue,
            onChanged: onFatigueChanged,
          ),
          CustomCheckbox(
            label: 'Anorexia (Loss of Appetite)',
            value: anorexia,
            onChanged: onAnorexiaChanged,
          ),
          CustomCheckbox(
            label: 'Dyspnea (Shortness of Breath)',
            value: dyspnea,
            onChanged: onDyspneaChanged,
          ),
          CustomCheckbox(
            label: 'Unexplained Weight Loss',
            value: weightLoss,
            onChanged: onWeightLossChanged,
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: SecondaryButton(
                  label: '<< BACK',
                  onPressed: onPrevious,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: PrimaryButton(
                  label: 'NEXT: EPIDEMIOLOGY >>',
                  onPressed: onNext,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
