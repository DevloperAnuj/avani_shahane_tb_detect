import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../components/symptom_status_row.dart';
import '../components/info_row.dart';
import '../components/primary_button.dart';
import '../components/secondary_button.dart';

class ResultsScreen extends StatelessWidget {
  final String patientId;
  final String patientName;
  final int patientAge;
  final String patientGender;
  final bool coughOver2Weeks;
  final bool hemoptysis;
  final bool fever;
  final bool nightSweats;
  final bool chestPain;
  final bool fatigue;
  final bool anorexia;
  final bool dyspnea;
  final bool weightLoss;
  final bool previousTB;
  final bool tbContact;
  final bool hivStatus;
  final bool diabetic;
  final bool smoker;
  final String? selectedFileName;
  final PlatformFile? selectedFile;
  final double probability;
  final int fusionGain;
  final bool isPositive;
  final VoidCallback onPrintReport;
  final VoidCallback onNewPatient;
  final VoidCallback onSavePatient;

  const ResultsScreen({
    super.key,
    required this.patientId,
    required this.patientName,
    required this.patientAge,
    required this.patientGender,
    required this.coughOver2Weeks,
    required this.hemoptysis,
    required this.fever,
    required this.nightSweats,
    required this.chestPain,
    required this.fatigue,
    required this.anorexia,
    required this.dyspnea,
    required this.weightLoss,
    required this.previousTB,
    required this.tbContact,
    required this.hivStatus,
    required this.diabetic,
    required this.smoker,
    required this.selectedFileName,
    required this.selectedFile,
    required this.probability,
    required this.fusionGain,
    required this.isPositive,
    required this.onPrintReport,
    required this.onNewPatient,
    required this.onSavePatient,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'DIAGNOSTIC CONSOLE - RESULT',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          _buildPatientInfoSection(),
          const SizedBox(height: 12),
          _buildPrimarySymptomsSection(),
          const SizedBox(height: 12),
          _buildSilentSymptomsSection(),
          const SizedBox(height: 12),
          _buildRiskFactorsSection(),
          const SizedBox(height: 12),
          _buildImagingSection(),
          const SizedBox(height: 12),
          _buildDiagnosticResultSection(),
          const SizedBox(height: 20),
          PrimaryButton(
            label: 'SAVE PATIENT RECORD',
            onPressed: onSavePatient,
          ),
          const SizedBox(height: 12),
          SecondaryButton(
            label: 'PRINT REPORT',
            onPressed: onPrintReport,
          ),
          const SizedBox(height: 12),
          PrimaryButton(
            label: 'NEW PATIENT',
            onPressed: onNewPatient,
          ),
        ],
      ),
    );
  }

  Widget _buildPatientInfoSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'PATIENT INFORMATION',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(height: 8),
          InfoRow(label: 'PATIENT ID:', value: patientId),
          InfoRow(label: 'NAME:', value: patientName),
          InfoRow(label: 'AGE:', value: patientAge.toString()),
          InfoRow(label: 'GENDER:', value: patientGender),
        ],
      ),
    );
  }

  Widget _buildPrimarySymptomsSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'PRIMARY SYMPTOMS',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(height: 8),
          SymptomStatusRow(label: 'Cough (> 2 Weeks)', value: coughOver2Weeks),
          SymptomStatusRow(
            label: 'Hemoptysis (Blood in Sputum)',
            value: hemoptysis,
            isHighWeight: true,
          ),
          SymptomStatusRow(
            label: 'Fever (Low grade / Evening rise)',
            value: fever,
          ),
          SymptomStatusRow(label: 'Night Sweats', value: nightSweats),
          SymptomStatusRow(label: 'Chest Pain', value: chestPain),
        ],
      ),
    );
  }

  Widget _buildSilentSymptomsSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'SECONDARY/SILENT SYMPTOMS',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(height: 8),
          SymptomStatusRow(
            label: 'Extreme Fatigue / Lethargy',
            value: fatigue,
          ),
          SymptomStatusRow(
            label: 'Anorexia (Loss of Appetite)',
            value: anorexia,
          ),
          SymptomStatusRow(
            label: 'Dyspnea (Shortness of Breath)',
            value: dyspnea,
          ),
          SymptomStatusRow(
            label: 'Unexplained Weight Loss',
            value: weightLoss,
          ),
        ],
      ),
    );
  }

  Widget _buildRiskFactorsSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'RISK FACTORS & HISTORY',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(height: 8),
          SymptomStatusRow(label: 'History of Previous TB', value: previousTB),
          SymptomStatusRow(
            label: 'Known Contact with Active TB',
            value: tbContact,
          ),
          SymptomStatusRow(
            label: 'HIV / Immunocompromised Status',
            value: hivStatus,
          ),
          SymptomStatusRow(label: 'Diabetic', value: diabetic),
          SymptomStatusRow(label: 'Smoker', value: smoker),
        ],
      ),
    );
  }

  Widget _buildImagingSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'RADIOGRAPHIC DATA',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(height: 8),
          InfoRow(label: 'X-RAY FILE:', value: selectedFileName ?? 'N/A'),
          if (selectedFile != null)
            InfoRow(
              label: 'FILE SIZE:',
              value: '${(selectedFile!.size / 1024).toStringAsFixed(1)} KB',
            ),
        ],
      ),
    );
  }

  Widget _buildDiagnosticResultSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'DIAGNOSTIC RESULT',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Text(
                'STATUS:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 16),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                decoration: BoxDecoration(
                  color: isPositive ? Colors.red : Colors.green,
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Text(
                  isPositive ? 'POSITIVE' : 'NEGATIVE',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          InfoRow(
            label: 'PROBABILITY:',
            value: '${probability.toStringAsFixed(1)}%',
          ),
          InfoRow(
            label: 'FUSION GAIN:',
            value: 'Risk Factors increased confidence by +$fusionGain%',
          ),
          const SizedBox(height: 12),
          const Text(
            'INFERENCE LOG:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
          ),
          const SizedBox(height: 6),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8.0),
            color: Colors.black,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '> Loading MobileNetV2 Quantized Model...',
                  style: TextStyle(color: Colors.greenAccent, fontSize: 9),
                ),
                Text(
                  '> Normalizing Clinical Vector (1x14)...',
                  style: TextStyle(color: Colors.greenAccent, fontSize: 9),
                ),
                Text(
                  '> Fusing: [VisualTensor] + [RiskVector]...',
                  style: TextStyle(color: Colors.greenAccent, fontSize: 9),
                ),
                Text(
                  '> Inference Time: 142ms',
                  style: TextStyle(color: Colors.greenAccent, fontSize: 9),
                ),
                Text(
                  '> COMPLETE',
                  style: TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
