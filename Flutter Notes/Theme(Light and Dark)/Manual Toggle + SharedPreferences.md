
<!-- GitHub Project Banner -->
<p align="center">
  <img src="https://github.com/user-attachments/assets/501c98ee-809c-4376-b32d-6d38ae07c489" alt="Project Banner" width="100%">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Calculator-black?logo=apple&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/Built%20by-RaghuRam-black?labelColor=black&color=black">
</p>

# » Topic Title  
**Light & Dark Mode with Manual Toggle + SharedPreferences in Flutter**

---

## » Table of Contents
- Introduction  
- Core Concepts  
- Setup SharedPreferences  
- Step-by-Step Implementation  
- Full Code Example  
- Real-World Use Case  
- Quick Reference Table  
- » Author Footer

---

## » Introduction  
This document extends our dynamic theming with **manual light/dark mode toggle** using `Switch` widget and **theme persistence** using `SharedPreferences`.

---

## » Core Concepts  
- `ThemeMode`: Can be set to `.system`, `.light`, or `.dark`
- `SharedPreferences`: Stores the user’s theme preference locally
- `ValueNotifier` or `Provider`: Manages theme state
- `Switch` Widget: Used to toggle between themes

---

## » Setup SharedPreferences  

Add dependency in `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  shared_preferences: ^2.2.0
```

---

## » Step-by-Step Implementation  

1. Create a `ThemeProvider` class with `SharedPreferences`
2. Initialize `ThemeMode` at app start
3. Wrap app in `ChangeNotifierProvider`
4. Use a `Switch` widget to toggle

---

## » Full Code Example  

```dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themePref = await SharedPreferences.getInstance();
  final isDark = themePref.getBool('isDark') ?? false;
  runApp(ChangeNotifierProvider(
    create: (_) => ThemeProvider(isDark ? ThemeMode.dark : ThemeMode.light),
    child: const MyApp(),
  ));
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode;

  ThemeProvider(this._themeMode);

  ThemeMode get themeMode => _themeMode;

  void toggleTheme(bool isDark) async {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', isDark);
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Dark Mode Toggle App',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.black)),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      ),
      themeMode: themeProvider.themeMode,
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Toggle App'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Dark Mode'),
            Switch(
              value: isDark,
              onChanged: (value) =>
                  Provider.of<ThemeProvider>(context, listen: false).toggleTheme(value),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## » Real-World Use Case  

Perfect for apps that need persistent user preferences — like budget trackers, health apps, or readers.

---

## » Quick Reference Table

| Feature        | Light Mode            | Dark Mode             |
|----------------|------------------------|------------------------|
| Text Color     | Black                  | White                  |
| Background     | White                  | Black                  |
| Storage        | SharedPreferences Key  | `isDark = true/false`  |
| Toggle UI      | `Switch()`             |                        |

---

## » Author Footer

**Created By:** Vemparala Sri Satya RaghuRam  
**License:** MIT  
**Platform:** Flutter (Dart)  

<p align="left">
  <img src="https://img.shields.io/badge/%23BeyondCertifications-black?logo=tag&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23IndustryOriented-black?logo=tag&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23CodeWithRaghuRam-black?logo=tag&logoColor=white&labelColor=black&color=black">
</p>
