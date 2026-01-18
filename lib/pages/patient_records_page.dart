import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../services/database_helper.dart';
import '../components/primary_button.dart';
import '../components/secondary_button.dart';

class PatientRecordsPage extends StatefulWidget {
  const PatientRecordsPage({super.key});

  @override
  State<PatientRecordsPage> createState() => _PatientRecordsPageState();
}

class _PatientRecordsPageState extends State<PatientRecordsPage> {
  List<PatientRecord> _patients = [];
  List<PatientRecord> _filteredPatients = [];
  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPatients();
  }

  Future<void> _loadPatients() async {
    setState(() => _isLoading = true);
    final patients = await DatabaseHelper.instance.getAllPatients();
    setState(() {
      _patients = patients;
      _filteredPatients = patients;
      _isLoading = false;
    });
  }

  void _searchPatients(String query) {
    if (query.isEmpty) {
      setState(() => _filteredPatients = _patients);
    } else {
      setState(() {
        _filteredPatients = _patients
            .where((patient) =>
                patient.patientId.toLowerCase().contains(query.toLowerCase()) ||
                patient.patientName.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  void _viewPatientDetails(PatientRecord patient) {
    showDialog(
      context: context,
      builder: (context) => _PatientDetailsDialog(patient: patient),
    );
  }

  Future<void> _deletePatient(PatientRecord patient) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[300],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(color: Colors.black, width: 2),
        ),
        title: const Text('CONFIRM DELETE'),
        content: Text('Delete record for ${patient.patientName}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('CANCEL'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('DELETE'),
          ),
        ],
      ),
    );

    if (confirm == true && patient.id != null) {
      await DatabaseHelper.instance.deletePatient(patient.id!);
      _loadPatients();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          _buildHeader(),
          _buildSearchBar(),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _filteredPatients.isEmpty
                    ? _buildEmptyState()
                    : _buildPatientList(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        border: const Border(bottom: BorderSide(color: Colors.black, width: 2)),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(width: 8),
          const Text(
            'PATIENT RECORDS DATABASE',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const Spacer(),
          Text(
            'TOTAL: ${_filteredPatients.length}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        border: const Border(bottom: BorderSide(color: Colors.black, width: 1)),
      ),
      child: Row(
        children: [
          const Text(
            'SEARCH:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: _searchPatients,
                decoration: const InputDecoration(
                  hintText: 'Enter Patient ID or Name...',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(8.0),
                  isDense: true,
                ),
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ),
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: () {
              _searchController.clear();
              _searchPatients('');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[400],
              foregroundColor: Colors.black,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide(color: Colors.black, width: 2),
              ),
            ),
            child: const Text('CLEAR'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.folder_open, size: 64, color: Colors.grey[600]),
          const SizedBox(height: 16),
          Text(
            _searchController.text.isEmpty
                ? 'NO PATIENT RECORDS FOUND'
                : 'NO MATCHING RECORDS',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPatientList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: _filteredPatients.length,
      itemBuilder: (context, index) {
        final patient = _filteredPatients[index];
        return _buildPatientCard(patient);
      },
    );
  }

  Widget _buildPatientCard(PatientRecord patient) {
    final dateTime = DateTime.parse(patient.dateTime);
    final formattedDate = DateFormat('dd/MM/yyyy HH:mm').format(dateTime);

    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: patient.isPositive ? Colors.red[100] : Colors.green[100],
              border: const Border(bottom: BorderSide(color: Colors.black)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 4.0,
                  ),
                  decoration: BoxDecoration(
                    color: patient.isPositive ? Colors.red : Colors.green,
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Text(
                    patient.isPositive ? 'POSITIVE' : 'NEGATIVE',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  '${patient.probability.toStringAsFixed(1)}%',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ID: ${patient.patientId}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'NAME: ${patient.patientName}',
                            style: const TextStyle(fontSize: 11),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'AGE: ${patient.patientAge} | GENDER: ${patient.patientGender}',
                            style: const TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          formattedDate,
                          style: const TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _viewPatientDetails(patient),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[500],
                          foregroundColor: Colors.black,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                            side: BorderSide(color: Colors.black, width: 2),
                          ),
                        ),
                        child: const Text('VIEW DETAILS'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () => _deletePatient(patient),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[300],
                        foregroundColor: Colors.black,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                          side: BorderSide(color: Colors.black, width: 2),
                        ),
                      ),
                      child: const Text('DELETE'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PatientDetailsDialog extends StatelessWidget {
  final PatientRecord patient;

  const _PatientDetailsDialog({required this.patient});

  @override
  Widget build(BuildContext context) {
    final dateTime = DateTime.parse(patient.dateTime);
    final formattedDate = DateFormat('dd/MM/yyyy HH:mm:ss').format(dateTime);

    return Dialog(
      backgroundColor: Colors.grey[300],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
        side: BorderSide(color: Colors.black, width: 2),
      ),
      child: Container(
        width: 600,
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'PATIENT RECORD DETAILS',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildSection('PATIENT INFORMATION', [
                'ID: ${patient.patientId}',
                'Name: ${patient.patientName}',
                'Age: ${patient.patientAge}',
                'Gender: ${patient.patientGender}',
                'Date/Time: $formattedDate',
              ]),
              const SizedBox(height: 12),
              _buildSection('PRIMARY SYMPTOMS', [
                _symptomText('Cough (> 2 Weeks)', patient.coughOver2Weeks),
                _symptomText('Hemoptysis', patient.hemoptysis),
                _symptomText('Fever', patient.fever),
                _symptomText('Night Sweats', patient.nightSweats),
                _symptomText('Chest Pain', patient.chestPain),
              ]),
              const SizedBox(height: 12),
              _buildSection('SILENT SYMPTOMS', [
                _symptomText('Fatigue', patient.fatigue),
                _symptomText('Anorexia', patient.anorexia),
                _symptomText('Dyspnea', patient.dyspnea),
                _symptomText('Weight Loss', patient.weightLoss),
              ]),
              const SizedBox(height: 12),
              _buildSection('RISK FACTORS', [
                _symptomText('Previous TB', patient.previousTB),
                _symptomText('TB Contact', patient.tbContact),
                _symptomText('HIV Status', patient.hivStatus),
                _symptomText('Diabetic', patient.diabetic),
                _symptomText('Smoker', patient.smoker),
              ]),
              const SizedBox(height: 12),
              _buildSection('DIAGNOSTIC RESULT', [
                'Status: ${patient.isPositive ? "POSITIVE" : "NEGATIVE"}',
                'Probability: ${patient.probability.toStringAsFixed(1)}%',
                'Fusion Gain: +${patient.fusionGain}%',
                if (patient.xrayFileName != null)
                  'X-Ray: ${patient.xrayFileName}',
              ]),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[400],
                    foregroundColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                      side: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                  child: const Text('CLOSE'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<String> items) {
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
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(height: 8),
          ...items.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(item, style: const TextStyle(fontSize: 11)),
              )),
        ],
      ),
    );
  }

  String _symptomText(String label, bool value) {
    return '${value ? "✓" : "✗"} $label';
  }
}
