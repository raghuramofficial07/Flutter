
## ㆐About Screen Auto-Layout ㆐ 

# 1 » What is the cupertino.dart File in Flutter?

Explanation:
Flutter supports two main design languages:

Material (for Android and cross-platform)
Cupertino (for iOS-style UIs)
The cupertino.dart file is part of the flutter/cupertino.dart package and contains widgets that mimic native iOS design and behavior.

```dart
import 'package:flutter/cupertino.dart';

void main() {
  runApp(
    CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('iOS Style App'),
        ),
        child: Center(
          child: CupertinoButton(
            child: Text("Press Me"),
            onPressed: () {
              print("Cupertino Button Pressed");
            },
          ),
        ),
      ),
    ),
  );
}
```
When to use:
Use CupertinoApp when targeting iOS-style UI.
Use MaterialApp for Android and cross-platform UI.
Combine both using platform checks (Platform.isIOS).

# 2 » How to Check Which Platform the App is Running On Using dart:io

Explanation:
Use the Platform class from dart:io to detect the current operating system.

```dart
import 'dart:io';

void checkPlatform() {
  if (Platform.isIOS) {
    print("Running on iOS");
  } else if (Platform.isAndroid) {
    print("Running on Android");
  } else {
    print("Running on some other platform");
  }
}

```

# 3 » How to Get Screen Width and Height Using MediaQuery

Explanation:
Use MediaQuery.of(context).size to get the device screen's width and height. This helps build responsive layouts.

```dart

@override
Widget build(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;

  return Scaffold(
    body: Center(
      child: Text('Width: $screenWidth, Height: $screenHeight'),
    ),
  );
}


```

# Use Conditional Layouts:

```dart
Widget responsiveLayout(BuildContext context) {
  double width = MediaQuery.of(context).size.width;

  if (width < 600) {
    return Column(
      children: [Text('Small Screen')],
    );
  } else {
    return Row(
      children: [Text('Large Screen')],
    );
  }
}

```

# 4 » What are BoxConstraints and How to Use LayoutBuilder

Explanation:
BoxConstraints describe how big a widget can be (minWidth, maxWidth, minHeight, maxHeight).
LayoutBuilder gives access to these constraints so you can change layout based on available space.

```dart
Widget build(BuildContext context) {
  return LayoutBuilder(
    builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return Column(
          children: [Text('Small screen')],
        );
      } else {
        return Row(
          children: [Text('Large screen')],
        );
      }
    },
  );
}

```

# 5 » Final Use Case: Full Responsive Layout with Conditional UI

```dart
class ResponsiveExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: Text("Responsive Layout")),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (screenWidth < 600) {
            return Column(
              children: [
                Text("Screen is small"),
                Container(
                  height: screenHeight * 0.3,
                  color: Colors.blue,
                ),
              ],
            );
          } else {
            return Row(
              children: [
                Text("Screen is large"),
                Container(
                  width: screenWidth * 0.3,
                  color: Colors.green,
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

```

| Feature                       | Tool / Method                 | Usage Example                             |
| ----------------------------- | ----------------------------- | ----------------------------------------- |
| Detect Platform (Android/iOS) | `dart:io`                     | `Platform.isIOS`, `Platform.isAndroid`    |
| Detect Web                    | `foundation.dart`             | `kIsWeb`                                  |
| Get screen size               | `MediaQuery.of(context).size` | `screenWidth`, `screenHeight`             |
| Responsive layout by widget   | `LayoutBuilder`               | `builder: (context, constraints) { ... }` |
| iOS widgets                   | `flutter/cupertino.dart`      | `CupertinoButton`, `CupertinoApp`, etc.   |



> The Entire Content on This Page is Purly Belongs to [`RaghuRam `](https://raghuramdev.blogspot.com) ...
> on June 4 , 2025
