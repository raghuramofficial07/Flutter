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
```dart
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(backgroundColor: Colors.red, body: DiceApp()),
    ),
  );
}
```
main(): The entry point of the Flutter app.
runApp(): Boots up the app and takes a widget as its argument.
MaterialApp: A wrapper that sets up the Material Design layout for the app.
Scaffold: A basic visual layout structure from the Material library.
backgroundColor: Colors.red: Sets the background color of the entire screen to red.
body: DiceApp(): Places the custom DiceApp widget in the body of the scaffold.
```dart
class DiceApp extends StatefulWidget {
  const DiceApp({super.key});
```
DiceApp: A stateful widget that can change during runtime.
StatefulWidget: Chosen because the app’s UI will update each time the dice rolls.
super.key: Passes the key to the superclass; helps Flutter uniquely identify the widget in the widget tree.
```
@override
State<DiceApp> createState() {
  return _DiceAppState();
}
```

@override: Tells Dart this method overrides the parent class’s version.
createState(): A method from StatefulWidget that must return a subclass of State.
_DiceAppState: The class that will contain the mutable state and UI logic.
🧠 _DiceAppState Class
```dart
class _DiceAppState extends State<DiceApp> {
_DiceAppState: Holds the state and user interface logic of DiceApp.
State<DiceApp>: A generic type that connects this state class to its corresponding widget.
🎲 Dice Logic
int diceNumber = 1; // Start with dice-1.png
A simple int variable initialized to 1.
It controls which dice image gets displayed. By default, it starts with dice-1.png.
🔄 rollDice() Function
void rollDice() {
  setState(() {
    diceNumber = Random().nextInt(6) + 1;
  });
}
```
```
rollDice(): Called when the user presses the button.
setState(): Notifies Flutter that the state has changed. This triggers a UI rebuild.
Random().nextInt(6) + 1: Generates a random number from 1 to 6.
```
🖼️ Widget Tree — UI Layout
```dart
@override
Widget build(BuildContext context) {
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/dice-$diceNumber.png', width: 200),
        SizedBox(height: 20),
        ElevatedButton(onPressed: rollDice, child: Text('Roll Dice')),
      ],
    ),
  );
}
```
🌳 Widget Tree Explained

```
build(): Describes the layout of the UI.
Center: Centers the child widgets both vertically and horizontally.
Column: Stacks its children vertically.
mainAxisSize: MainAxisSize.min: Minimizes the height to only fit its children (instead of taking full height).
Image.asset('assets/dice-$diceNumber.png'):
```
Loads the dice image based on the current value of diceNumber.
Example: If diceNumber == 4, then assets/dice-4.png is loaded.
SizedBox(height: 20): Adds spacing between the image and the button.
ElevatedButton:
Displays a button.
onPressed: rollDice: Links the button to the rollDice() method.
Text('Roll Dice'): Button label.
📁 Assets Setup (Required)

Make sure you have the dice images in your assets folder and add them to your pubspec.yaml:
```dart
flutter:
  assets:
    - assets/dice-1.png
    - assets/dice-2.png
    - assets/dice-3.png
    - assets/dice-4.png
    - assets/dice-5.png
    - assets/dice-6.png
```
✅ Summary

This app uses StatefulWidget because the dice number changes with user interaction.
The rollDice() function updates the state with a new random number between 1 and 6.
The UI updates automatically thanks to setState().
Dice images change dynamically based on the dice number.
Clean separation of logic (rollDice()) and layout (build()).
📚 Concepts Covered

Flutter UI layout: Column, Image.asset, ElevatedButton
State management with StatefulWidget
Dart basics: Random number generation, class structure, widgets
Asset management in Flutter
Event handling via button press



