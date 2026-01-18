import 'package:flutter/material.dart';
import '../components/custom_checkbox.dart';
import '../components/primary_button.dart';
import '../components/secondary_button.dart';

class PrimarySymptomsScreen extends StatelessWidget {
  final bool coughOver2Weeks;
  final bool hemoptysis;
  final bool fever;
  final bool nightSweats;
  final bool chestPain;
  final ValueChanged<bool> onCoughChanged;
  final ValueChanged<bool> onHemoptysisChanged;
  final ValueChanged<bool> onFeverChanged;
  final ValueChanged<bool> onNightSweatsChanged;
  final ValueChanged<bool> onChestPainChanged;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  const PrimarySymptomsScreen({
    super.key,
    required this.coughOver2Weeks,
    required this.hemoptysis,
    required this.fever,
    required this.nightSweats,
    required this.chestPain,
    required this.onCoughChanged,
    required this.onHemoptysisChanged,
    required this.onFeverChanged,
    required this.onNightSweatsChanged,
    required this.onChestPainChanged,
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
            'PRIMARY SYMPTOM MATRIX',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          CustomCheckbox(
            label: 'Cough (> 2 Weeks)',
            value: coughOver2Weeks,
            onChanged: onCoughChanged,
          ),
          CustomCheckbox(
            label: 'Hemoptysis (Blood in Sputum)',
            value: hemoptysis,
            onChanged: onHemoptysisChanged,
            isHighPriority: true,
          ),
          CustomCheckbox(
            label: 'Fever (Low grade / Evening rise)',
            value: fever,
            onChanged: onFeverChanged,
          ),
          CustomCheckbox(
            label: 'Night Sweats',
            value: nightSweats,
            onChanged: onNightSweatsChanged,
          ),
          CustomCheckbox(
            label: 'Chest Pain',
            value: chestPain,
            onChanged: onChestPainChanged,
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
                  label: 'NEXT: SILENT INDICATORS >>',
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
