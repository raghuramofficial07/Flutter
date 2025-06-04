
- 1 » What is the cupertino.dart File in Flutter?

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

