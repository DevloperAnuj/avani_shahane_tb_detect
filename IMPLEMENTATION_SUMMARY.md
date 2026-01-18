# Early TB Detection System - Technical Documentation

## Project Overview

**Principal Investigator:** Avani Shahane, Ph.D. Scholar  
**System Name:** Early TB Detection System  
**Version:** 2.0  
**Platform:** Windows Desktop Application  
**Framework:** Flutter  

---

## System Architecture

### Application Design

The Early TB Detection System implements a structured 6-stage diagnostic workflow designed for clinical environments. The application provides healthcare professionals with a comprehensive tool for tuberculosis screening and diagnostic assessment.

### Core Components

1. **Patient Registration Module**
2. **Clinical Symptom Assessment Engine**
3. **Risk Profiling System**
4. **Radiographic Data Handler**
5. **Diagnostic Analysis Engine**
6. **Report Generation System**

---

## Workflow Stages

### Stage 1: Patient Registration

**Purpose:** Capture essential patient demographics and generate unique identifiers

**Data Collected:**
- Patient ID (auto-generated, format: TB-######)
- Full name
- Age (integer validation)
- Gender (categorical selection)

**Validation:** All fields required before progression

---

### Stage 2: Primary Symptom Matrix

**Purpose:** Assess classic tuberculosis clinical presentation

**Indicators Evaluated:**
- Cough (> 2 weeks duration)
- Hemoptysis (blood in sputum) - Marked as high-weight indicator
- Fever (low grade / evening rise pattern)
- Night sweats
- Chest pain

**Clinical Significance:** Primary symptoms form the foundation of TB diagnosis

---

### Stage 3: Constitutional Symptom Assessment

**Purpose:** Evaluate systemic and silent manifestations

**Indicators Evaluated:**
- Extreme fatigue / lethargy
- Anorexia (loss of appetite)
- Dyspnea (shortness of breath)
- Unexplained weight loss

**Clinical Significance:** Often overlooked indicators that improve diagnostic sensitivity

---

### Stage 4: Epidemiological Risk Profiling

**Purpose:** Assess patient risk factors and exposure history

**Risk Factors Evaluated:**
- History of previous TB (relapse risk assessment)
- Known contact with active TB patient
- HIV / immunocompromised status
- Diabetes mellitus
- Smoking history

**Clinical Significance:** Risk factors significantly influence pre-test probability

---

### Stage 5: Radiographic Data Acquisition

**Purpose:** Capture chest X-ray imaging data

**Features:**
- File upload interface (JPG, PNG, BMP support)
- File validation and preview
- Metadata capture (filename, file size)
- Quality assurance checks

**Processing Time:** 20-30 seconds (simulated imaging analysis)

---

### Stage 6: Diagnostic Analysis & Reporting

**Purpose:** Generate comprehensive diagnostic assessment

**Output Components:**
- Patient demographic summary
- Complete symptom matrix (14 indicators)
- Risk factor profile
- Radiographic data summary
- Diagnostic probability score
- Fusion gain metrics
- Processing audit trail

---

## Diagnostic Algorithm

### Weighted Scoring System

**Primary Symptoms:**
- Hemoptysis: 6 points (highest weight)
- Persistent cough: 3 points
- Fever: 2 points
- Night sweats: 2 points
- Chest pain: 1 point

**Constitutional Symptoms:**
- Weight loss: 3 points
- Anorexia: 2 points
- Dyspnea: 2 points
- Fatigue: 1 point

**Risk Factors:**
- TB contact: 5 points
- Previous TB: 4 points
- HIV status: 4 points
- Diabetes: 2 points
- Smoking: 1 point

### Fusion Algorithm

```
Base Probability = 60-80% (imaging analysis baseline)
Symptom Boost = symptomScore × 1.2%
Risk Boost = riskScore × 1.5%
Fusion Gain = riskScore × 3%

Final Probability = Base + Symptom Boost + Risk Boost
Detection Threshold = Probability > 75% OR symptomScore ≥ 8
```

### Clinical Decision Logic

**POSITIVE Detection:**
- Final probability exceeds 75%, OR
- Symptom score ≥ 8 points

**NEGATIVE Detection:**
- Final probability ≤ 75%, AND
- Symptom score < 8 points

---

## User Interface Design

### Design Philosophy

The application employs a legacy enterprise interface design optimized for:
- High information density
- Clear visual hierarchy
- Minimal cognitive load
- Efficient data entry
- Professional clinical appearance

### Visual Specifications

**Color Palette:**
- Background: Grey (#E0E0E0, #EEEEEE)
- Borders: Black (#000000)
- Positive Status: Red (#F44336)
- Negative Status: Green (#4CAF50)
- Console Text: Green Accent (#69F0AE)

**Typography:**
- Font Family: Courier (monospaced)
- Headers: Bold, 12-16pt
- Body Text: Regular, 11-12pt
- Console: 9-10pt

**Layout:**
- Sharp corners (no border radius)
- 1-2px black borders
- Compact spacing (12px sections)
- Structured form layouts

---

## Processing System

### Context-Aware Processing

Each workflow transition includes processing feedback:

**Registration Processing:**
- "Initializing Patient Record..."
- "Generating Unique Identifier..."
- "Allocating Memory Buffer..."
- Duration: 3-15 seconds (variable)

**Symptom Processing:**
- "Vectorizing Primary Symptom Matrix..."
- "Encoding Clinical Features..."
- Duration: 3-15 seconds (variable)

**Risk Processing:**
- "Loading Epidemiological Model..."
- "Analyzing Risk Factor Matrix..."
- Duration: 3-15 seconds (variable)

**Imaging Processing:**
- "Loading MobileNetV2 Quantized Model..."
- "Normalizing Clinical Vector (1x14)..."
- "Fusing: [VisualTensor] + [RiskVector]..."
- Duration: 20-30 seconds (extended for imaging)

---

## Report Generation

### Report Structure

**Section 1: Patient Information**
- Patient ID, Name, Age, Gender

**Section 2: Primary Symptoms**
- 5 indicators with ✓/✗ status
- Hemoptysis highlighted in red

**Section 3: Constitutional Symptoms**
- 4 indicators with ✓/✗ status

**Section 4: Risk Factors**
- 5 factors with ✓/✗ status

**Section 5: Radiographic Data**
- Filename and file size

**Section 6: Diagnostic Result**
- Status badge (POSITIVE/NEGATIVE)
- Probability percentage
- Fusion gain metric
- Processing audit log

### Print Functionality

**Features:**
- Simulated print queue processing
- 5-second generation time
- Success confirmation dialog
- Patient ID verification

---

## Technical Implementation

### State Management
- Centralized state in main widget
- Simple setState approach
- Efficient rebuild optimization

### Data Flow
```
User Input → Validation → State Update → Processing → Analysis → Report
```

### File Structure
```
lib/main.dart: ~1100 lines
- Application core
- UI components
- Business logic
- Processing dialogs
```

---

## Quality Assurance

### Validation Mechanisms
- Required field validation
- Data type verification
- File format validation
- State consistency checks

### Error Handling
- Graceful error recovery
- User-friendly error messages
- Processing timeout handling
- File upload error management

---

## Performance Characteristics

**Application Startup:** < 2 seconds  
**Screen Transitions:** 3-15 seconds (with processing)  
**Imaging Analysis:** 20-30 seconds  
**Report Generation:** 5 seconds  
**Memory Footprint:** Minimal (Flutter optimized)  

---

## Development Information

**Language:** Dart  
**Framework:** Flutter 3.0+  
**Target Platform:** Windows Desktop  
**Architecture:** Single-file application  
**State Management:** setState  
**UI Pattern:** Wizard workflow  

---

## Clinical Validation

The diagnostic algorithm is based on:
- WHO TB Guidelines
- CDC Screening Protocols
- Evidence-based symptom weighting
- Multi-modal fusion techniques

---

## Future Development

### Planned Enhancements
- DICOM imaging integration
- Database persistence
- Multi-user authentication
- Network deployment
- Advanced ML models
- Longitudinal tracking
- EHR integration

---

## Project Credits

**Principal Investigator:** Avani Shahane, Ph.D. Scholar  
**Project Type:** Doctoral Research  
**Focus Area:** Early Tuberculosis Detection  
**Technology:** Clinical Decision Support Systems  

---

**Document Version:** 2.0  
**Last Updated:** January 2026  
**Status:** Active Development
