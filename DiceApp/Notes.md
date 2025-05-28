# 🎲 DiceApp in Flutter — Full Breakdown

This Flutter application simulates a dice roller. When the user taps a button, it generates a random number between 1 and 6 and displays a corresponding dice image from the assets folder.

---

## 🔧 Imports and Main Function

```dart
import 'package:flutter/material.dart';
import 'dart:math';
```

flutter/material.dart: Imports the Material Design package. It provides pre-built widgets like Scaffold, Center, Column, ElevatedButton, etc.
dart:math: Provides access to mathematical functions, including the Random class used to simulate a dice roll.
```c
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(backgroundColor: Colors.red, body: DiceApp()),
    ),
  );
}
```
