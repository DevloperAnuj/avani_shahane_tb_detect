import 'package:flutter/material.dart';
import '../components/custom_checkbox.dart';
import '../components/primary_button.dart';
import '../components/secondary_button.dart';

class RiskFactorsScreen extends StatelessWidget {
  final bool previousTB;
  final bool tbContact;
  final bool hivStatus;
  final bool diabetic;
  final bool smoker;
  final ValueChanged<bool> onPreviousTBChanged;
  final ValueChanged<bool> onTBContactChanged;
  final ValueChanged<bool> onHIVStatusChanged;
  final ValueChanged<bool> onDiabeticChanged;
  final ValueChanged<bool> onSmokerChanged;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  const RiskFactorsScreen({
    super.key,
    required this.previousTB,
    required this.tbContact,
    required this.hivStatus,
    required this.diabetic,
    required this.smoker,
    required this.onPreviousTBChanged,
    required this.onTBContactChanged,
    required this.onHIVStatusChanged,
    required this.onDiabeticChanged,
    required this.onSmokerChanged,
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
            'RISK FACTORS & HISTORY',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          CustomCheckbox(
            label: 'History of Previous TB (Relapse Risk)',
            value: previousTB,
            onChanged: onPreviousTBChanged,
          ),
          CustomCheckbox(
            label: 'Known Contact with Active TB Patient',
            value: tbContact,
            onChanged: onTBContactChanged,
          ),
          CustomCheckbox(
            label: 'HIV / Immunocompromised Status',
            value: hivStatus,
            onChanged: onHIVStatusChanged,
          ),
          CustomCheckbox(
            label: 'Diabetic',
            value: diabetic,
            onChanged: onDiabeticChanged,
          ),
          CustomCheckbox(
            label: 'Smoker',
            value: smoker,
            onChanged: onSmokerChanged,
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
                  label: 'NEXT: IMAGING >>',
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
