# Windows MSIX Installer Guide

## Early TB Detection System

**Principal Investigator:** Avani Shahane, Ph.D. Scholar
**Installer Type:** Windows MSIX Package

---

## 📦 Installer Location

The installer has been generated at:
```
build\windows\x64\runner\Release\early_detection_tb.msix
```

## 🚀 How to Install

1. **Locate the file**: Go to the path mentioned above.
2. **Run**: Double-click `early_detection_tb.msix`.
3. **Install**: The Windows App Installer window will appear. Click **Install**.
   - *Note: Since this is a self-signed/test certificate (default for development), you might need to enable "Sideload apps" or "Developer Mode" in Windows Settings > Update & Security > For developers, if you primarily distribute to internal test machines.*
   - *For wider distribution, Windows typically requires the package to be signed with a trusted certificate.*

## 📤 Distribution

You can share the `.msix` file directly via:
- USB Drive
- Network Share
- Email / Cloud Storage

## 🔧 Building in the Future

To recreate the installer after making code changes:

1. **Run the creation command:**
   ```bash
   dart run msix:create
   ```
   
   This command automatically:
   - Builds the Flutter release version.
   - Packages it into an MSIX installer.

## 📋 System Requirements

- **OS:** Windows 10 (Version 1809 or later) or Windows 11.
- **Architecture:** x64.

---

**Troubleshooting:**
If the installer fails to launch on a target machine, ensure the "App Installer" is installed from the Microsoft Store (it is usually pre-installed on modern Windows).
