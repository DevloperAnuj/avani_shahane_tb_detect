# User Interface Guide

## Early TB Detection System - Interface Documentation

**Principal Investigator:** Avani Shahane, Ph.D. Scholar  
**Version:** 2.0

---

## Application Layout

### Main Window Structure

```
┌─────────────────────────────────────────────────────────────────┐
│  TB DETECTION SYSTEM v2.0 - DIAGNOSTIC WORKSTATION              │
├─────────────────────────────────────────────────────────────────┤
│ [REGISTRATION] [PRIMARY] [SILENT] [RISK] [IMAGING] [RESULTS]   │
└─────────────────────────────────────────────────────────────────┘
```

**Components:**
- Application header with version information
- Progress indicator showing current workflow stage
- Main content area for data entry and display

---

## Workflow Screens

### Screen 1: Patient Registration

```
┌───────────────────────────────────┐
│ PATIENT REGISTRATION              │
├───────────────────────────────────┤
│ PATIENT ID: TB-123456             │
│                                   │
│ NAME:                             │
│ ┌───────────────────────────────┐ │
│ │ [Enter patient name]          │ │
│ └───────────────────────────────┘ │
│                                   │
│ AGE:                              │
│ ┌───────────────────────────────┐ │
│ │ [Enter age]                   │ │
│ └───────────────────────────────┘ │
│                                   │
│ GENDER:                           │
│ ┌───────────────────────────────┐ │
│ │ Male ▼                        │ │
│ └───────────────────────────────┘ │
│                                   │
│ ┌───────────────────────────────┐ │
│ │   INITIALIZE RECORD           │ │
│ └───────────────────────────────┘ │
└───────────────────────────────────┘
```

**Fields:**
- Patient ID (auto-generated)
- Name (text input, required)
- Age (numeric input, required)
- Gender (dropdown selection, required)

**Action:** INITIALIZE RECORD button (enabled when all fields valid)

---

### Screen 2: Primary Symptom Matrix

```
┌───────────────────────────────────┐
│ PRIMARY SYMPTOM MATRIX            │
├───────────────────────────────────┤
│ ☐ Cough (> 2 Weeks)               │
│ ☐ Hemoptysis (Blood in Sputum)   │ ← RED & BOLD
│ ☐ Fever (Low grade / Evening)    │
│ ☐ Night Sweats                    │
│ ☐ Chest Pain                      │
│                                   │
│ ┌──────────┐ ┌──────────────────┐ │
│ │<< BACK   │ │NEXT: SILENT >>   │ │
│ └──────────┘ └──────────────────┘ │
└───────────────────────────────────┘
```

**Indicators:**
- 5 primary TB symptoms
- Hemoptysis highlighted (high clinical significance)
- Checkbox selection interface

**Navigation:** Back and Next buttons

---

### Screen 3: Constitutional Symptoms

```
┌───────────────────────────────────┐
│ SECONDARY/SILENT SYMPTOMS         │
├───────────────────────────────────┤
│ ☐ Extreme Fatigue / Lethargy      │
│ ☐ Anorexia (Loss of Appetite)    │
│ ☐ Dyspnea (Shortness of Breath)  │
│ ☐ Unexplained Weight Loss         │
│                                   │
│ ┌──────────┐ ┌──────────────────┐ │
│ │<< BACK   │ │NEXT: EPIDEMIO >> │ │
│ └──────────┘ └──────────────────┘ │
└───────────────────────────────────┘
```

**Indicators:**
- 4 constitutional symptoms
- Checkbox selection interface

---

### Screen 4: Risk Factor Assessment

```
┌───────────────────────────────────┐
│ RISK FACTORS & HISTORY            │
├───────────────────────────────────┤
│ ☐ History of Previous TB          │
│ ☐ Known Contact with Active TB   │
│ ☐ HIV / Immunocompromised Status  │
│ ☐ Diabetic                        │
│ ☐ Smoker                          │
│                                   │
│ ┌──────────┐ ┌──────────────────┐ │
│ │<< BACK   │ │NEXT: IMAGING >>  │ │
│ └──────────┘ └──────────────────┘ │
└───────────────────────────────────┘
```

**Indicators:**
- 5 epidemiological risk factors
- Checkbox selection interface

---

### Screen 5: Radiographic Acquisition

```
┌───────────────────────────────────┐
│ RADIOGRAPHIC ACQUISITION          │
├───────────────────────────────────┤
│                                   │
│ ┌───────────────────────────────┐ │
│ │       📁                      │ │
│ │  DROP ZONE - CLICK TO         │ │
│ │  SELECT X-RAY                 │ │
│ │  (JPG, PNG, BMP)              │ │
│ └───────────────────────────────┘ │
│                                   │
│ After file selection:             │
│ ┌───────────────────────────────┐ │
│ │       ✓                       │ │
│ │  FILE: chest_xray.jpg         │ │
│ │  SIZE: 245.3 KB               │ │
│ └───────────────────────────────┘ │
│                                   │
│ ┌───────────────────────────────┐ │
│ │ LOAD INTO INFERENCE ENGINE    │ │
│ └───────────────────────────────┘ │
└───────────────────────────────────┘
```

**Features:**
- File upload interface
- Visual feedback on file selection
- File metadata display
- Inference button (enabled after file selection)

---

### Screen 6: Diagnostic Report

```
┌───────────────────────────────────────────┐
│ DIAGNOSTIC CONSOLE - RESULT               │
├───────────────────────────────────────────┤
│                                           │
│ ┌─ PATIENT INFORMATION ─────────────────┐ │
│ │ PATIENT ID:    TB-123456              │ │
│ │ NAME:          John Doe               │ │
│ │ AGE:           45                     │ │
│ │ GENDER:        Male                   │ │
│ └───────────────────────────────────────┘ │
│                                           │
│ ┌─ PRIMARY SYMPTOMS ────────────────────┐ │
│ │ ✓ Cough (> 2 Weeks)                  │ │
│ │ ✓ Hemoptysis (Blood in Sputum)       │ │
│ │ ✗ Fever                               │ │
│ │ ✓ Night Sweats                        │ │
│ │ ✗ Chest Pain                          │ │
│ └───────────────────────────────────────┘ │
│                                           │
│ ┌─ DIAGNOSTIC RESULT ───────────────────┐ │
│ │ STATUS:  [POSITIVE]                   │ │
│ │ PROBABILITY:       94.2%              │ │
│ │ FUSION GAIN:       +24%               │ │
│ └───────────────────────────────────────┘ │
│                                           │
│ ┌───────────────────────────────────────┐ │
│ │   PRINT REPORT                        │ │
│ └───────────────────────────────────────┘ │
│ ┌───────────────────────────────────────┐ │
│ │   NEW PATIENT                         │ │
│ └───────────────────────────────────────┘ │
└───────────────────────────────────────────┘
```

**Sections:**
1. Patient Information
2. Primary Symptoms (with ✓/✗ indicators)
3. Constitutional Symptoms
4. Risk Factors
5. Radiographic Data
6. Diagnostic Result

**Actions:**
- Print Report
- New Patient (reset workflow)

---

## Visual Design Specifications

### Color Palette

**Background Colors:**
- Primary: Grey #E0E0E0
- Secondary: Grey #EEEEEE
- Input Fields: White #FFFFFF

**Accent Colors:**
- Borders: Black #000000
- Positive Status: Red #F44336
- Negative Status: Green #4CAF50
- Console Text: Green Accent #69F0AE
- High Priority: Red (Hemoptysis)

### Typography

**Font Family:** Courier (monospaced)

**Font Sizes:**
- Headers: 14-16pt, Bold
- Labels: 11-12pt, Bold
- Input Text: 11-12pt, Regular
- Console: 9-10pt, Regular

### Layout Specifications

**Borders:**
- Standard: 1px solid black
- Active/Primary: 2px solid black
- Border Radius: 0 (sharp corners)

**Spacing:**
- Section Padding: 12px
- Section Margin: 12px
- Field Spacing: 8px
- Button Padding: 12px vertical

---

## Interactive Elements

### Buttons

**Primary Button:**
- Background: Grey #808080
- Border: 2px black
- Text: Bold, black

**Secondary Button:**
- Background: Grey #BDBDBD
- Border: 2px black
- Text: Bold, black

**Disabled Button:**
- Background: Grey #BDBDBD
- Border: 1px black
- Text: Grey

### Checkboxes

**Unchecked:**
- White background
- Black border
- Square shape

**Checked:**
- Black checkmark
- White background
- Black border

### Input Fields

**Text Input:**
- White background
- Black 1px border
- Courier font
- Black text

**Dropdown:**
- White background
- Black 1px border
- Dropdown arrow indicator

---

## Diagnostic Indicators

### Symptom Status

**Present (✓):**
- Green checkmark
- Bold indicator

**Absent (✗):**
- Red X mark
- Regular weight

**High Priority:**
- Red text color
- Bold weight
- (Hemoptysis only)

### Status Badges

**POSITIVE:**
- Red background
- White text
- Bold font
- 2px black border

**NEGATIVE:**
- Green background
- White text
- Bold font
- 2px black border

---

## Processing Dialogs

### Standard Processing

```
┌─────────────────────────────────────┐
│ PROCESSING...                       │
├─────────────────────────────────────┤
│ ┌─────────────────────────────────┐ │
│ │ > Loading Model...              │ │
│ │ > Analyzing Data...             │ │
│ │ > Computing Results...          │ │
│ └─────────────────────────────────┘ │
│                                     │
│ ▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░   │
└─────────────────────────────────────┘
```

**Features:**
- Black console background
- Green text output
- Progress bar indicator
- Non-dismissible modal

---

## Workflow Navigation

### Progress Indicator

Shows current position in 6-stage workflow:
- REGISTRATION
- PRIMARY
- SILENT
- RISK
- IMAGING
- RESULTS

**Visual States:**
- Current: Bold, highlighted
- Completed: Regular
- Pending: Regular, greyed

---

## Report Output

### Print Confirmation

```
┌─────────────────────────────────────┐
│           ✓                         │
│  REPORT SENT TO PRINTER             │
│                                     │
│  Patient ID: TB-123456              │
│                                     │
│  ┌───────────────────────────────┐  │
│  │          OK                   │  │
│  └───────────────────────────────┘  │
└─────────────────────────────────────┘
```

**Elements:**
- Green checkmark icon
- Confirmation message
- Patient ID verification
- OK button to dismiss

---

**Document Version:** 2.0  
**Principal Investigator:** Avani Shahane, Ph.D. Scholar  
**Last Updated:** January 2026
