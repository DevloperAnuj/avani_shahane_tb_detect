import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../components/primary_button.dart';
import '../components/secondary_button.dart';

class ImagingScreen extends StatelessWidget {
  final String? selectedFileName;
  final PlatformFile? selectedFile;
  final VoidCallback onPickFile;
  final VoidCallback onRunInference;
  final VoidCallback onPrevious;

  const ImagingScreen({
    super.key,
    required this.selectedFileName,
    required this.selectedFile,
    required this.onPickFile,
    required this.onRunInference,
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
            'RADIOGRAPHIC ACQUISITION',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: onPickFile,
            child: Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: selectedFileName == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.upload_file,
                            size: 64, color: Colors.grey[600]),
                        const SizedBox(height: 12),
                        const Text(
                          'DROP ZONE - CLICK TO SELECT X-RAY',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '(JPG, PNG, DICOM)',
                          style:
                              TextStyle(fontSize: 10, color: Colors.grey[700]),
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.check_circle,
                            size: 64, color: Colors.green),
                        const SizedBox(height: 12),
                        Text(
                          'FILE: $selectedFileName',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 11),
                        ),
                        Text(
                          'SIZE: ${(selectedFile!.size / 1024).toStringAsFixed(1)} KB',
                          style: const TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
            ),
          ),
          const SizedBox(height: 20),
          PrimaryButton(
            label: 'LOAD INTO INFERENCE ENGINE',
            onPressed: selectedFileName != null ? onRunInference : null,
          ),
          const SizedBox(height: 12),
          SecondaryButton(
            label: '<< BACK',
            onPressed: onPrevious,
          ),
        ],
      ),
    );
  }
}
