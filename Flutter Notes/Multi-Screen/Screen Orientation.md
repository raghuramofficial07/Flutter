# » Locking Screen Orientation in Flutter

## » Table of Contents
- » Introduction  
- » Why Lock Screen Orientation  
- » Code Implementation (with SystemChrome)  
- » Required Platform Configurations  
- » Real-World Use Case  
- » Concept Highlights  
- » Quick Reference Table  
- » Author Footer

---

## » Introduction

In Flutter, apps run in both **portrait** and **landscape** mode by default. However, certain apps (e.g., calculators, video players, games) are best used in a specific orientation.

**Locking orientation** ensures a consistent UI and user experience across all devices.

---

## » Why Lock Screen Orientation

Use orientation locking when:
- Your layout breaks or looks odd in one orientation.
- You want to optimize content display (e.g., videos in landscape).
- UX requires fixed layout (e.g., onboarding, payment screens).

Flutter provides a direct way using `SystemChrome` from `services.dart`.

---

## » Code Implementation (with SystemChrome)

```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Required for orientation control

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required before setting orientation

  // Lock to portrait mode only
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Orientation Lock Demo',
      home: OrientationLockedHome(),
    );
  }
}

class OrientationLockedHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Portrait Mode Locked")),
      body: Center(child: Text("This screen is locked in portrait orientation")),
    );
  }
}
```

---

## » Required Platform Configurations

### Android

Update `AndroidManifest.xml`:

```xml
<activity
  android:name=".MainActivity"
  android:screenOrientation="portrait"  <!-- Lock to portrait -->
  android:configChanges="orientation|keyboardHidden|screenSize"
  android:launchMode="singleTop"
  android:theme="@style/LaunchTheme"
  android:exported="true">
```

📁 File: `android/app/src/main/AndroidManifest.xml`

---

### iOS

Update `Info.plist`:

```xml
<key>UISupportedInterfaceOrientations</key>
<array>
  <string>UIInterfaceOrientationPortrait</string>
  <string>UIInterfaceOrientationPortraitUpsideDown</string>
</array>
```

📁 File: `ios/Runner/Info.plist`

---

## » Real-World Use Case

**App scenario:**  
You are building a **BMI calculator** or a **form-heavy finance app** where landscape layouts break the design or make input harder.

Locking the app in **portrait** ensures that your UI remains stable and user-friendly across all devices.

For **video streaming**, you might **lock landscape** to give users a widescreen experience.

---

## » Concept Highlights

| Feature                        | Description                                                                 |
|--------------------------------|-----------------------------------------------------------------------------|
| `SystemChrome.setPreferredOrientations()` | Flutter method to lock orientation programmatically                    |
| Android `Manifest.xml`         | Required for native enforcement                                            |
| iOS `Info.plist`               | Required for iOS-level enforcement                                         |
| Portrait / Landscape Modes     | You can choose portrait-only, landscape-only, or both                     |
| Initialization Needed          | Must use `WidgetsFlutterBinding.ensureInitialized()` before lock          |

---

## » Quick Reference Table

| Orientation Lock Type      | Flutter Call                                                   |
|----------------------------|-----------------------------------------------------------------|
| Portrait only              | `DeviceOrientation.portraitUp`, `portraitDown`                 |
| Landscape only             | `DeviceOrientation.landscapeLeft`, `landscapeRight`            |
| All orientations (default) | No call needed                                                 |

---

## » Author Footer

```
Author: Vemparala Sri Satya RaghuRam  
iOS & Flutter Developer  
Updated for GitHub: 2025-06-16
```

---

