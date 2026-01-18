# Early TB Detection System

A comprehensive clinical decision support system for tuberculosis detection, developed for Windows Desktop. This application implements a multi-modal diagnostic approach combining clinical symptom assessment, epidemiological risk profiling, and radiographic analysis.

## Project Information

**Principal Investigator:** Avani Shahane, Ph.D. Scholar  
**Platform:** Windows Desktop  
**Technology Stack:** Flutter Framework, PyTorch,NumPy,OpenCV,Pydicom,Node.js,Express.js,Socket.io

## Overview

The Early TB Detection System provides healthcare professionals with a structured workflow for comprehensive tuberculosis screening and diagnostic assessment. The system integrates multiple data sources to generate evidence-based diagnostic recommendations.

## System Architecture

### 6-Stage Diagnostic Workflow

1. **Patient Registration**
   - Unique patient identifier generation
   - Demographic data collection
   - Form validation and data integrity checks

2. **Primary Symptom Assessment**
   - Classic TB symptom matrix evaluation
   - Weighted symptom scoring system
   - High-priority indicators (Hemoptysis)
   - Comprehensive clinical presentation capture

3. **Constitutional Symptom Evaluation**
   - Silent and secondary symptom assessment
   - Systemic manifestation tracking
   - Early detection indicators
   - Comprehensive health status evaluation

4. **Epidemiological Risk Profiling**
   - TB exposure history assessment
   - Comorbidity evaluation
   - Risk factor stratification
   - Pre-test probability calculation

5. **Radiographic Data Acquisition**
   - Chest X-ray image upload
   - File validation and preview
   - Imaging metadata capture
   - Quality assurance checks

6. **Diagnostic Analysis & Reporting**
   - Multi-modal data fusion
   - Probability-based risk assessment
   - Comprehensive diagnostic report generation
   - Clinical decision support output

## Clinical Features

### Symptom Assessment Matrix

**Primary Symptoms** (5 indicators):
- Persistent cough (> 2 weeks duration)
- Hemoptysis (blood in sputum) - High-weight indicator
- Fever with evening rise pattern
- Night sweats
- Chest pain

**Constitutional Symptoms** (4 indicators):
- Extreme fatigue and lethargy
- Anorexia (loss of appetite)
- Dyspnea (shortness of breath)
- Unexplained weight loss

**Risk Factors** (5 categories):
- Previous TB history (relapse risk)
- Known TB contact exposure
- HIV/Immunocompromised status
- Diabetes mellitus
- Smoking history

## Diagnostic Algorithm

### Multi-Modal Fusion Approach

The system employs a weighted scoring algorithm that integrates:

**Symptom Scoring:**
- Hemoptysis: 6 points (highest clinical significance)
- Persistent cough: 3 points
- Weight loss: 3 points
- Fever, night sweats, anorexia, dyspnea: 2 points each
- Fatigue, chest pain: 1 point each

**Risk Factor Weighting:**
- TB contact: 5 points
- Previous TB, HIV status: 4 points each
- Diabetes: 2 points
- Smoking: 1 point

**Fusion Calculation:**
```
Base Probability = Imaging Analysis Output (60-80%)
Symptom Contribution = Symptom Score × 1.2%
Risk Contribution = Risk Score × 1.5%
Fusion Gain = Risk Score × 3%

Final Probability = Base + Symptom Contribution + Risk Contribution
Detection Threshold = Probability > 75% OR Symptom Score ≥ 8
```

## Technical Specifications

### System Requirements

**Operating System:** Windows 10/11  
**Framework:** Flutter SDK 3.0.0+  
**Development Tools:** Visual Studio 2019 or later  
**Runtime:** Windows Desktop environment  

## Report Generation

The system generates comprehensive diagnostic reports including:

- Complete patient demographics
- Full symptom assessment matrix
- Risk factor profile
- Radiographic data summary
- Diagnostic probability score
- Fusion gain metrics
- Processing audit trail
- Print-ready formatted output

## Data Management

### Patient Data Structure

```
Patient Record:
├── Demographics (ID, Name, Age, Gender)
├── Primary Symptoms (5 boolean indicators)
├── Constitutional Symptoms (4 boolean indicators)
├── Risk Factors (5 boolean indicators)
├── Radiographic Data (filename, size, metadata)
└── Diagnostic Output (status, probability, fusion gain)
```

### Processing Pipeline

1. Data collection across 5 input screens
2. Real-time validation and quality checks
3. Multi-modal data integration
4. Probabilistic risk calculation
5. Report generation and output

## Clinical Workflow Integration

The system is designed to integrate into existing clinical workflows:

- **Screening Phase:** Rapid symptom and risk assessment
- **Diagnostic Phase:** Comprehensive data collection
- **Analysis Phase:** Automated probability calculation
- **Reporting Phase:** Structured output generation
- **Documentation:** Print-ready diagnostic reports

## Quality Assurance

- Input validation at each workflow stage
- Data integrity verification
- Processing audit trail
- Structured error handling
- User confirmation dialogs

## Future Enhancements

Planned system improvements:

- Integration with DICOM imaging standards
- Database persistence layer
- Multi-user authentication system
- Network-based deployment
- Advanced ML model integration
- Longitudinal patient tracking
- Batch processing capabilities
- Export to electronic health records

## Project Structure

```
early_detection_tb/
├── lib/
│   └── main.dart              # Application core
├── windows/                   # Windows platform files
├── pubspec.yaml               # Project configuration
└── README.md                  # Documentation
```

## Development Guidelines

### Code Organization
- Single-file architecture for maintainability
- Clear separation of concerns
- Comprehensive inline documentation
- Consistent naming conventions

### State Management
- Centralized state in main widget
- Reactive UI updates
- Efficient rebuild optimization

### UI/UX Principles
- Wizard-based workflow navigation
- Progressive disclosure of complexity
- Clear visual feedback
- Contextual help and guidance

## References

This system implements clinical decision support based on:

- WHO Guidelines for TB Screening and Diagnosis
- CDC Tuberculosis Screening Protocols
- Evidence-based symptom weighting methodologies
- Multi-modal diagnostic fusion techniques

## License & Usage

This software is developed for research and clinical evaluation purposes.

**Principal Investigator:** Avani Shahane, Ph.D. Scholar  
**Institution:**   
**Project:** Early TB Detection Research  

For questions regarding usage, deployment, or collaboration:
- Contact: +91 9999999999
- Project Repository: [If applicable]

---

**Version:** 2.0  
**Last Updated:** January 2026  
**Project Started:** October 2025
**Platform:** Windows Desktop  
**Status:** Active Development
