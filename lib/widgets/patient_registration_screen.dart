import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/primary_button.dart';

class PatientRegistrationScreen extends StatelessWidget {
  final String patientId;
  final String patientName;
  final int patientAge;
  final String patientGender;
  final ValueChanged<String> onNameChanged;
  final ValueChanged<int> onAgeChanged;
  final ValueChanged<String> onGenderChanged;
  final VoidCallback onNext;

  const PatientRegistrationScreen({
    super.key,
    required this.patientId,
    required this.patientName,
    required this.patientAge,
    required this.patientGender,
    required this.onNameChanged,
    required this.onAgeChanged,
    required this.onGenderChanged,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final bool isValid = patientName.isNotEmpty && patientAge > 0;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'PATIENT REGISTRATION',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          _buildField(
            'PATIENT ID:',
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                border: Border.all(color: Colors.black),
              ),
              child: Text(
                patientId,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          _buildField(
            'NAME:',
            _buildTextField(
              value: patientName,
              onChanged: onNameChanged,
            ),
          ),
          _buildField(
            'AGE:',
            _buildTextField(
              value: patientAge == 0 ? '' : patientAge.toString(),
              onChanged: (v) => onAgeChanged(int.tryParse(v) ?? 0),
              keyboardType: TextInputType.number,
            ),
          ),
          _buildField(
            'GENDER:',
            _buildDropdown(),
          ),
          const SizedBox(height: 20),
          PrimaryButton(
            label: 'INITIALIZE RECORD',
            onPressed: isValid ? onNext : null,
          ),
        ],
      ),
    );
  }

  Widget _buildField(String label, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
        const SizedBox(height: 4),
        child,
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildTextField({
    required String value,
    required ValueChanged<String> onChanged,
    TextInputType? keyboardType,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
      ),
      child: TextField(
        controller: TextEditingController(text: value)
          ..selection = TextSelection.fromPosition(
            TextPosition(offset: value.length),
          ),
        onChanged: onChanged,
        keyboardType: keyboardType,
        inputFormatters: keyboardType == TextInputType.number
            ? [FilteringTextInputFormatter.digitsOnly]
            : null,
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(8.0),
          isDense: true,
        ),
        style: const TextStyle(fontSize: 12),
      ),
    );
  }

  Widget _buildDropdown() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: patientGender,
          isExpanded: true,
          items: ['Male', 'Female', 'Other']
              .map((g) => DropdownMenuItem(value: g, child: Text(g)))
              .toList(),
          onChanged: (value) {
            if (value != null) onGenderChanged(value);
          },
          style: const TextStyle(fontSize: 12, color: Colors.black),
        ),
      ),
    );
  }
}
