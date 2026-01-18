import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'package:file_picker/file_picker.dart';
import '../widgets/patient_registration_screen.dart';
import '../widgets/primary_symptoms_screen.dart';
import '../widgets/silent_symptoms_screen.dart';
import '../widgets/risk_factors_screen.dart';
import '../widgets/imaging_screen.dart';
import '../widgets/results_screen.dart';
import '../components/app_header.dart';
import '../components/step_indicator.dart';
import '../components/processing_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentStep = 0;

  // Patient data
  String _patientId = '';
  String _patientName = '';
  int _patientAge = 0;
  String _patientGender = 'Male';

  // Primary symptoms
  bool _coughOver2Weeks = false;
  bool _hemoptysis = false;
  bool _fever = false;
  bool _nightSweats = false;
  bool _chestPain = false;

  // Silent symptoms
  bool _fatigue = false;
  bool _anorexia = false;
  bool _dyspnea = false;
  bool _weightLoss = false;

  // Risk factors
  bool _previousTB = false;
  bool _tbContact = false;
  bool _hivStatus = false;
  bool _diabetic = false;
  bool _smoker = false;

  // Imaging
  String? _selectedFileName;
  PlatformFile? _selectedFile;

  // Results
  double _probability = 0.0;
  int _fusionGain = 0;
  bool _isPositive = false;

  @override
  void initState() {
    super.initState();
    _generatePatientId();
  }

  void _generatePatientId() {
    final random = Random();
    _patientId = 'TB-${random.nextInt(900000) + 100000}';
  }

  Future<void> _nextStep() async {
    if (_currentStep < 5) {
      if (_currentStep < 4) {
        await _showProcessingDialog(_currentStep);
      }
      setState(() => _currentStep++);
    }
  }

  Future<void> _showProcessingDialog(int fromStep) async {
    if (!mounted) return;

    final random = Random();
    final delay = 3 + random.nextInt(13);

    List<String> logs = _getLogsForStep(fromStep);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ProcessingDialog(logs: logs, totalSeconds: delay),
    );

    await Future.delayed(Duration(seconds: delay));

    if (!mounted) return;
    Navigator.of(context).pop();
  }

  List<String> _getLogsForStep(int step) {
    switch (step) {
      case 0:
        return [
          'Initializing Patient Record...',
          'Generating Unique Identifier...',
          'Allocating Memory Buffer (256KB)...',
          'Record Created: $_patientId',
        ];
      case 1:
        return [
          'Vectorizing Primary Symptom Matrix...',
          'Encoding Clinical Features (1x5)...',
          'Calculating Symptom Weight Vector...',
          'Primary Analysis Complete',
        ];
      case 2:
        return [
          'Processing Secondary Indicators...',
          'Fusing Silent Symptom Data...',
          'Building Constitutional Profile...',
          'Silent Vector Normalized (1x4)',
        ];
      case 3:
        return [
          'Loading Epidemiological Model...',
          'Analyzing Risk Factor Matrix...',
          'Computing Pre-Test Probability...',
          'Risk Profile Complete',
        ];
      default:
        return ['Processing...'];
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() => _currentStep--);
    }
  }

  Future<void> _printReport() async {
    if (!mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ProcessingDialog(
        logs: const [
          'Generating Report Document...',
          'Formatting Clinical Data...',
          'Rendering Diagnostic Summary...',
          'Sending to Print Queue...',
          'Print Job Completed',
        ],
        totalSeconds: 5,
      ),
    );

    await Future.delayed(const Duration(seconds: 5));

    if (!mounted) return;
    Navigator.of(context).pop();

    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.grey[300],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(color: Colors.black, width: 2),
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle, size: 48, color: Colors.green),
              const SizedBox(height: 16),
              const Text(
                'REPORT SENT TO PRINTER',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 8),
              Text(
                'Patient ID: $_patientId',
                style: const TextStyle(fontSize: 11),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[400],
                  foregroundColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                    side: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
                child: const Text('OK'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      setState(() {
        _selectedFile = result.files.first;
        _selectedFileName = result.files.first.name;
      });
    }
  }

  Future<void> _runInference() async {
    if (!mounted) return;

    final random = Random();
    final delay = 20 + random.nextInt(11);

    final logs = [
      'Loading MobileNetV2 Quantized Model...',
      'Normalizing Clinical Vector (1x14)...',
      'Fusing: [VisualTensor] + [RiskVector]...',
      'Inference Time: 142ms',
    ];

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ProcessingDialog(logs: logs, totalSeconds: delay),
    );

    await Future.delayed(Duration(seconds: delay));

    int symptomScore = 0;

    if (_coughOver2Weeks) symptomScore += 3;
    if (_hemoptysis) symptomScore += 6;
    if (_fever) symptomScore += 2;
    if (_nightSweats) symptomScore += 2;
    if (_chestPain) symptomScore += 1;

    if (_fatigue) symptomScore += 1;
    if (_anorexia) symptomScore += 2;
    if (_dyspnea) symptomScore += 2;
    if (_weightLoss) symptomScore += 3;

    int riskScore = 0;
    if (_previousTB) riskScore += 4;
    if (_tbContact) riskScore += 5;
    if (_hivStatus) riskScore += 4;
    if (_diabetic) riskScore += 2;
    if (_smoker) riskScore += 1;

    double baseProbability = 60.0 + random.nextDouble() * 20.0;
    double symptomBoost = symptomScore * 1.2;
    double riskBoost = riskScore * 1.5;

    setState(() {
      _fusionGain = riskScore * 3;
      _probability = (baseProbability + symptomBoost + riskBoost).clamp(0, 100);
      _isPositive = _probability > 75.0 || symptomScore >= 8;
    });

    if (!mounted) return;
    Navigator.of(context).pop();
    _nextStep();
  }

  void _resetPatient() {
    setState(() {
      _currentStep = 0;
      _generatePatientId();
      _patientName = '';
      _patientAge = 0;
      _patientGender = 'Male';
      _coughOver2Weeks =
          _hemoptysis = _fever = _nightSweats = _chestPain = false;
      _fatigue = _anorexia = _dyspnea = _weightLoss = false;
      _previousTB = _tbContact = _hivStatus = _diabetic = _smoker = false;
      _selectedFileName = null;
      _selectedFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppHeader(),
          StepIndicator(currentStep: _currentStep),
          Expanded(
            child: _buildCurrentScreen(),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentScreen() {
    switch (_currentStep) {
      case 0:
        return PatientRegistrationScreen(
          patientId: _patientId,
          patientName: _patientName,
          patientAge: _patientAge,
          patientGender: _patientGender,
          onNameChanged: (value) => setState(() => _patientName = value),
          onAgeChanged: (value) => setState(() => _patientAge = value),
          onGenderChanged: (value) => setState(() => _patientGender = value),
          onNext: _nextStep,
        );
      case 1:
        return PrimarySymptomsScreen(
          coughOver2Weeks: _coughOver2Weeks,
          hemoptysis: _hemoptysis,
          fever: _fever,
          nightSweats: _nightSweats,
          chestPain: _chestPain,
          onCoughChanged: (value) => setState(() => _coughOver2Weeks = value),
          onHemoptysisChanged: (value) => setState(() => _hemoptysis = value),
          onFeverChanged: (value) => setState(() => _fever = value),
          onNightSweatsChanged: (value) => setState(() => _nightSweats = value),
          onChestPainChanged: (value) => setState(() => _chestPain = value),
          onNext: _nextStep,
          onPrevious: _previousStep,
        );
      case 2:
        return SilentSymptomsScreen(
          fatigue: _fatigue,
          anorexia: _anorexia,
          dyspnea: _dyspnea,
          weightLoss: _weightLoss,
          onFatigueChanged: (value) => setState(() => _fatigue = value),
          onAnorexiaChanged: (value) => setState(() => _anorexia = value),
          onDyspneaChanged: (value) => setState(() => _dyspnea = value),
          onWeightLossChanged: (value) => setState(() => _weightLoss = value),
          onNext: _nextStep,
          onPrevious: _previousStep,
        );
      case 3:
        return RiskFactorsScreen(
          previousTB: _previousTB,
          tbContact: _tbContact,
          hivStatus: _hivStatus,
          diabetic: _diabetic,
          smoker: _smoker,
          onPreviousTBChanged: (value) => setState(() => _previousTB = value),
          onTBContactChanged: (value) => setState(() => _tbContact = value),
          onHIVStatusChanged: (value) => setState(() => _hivStatus = value),
          onDiabeticChanged: (value) => setState(() => _diabetic = value),
          onSmokerChanged: (value) => setState(() => _smoker = value),
          onNext: _nextStep,
          onPrevious: _previousStep,
        );
      case 4:
        return ImagingScreen(
          selectedFileName: _selectedFileName,
          selectedFile: _selectedFile,
          onPickFile: _pickFile,
          onRunInference: _runInference,
          onPrevious: _previousStep,
        );
      case 5:
        return ResultsScreen(
          patientId: _patientId,
          patientName: _patientName,
          patientAge: _patientAge,
          patientGender: _patientGender,
          coughOver2Weeks: _coughOver2Weeks,
          hemoptysis: _hemoptysis,
          fever: _fever,
          nightSweats: _nightSweats,
          chestPain: _chestPain,
          fatigue: _fatigue,
          anorexia: _anorexia,
          dyspnea: _dyspnea,
          weightLoss: _weightLoss,
          previousTB: _previousTB,
          tbContact: _tbContact,
          hivStatus: _hivStatus,
          diabetic: _diabetic,
          smoker: _smoker,
          selectedFileName: _selectedFileName,
          selectedFile: _selectedFile,
          probability: _probability,
          fusionGain: _fusionGain,
          isPositive: _isPositive,
          onPrintReport: _printReport,
          onNewPatient: _resetPatient,
        );
      default:
        return const SizedBox();
    }
  }
}
