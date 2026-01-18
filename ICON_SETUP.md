# Setting Up App Icon

## Windows App Icon Setup

To set your logo.png as the Windows application icon, follow these steps:

### Method 1: Using Online Converter (Recommended)

1. **Convert PNG to ICO:**
   - Go to https://convertio.co/png-ico/ or https://www.icoconverter.com/
   - Upload `assets/images/logo.png`
   - Select ICO format
   - Choose multiple sizes: 16x16, 32x32, 48x48, 256x256
   - Download the converted .ico file

2. **Replace the Icon:**
   - Save the downloaded file as `app_icon.ico`
   - Replace the existing file at:
     ```
     windows/runner/resources/app_icon.ico
     ```

3. **Rebuild the Application:**
   ```bash
   flutter clean
   flutter build windows
   ```

### Method 2: Using ImageMagick (Command Line)

If you have ImageMagick installed:

```bash
# Navigate to project directory
cd "e:\Windows Software\Tesarract\early_detection_tb"

# Convert PNG to ICO with multiple sizes
magick convert assets/images/logo.png -define icon:auto-resize=256,128,96,64,48,32,16 windows/runner/resources/app_icon.ico

# Rebuild
flutter clean
flutter build windows
```

### Method 3: Using Python with Pillow

```python
from PIL import Image

# Open the PNG image
img = Image.open('assets/images/logo.png')

# Save as ICO with multiple sizes
img.save('windows/runner/resources/app_icon.ico', 
         format='ICO', 
         sizes=[(16,16), (32,32), (48,48), (64,64), (128,128), (256,256)])
```

---

## Verification

After replacing the icon:

1. **Clean and rebuild:**
   ```bash
   flutter clean
   flutter build windows --release
   ```

2. **Check the executable:**
   - Navigate to `build/windows/x64/runner/Release/`
   - Right-click on `early_detection_tb.exe`
   - Check "Properties" → Icon should be your logo

3. **Run the app:**
   ```bash
   flutter run -d windows
   ```

---

## Icon Requirements

**Windows ICO Format:**
- Format: .ico
- Recommended sizes: 16x16, 32x32, 48x48, 256x256
- Color depth: 32-bit (with transparency)

**Source Image (logo.png):**
- Minimum size: 256x256 pixels
- Recommended: 512x512 or 1024x1024
- Format: PNG with transparency
- Square aspect ratio

---

## Troubleshooting

**Icon not changing:**
- Clear Windows icon cache
- Rebuild the application completely
- Check if .ico file is valid

**Clear Windows Icon Cache:**
```cmd
ie4uinit.exe -show
ie4uinit.exe -ClearIconCache
```

Or restart Windows Explorer:
1. Open Task Manager (Ctrl+Shift+Esc)
2. Find "Windows Explorer"
3. Right-click → Restart

---

## Current Status

✅ Assets folder configured in pubspec.yaml  
⏳ Waiting for app_icon.ico replacement  
⏳ Rebuild required after icon replacement  

**Next Steps:**
1. Convert logo.png to app_icon.ico
2. Replace windows/runner/resources/app_icon.ico
3. Run `flutter clean && flutter build windows`

---

**Principal Investigator:** Avani Shahane, Ph.D. Scholar  
**Last Updated:** January 2026
