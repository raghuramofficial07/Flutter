<img width="841" alt="Screenshot 2025-06-22 at 10 51 31 AM" src="https://github.com/user-attachments/assets/501c98ee-809c-4376-b32d-6d38ae07c489" />

# Flutter ScreenPicker System (GridView Object-Based Navigation)

--------------------------------------------------------------------------------

## » Table of Contents

- Introduction  
- GridView with InkWell and Object Passing  
- Your Method (Switch-Case in `screen_picker.dart`)  
- Recommended Senior-Level Method (Map-Based)  
- File Structure Overview  
- Code Examples (Step-by-Step)  
- Concept Highlights  
- Real-World Use Cases  
- Quick Reference Table  
- Author Footer

--------------------------------------------------------------------------------

## » Introduction

This pattern provides a scalable and modular way to handle multi-screen navigation in Flutter,
where screen selection is based on tapping dynamically rendered items (e.g., food, skills, tools) 
from a `GridView.builder`. The navigation logic is offloaded to a centralized file called `screen_picker.dart`.

--------------------------------------------------------------------------------

## » GridView with InkWell and Object Passing

Each tile from the grid uses an `InkWell` widget to capture taps.
When the user taps a tile, the corresponding object or value (e.g., item name or ID)
is passed into a handler function. That function determines which screen to open.

--------------------------------------------------------------------------------

## » Your Method (Switch-Case Based Screen Picker)

```dart
// screen_picker.dart
import 'package:flutter/material.dart';
import 'screens/paneer_screen.dart';
import 'screens/biryani_screen.dart';

void screenPicker(BuildContext context, String itemName) {
  switch (itemName) {
    case 'Paneer':
      Navigator.push(context, MaterialPageRoute(builder: (_) => PaneerScreen()));
      break;
    case 'Veg Biryani':
      Navigator.push(context, MaterialPageRoute(builder: (_) => BiryaniScreen()));
      break;
    default:
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Screen not found'))
      );
  }
}
```

» Recommended Senior-Level Method (Map-Based Screen Picker)

```dart
// screen_picker.dart
import 'package:flutter/material.dart';
import 'screens/paneer_screen.dart';
import 'screens/biryani_screen.dart';

final Map<String, Widget Function()> screenMap = {
  'Paneer': () => PaneerScreen(),
  'Veg Biryani': () => BiryaniScreen(),
};

void screenPicker(BuildContext context, String itemName) {
  final screenBuilder = screenMap[itemName];

  if (screenBuilder != null) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screenBuilder()));
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('No screen found'))
    );
  }
}
```

» Code Examples (Step-by-Step)

➊ Define List of Items
```
final List<String> foodItems = ['Paneer', 'Veg Biryani'];
```
➋ Render GridView with Tap Support
```dart
GridView.builder(
  itemCount: foodItems.length,
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
  itemBuilder: (context, index) {
    final item = foodItems[index];
    return InkWell(
      onTap: () => screenPicker(context, item),
      child: Card(
        child: Center(child: Text(item)),
      ),
    );
  },
);
```
➌ Example Screen
```dart
// paneer_screen.dart
class PaneerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Paneer")),
      body: Center(child: Text("Paneer Screen")),
    );
  }
}
```

####  Concept Highlights

## » Concept Highlights

| Concept              | Description                                                                 |
|----------------------|-----------------------------------------------------------------------------|
| InkWell              | Detects and responds to user tap gestures on grid items with visual feedback. |
| GridView.builder     | Efficiently generates a scrollable, dynamic 2D layout from a data source.     |
| screenPicker()       | Centralized routing function that decouples UI from navigation logic.         |
| switch-case          | Control flow structure for handling discrete screen routing conditions.       |
| Map-based routing    | Declarative and scalable navigation technique using key-to-widget mapping.    |
| MaterialPageRoute    | Facilitates smooth stack-based screen transitions in the Flutter navigator.  |


#### Real-World Use Cases

Quiz category selection (e.g., Science, Math, History)
Food menu selection (e.g., Veg, Non-Veg, Drinks)
Skill or project pickers (Frontend, Backend, UI/UX)
Admin panel shortcuts
Portfolio page navigations

#### Quick Reference Table

Action	Method Used	Example Usage
Tap on Grid Item	InkWell	`onTap: () => screenPicker(context, item)`

Route using switch-case	switch-case	`Navigator.push(...PaneerScreen())`

Route using map	`Map<String, Widget>	screenMap[item]()`

Handle fallback	SnackBar	`ScaffoldMessenger.of(context).showSnackBar()`



### Author Footer

> Crafted by: Vemparala Sri Satya RaghuRam
> 
>Purpose: Enable clean, structured, and object-driven screen navigation using Flutter.

