# Code Architecture - Refactored Structure

## Project Structure

The Early TB Detection System has been refactored into a modular, well-organized architecture following Flutter best practices.

**Principal Investigator:** Avani Shahane, Ph.D. Scholar

---

## Directory Structure

```
lib/
├── main.dart                          # App entry point
├── pages/
│   └── home_page.dart                 # Main application page with state management
├── widgets/
│   ├── patient_registration_screen.dart
│   ├── primary_symptoms_screen.dart
│   ├── silent_symptoms_screen.dart
│   ├── risk_factors_screen.dart
│   ├── imaging_screen.dart
│   └── results_screen.dart
└── components/
    ├── app_header.dart
    ├── step_indicator.dart
    ├── processing_dialog.dart
    ├── primary_button.dart
    ├── secondary_button.dart
    ├── custom_checkbox.dart
    ├── symptom_status_row.dart
    └── info_row.dart
```

---

## Architecture Overview

### Separation of Concerns

**1. Main Entry Point** (`main.dart`)
- Application initialization
- Theme configuration
- Root widget setup

**2. Pages** (`pages/`)
- Business logic and state management
- Screen navigation
- Data processing
- API calls (simulated)

**3. Widgets** (`widgets/`)
- Screen-level components
- Each screen is a separate widget
- Receives data via props
- Emits events via callbacks

**4. Components** (`components/`)
- Reusable UI elements
- Stateless widgets
- Generic and composable
- No business logic

---

## Component Details

### Core Components

**AppHeader**
- Application title and version
- Consistent header across all screens
- Legacy enterprise styling

**StepIndicator**
- Workflow progress visualization
- 6-step wizard navigation
- Highlights current step

**ProcessingDialog**
- Context-aware processing feedback
- Animated console logs
- Progress bar indicator
- Non-dismissible modal

**PrimaryButton**
- Main action buttons
- Darker background
- Enabled/disabled states

**SecondaryButton**
- Secondary actions
- Lighter background
- Navigation buttons

**CustomCheckbox**
- Symptom/risk factor selection
- High-priority styling option
- Legacy checkbox design

**SymptomStatusRow**
- Displays symptom status (✓/✗)
- Color-coded indicators
- High-weight highlighting

**InfoRow**
- Label-value data display
- Consistent formatting
- Used in results section

---

## Screen Widgets

### PatientRegistrationScreen
**Purpose:** Collect patient demographics  
**Props:**
- patientId, patientName, patientAge, patientGender
- onNameChanged, onAgeChanged, onGenderChanged
- onNext

**Features:**
- Auto-generated patient ID
- Form validation
- Text inputs and dropdown

---

### PrimarySymptomsScreen
**Purpose:** Assess primary TB symptoms  
**Props:**
- 5 boolean symptom values
- 5 onChange callbacks
- onNext, onPrevious

**Features:**
- Hemoptysis highlighted in red
- Checkbox selection
- Back/Next navigation

---

### SilentSymptomsScreen
**Purpose:** Evaluate constitutional symptoms  
**Props:**
- 4 boolean symptom values
- 4 onChange callbacks
- onNext, onPrevious

**Features:**
- Silent symptom assessment
- Checkbox selection
- Navigation buttons

---

### RiskFactorsScreen
**Purpose:** Capture epidemiological risk factors  
**Props:**
- 5 boolean risk factor values
- 5 onChange callbacks
- onNext, onPrevious

**Features:**
- Risk factor checkboxes
- Navigation buttons

---

### ImagingScreen
**Purpose:** X-ray file upload  
**Props:**
- selectedFileName, selectedFile
- onPickFile, onRunInference, onPrevious

**Features:**
- File picker integration
- Visual file preview
- Conditional button enabling

---

### ResultsScreen
**Purpose:** Display comprehensive diagnostic report  
**Props:**
- All patient data (14 props)
- All symptoms (14 props)
- Diagnostic results (3 props)
- onPrintReport, onNewPatient

**Features:**
- 6 organized sections
- Patient info, symptoms, risks, imaging, results
- Print and reset functionality

---

## State Management

### HomePage State
```dart
// Patient data
String _patientId
String _patientName
int _patientAge
String _patientGender

// Symptoms (9 booleans)
bool _coughOver2Weeks, _hemoptysis, _fever...

// Risk factors (5 booleans)
bool _previousTB, _tbContact, _hivStatus...

// Imaging
String? _selectedFileName
PlatformFile? _selectedFile

// Results
double _probability
int _fusionGain
bool _isPositive
```

### Data Flow
```
User Input → Screen Widget → Callback → HomePage State → setState → Re-render
```

---

## Design Patterns

### 1. **Composition over Inheritance**
- Small, focused widgets
- Composed into larger screens
- Reusable components

### 2. **Unidirectional Data Flow**
- Props down, events up
- Parent manages state
- Children are stateless (mostly)

### 3. **Single Responsibility**
- Each widget has one job
- Clear separation of concerns
- Easy to test and maintain

### 4. **DRY (Don't Repeat Yourself)**
- Reusable button components
- Shared checkbox widget
- Common data row format

---

## Benefits of Refactored Architecture

### Maintainability
✅ Easy to locate specific functionality  
✅ Changes isolated to specific files  
✅ Clear file naming conventions  

### Scalability
✅ Easy to add new screens  
✅ Simple to create new components  
✅ Modular structure supports growth  

### Testability
✅ Components can be tested in isolation  
✅ Clear input/output contracts  
✅ Mockable dependencies  

### Readability
✅ Small, focused files  
✅ Clear component hierarchy  
✅ Self-documenting structure  

### Reusability
✅ Components used across screens  
✅ Consistent UI elements  
✅ Shared styling and behavior  

---

## File Sizes

```
main.dart                           ~25 lines
home_page.dart                      ~450 lines
patient_registration_screen.dart    ~140 lines
primary_symptoms_screen.dart        ~90 lines
silent_symptoms_screen.dart         ~85 lines
risk_factors_screen.dart            ~95 lines
imaging_screen.dart                 ~100 lines
results_screen.dart                 ~400 lines
app_header.dart                     ~25 lines
step_indicator.dart                 ~55 lines
processing_dialog.dart              ~110 lines
primary_button.dart                 ~35 lines
secondary_button.dart               ~35 lines
custom_checkbox.dart                ~55 lines
symptom_status_row.dart             ~45 lines
info_row.dart                       ~30 lines
```

**Total:** ~1,775 lines (vs. ~1,100 lines in single file)

The slight increase is due to:
- Import statements in each file
- Better code organization
- More explicit structure

---

## Development Workflow

### Adding a New Screen
1. Create widget file in `widgets/`
2. Define props interface
3. Implement UI
4. Add to HomePage navigation
5. Update StepIndicator if needed

### Adding a New Component
1. Create widget file in `components/`
2. Make it reusable and generic
3. Use across multiple screens
4. Document props and usage

### Modifying Existing Screen
1. Locate screen file in `widgets/`
2. Make changes
3. Hot reload to test
4. No impact on other screens

---

## Best Practices Followed

✅ **Proper Widget Naming:** PascalCase for classes  
✅ **File Organization:** Logical folder structure  
✅ **Stateless Where Possible:** Most widgets are stateless  
✅ **Props Over State:** Data passed via constructor  
✅ **Callbacks for Events:** Parent handles state changes  
✅ **Const Constructors:** Performance optimization  
✅ **Clear Naming:** Descriptive file and widget names  

---

## Migration from Single File

### Before
- 1 file with ~1,100 lines
- All code in one place
- Hard to navigate
- Difficult to maintain

### After
- 16 well-organized files
- Clear separation of concerns
- Easy to navigate
- Simple to maintain and extend

---

**Document Version:** 1.0  
**Principal Investigator:** Avani Shahane, Ph.D. Scholar  
**Last Updated:** January 2026  
**Architecture:** Modular Flutter Application
