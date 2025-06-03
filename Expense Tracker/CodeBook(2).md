📌 Async and Await in Flutter
```dart
void _presentDatePicker() async {
  final now = DateTime.now();
  final firstDate = DateTime(now.year - 1, now.month, now.day);
  final lastDate = DateTime(now.year + 1, now.month, now.day);

  final pickedDate = await showDatePicker(
    context: context,
    firstDate: firstDate,
    lastDate: lastDate,
  );

  setState(() {
    _selectedDate = pickedDate;
  });
}
```
🧠 Notes:
async allows the function to perform asynchronous operations (i.e., operations that take time without freezing the UI).
await tells Flutter to pause the function at showDatePicker until the user picks a date or cancels.
pickedDate will store the selected date.
setState() updates _selectedDate and triggers a UI rebuild to reflect the change.
📆 Displaying Selected Date or Default Text
```dart
Text(
  _selectedDate == null
    ? 'No Date Chosen'
    : formatter.format(_selectedDate!),
)
```
🧠 Notes:
This Text widget conditionally displays:
"No Date Chosen" if _selectedDate is null
Formatted date if _selectedDate is not null.
formatter.format(...) converts the date into a human-readable format like Jun 3, 2025.
_selectedDate! uses the null-check operator (!) because we’ve confirmed it’s not null.
💾 How widget.onSaveExpense() Works

```dart
widget.onSaveExpense(
  Expense(
    title: enteredTitle,
    amount: enteredAmount,
    date: _selectedDate!,
    category: _selectedCategory!,
  ),
);

```
🧠 Notes:
widget.onSaveExpense is a callback function passed from the parent widget (like NewExpense).
It's triggered when the user saves a new expense.
It sends an Expense object with user-entered data to the parent (e.g., _addExpense function in the main list).
The parent widget handles adding the new expense to the list and updating the UI.
🔄 Builder and Function Callback

builder: (ctx) => NewExpense(onSaveExpense: _addExpense),
🧠 Notes:
builder is a function that returns a widget (like NewExpense).
We're passing the _addExpense function to NewExpense via the onSaveExpense parameter.
Inside NewExpense, calling widget.onSaveExpense(data) will trigger _addExpense(data) in the parent widget.
🗨️ What is a SnackBar?

A SnackBar is a short message displayed at the bottom of the screen to provide feedback.
```dart
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text('Expense deleted!'),
    duration: Duration(seconds: 2),
  ),
);
```
🧠 Notes:
Used for temporary messages (e.g., success, error, delete confirmations).
Automatically disappears after a few seconds.
Requires access to ScaffoldMessenger.of(context) to display.
🌗 Dark Theme and Light Theme in Flutter

» Add Themes in MaterialApp:
```dart
MaterialApp(
  theme: ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
  ),
  darkTheme: ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
  ),
  themeMode: ThemeMode.system, // or .light / .dark
);
```
🧠 Notes:
theme: Light theme settings
darkTheme: Dark mode settings
themeMode: Chooses which one to use (system, light, or dark)
📊 Notes on Chart Widget (Using Bar Chart or Pie Chart)

Example using charts_flutter or custom logic:
```dart
class Chart extends StatelessWidget {
  final List<Expense> recentExpenses;

  // Build bars for each day/expense
  // Add formatting and layout as needed
}
```
🧠 Notes:
Charts help visualize expenses over time.
You can group data by day, week, category, etc.
Libraries like charts_flutter, fl_chart, or custom widgets can be used.
The chart widget can be added to your layout using Column or Container.
🧹 Dismissible Widget Notes
```dart
Dismissible(
  key: ValueKey(expense.id),
  background: Container(color: Colors.red),
  onDismissed: (direction) {
    // Remove item from the list
  },
  child: ListTile(title: Text(expense.title)),
)
```
🧠 Notes:
Makes list items swipeable to delete or archive.
key: A unique identifier (must be unique for each item).
background: UI shown behind the item during swipe.
onDismissed: Callback that triggers when the item is swiped away.
