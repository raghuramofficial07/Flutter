<img width="841" alt="Screenshot 2025-06-22 at 10 51 31 AM" src="https://github.com/user-attachments/assets/501c98ee-809c-4376-b32d-6d38ae07c489" />

# Dart List & Class Instances Q&A

---

### Q: What role does a `List` play when working with classes like `Expense`?

**A:**  
A `List` in Dart is a collection (like an array) that can **store multiple objects**, including instances of your custom classes like `Expense`.

---

### Q: How does a `List` hold multiple `Expense` objects?

**A:**  
You can create a list of `Expense` objects to group many expenses together.

Example:

```dart
final List<Expense> expenses = [
  Expense(
    title: 'Groceries',
    amount: 40.0,
    date: DateTime.now(),
    category: Category.food,
  ),
  Expense(
    title: 'Taxi',
    amount: 15.0,
    date: DateTime.now(),
    category: Category.travel,
  ),
];
```
Q: What happens when you add Expense objects to a list?
A:
Each Expense object is stored in the list as a separate element.
The list manages their order and allows you to access each expense individually by index.

Q: How is data structured under the hood?
A:

Each Expense object holds its own data in its fields (title, amount, etc.).
The List<Expense> holds references to these objects in order.
So the list acts like a container or collection of multiple Expense objects.
Q: Why is this useful?
A:
Using a list lets you:

Store many expense records easily,
Loop over them, filter, or sort,
Pass around one object containing multiple expenses.
Summary:
A List is a collection that can hold many objects.
List<Expense> holds multiple Expense objects, each with its own data.
The list keeps track of these objects, enabling operations on the whole set.

## Stoty Time 

In Dartland, there was a blueprint called Expense. This blueprint taught how to create expense objects with properties like title, amount, and date.

One day, a container named expenses was created. This container was special—it could hold many Expense objects all at once. The container’s type was List<Expense>, meaning it was a list made just for Expense objects.

Whenever someone wanted to know about a particular expense, they would ask the container by giving it a number, called an index. For example, expenses[0] would give the first expense, and from there, they could ask for the title by saying expenses[0].title.

So, Expense was the blueprint, expenses was the container, and the index was the key to unlock any specific expense inside that container.


## Code for Future Reference 

```Dart

import 'package:uuid/uuid.dart';

final uuid = Uuid();

enum Category { food, travel, leisure, work }

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}


```

## Code - (b)

```dart
import 'package:flutter/material.dart';
import 'package:tracker_app/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Text(expenses[index].title),
    );
  }
}
```

# Flutter UI and State Management Notes

---

## 📌 When `setState()` is Called

When a `setState()` is called in a `State` class, Flutter **re-executes the `build()` method** to reflect UI changes.

---

## 🧱 Arranging Content in Flutter

If we want to arrange content on the screen perfectly and as we desire, we use certain **layout widgets** like:

- `Column()`
- `Row()`

### 📦 Example Usage

To use these, we typically use them inside a widget like `Scaffold`:

```dart
class _ExpensesState extends State<Expenses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Content goes here
        ],
      ),
    );
  }
}
```

🔹 Use child if you are adding only one widget inside a container.
🔹 Use children[] if you are adding multiple widgets.

❓ Topics to Be Finalized / Learned

🔄 initState() in Flutter – Initializers
Purpose: Runs only once when the widget is inserted into the widget tree.
Used for setup operations like loading data, starting animations, or setting initial values.
```
@override
void initState() {
  super.initState();
  // Initialization code here
}
```
🧾 enum Type – Explanation & Syntax
Enums are used to define a set of named constant values.

```

enum ExpenseCategory {
  food,
  travel,
  shopping,
  bills,
}

```
Why use it?

Improves code readability
Helps enforce strict value types
Works great with switch-case logic
📋 When Do We Use List<Expense> in Dart/Flutter?

To store multiple Expense objects in one place.
When we want to display a list of expenses in the UI (e.g., using ListView).
To add new expenses dynamically using .add() or .insert().
To calculate the total amount spent using .fold() or .map().
To filter expenses based on conditions (e.g., amount > 100).
To pass a list of expenses from one widget to another.
To load expenses from a database or API and store them.
Helps ensure type safety — only Expense objects are allowed.
📏 Spacer() Widget

`Spacer()` is used in Row or Column to create adjustable empty space between widgets.

Expands to fill available space
Often used to push widgets to opposite ends
Example:
```
Row(
  children: [
    Text('Left'),
    Spacer(),
    Text('Right'),
  ],
)
```

🧭 Using `Row()` inside another `Row()`

Embedding one Row() inside another allows better alignment and separation of content, especially when you want to organize items in rows within rows.

🃏 Card() Widget

The Card widget is used to display information in a box with:

Elevation (shadow)
Rounded corners
A material design look
Example:
```
Card(
  elevation: 4,
  margin: EdgeInsets.all(8),
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Text('This is a card'),
  ),
)
```

❗️Fixing Layout Errors with ListView in Column

The issue occurs when your ExpensesList (which uses a ListView) is placed directly inside a Column without using Expanded.

Why?

ListView doesn’t know how much height to use.
This causes rendering errors or empty space.
✅ Solution: Wrap with Expanded
```
Column(
  children: [
    Expanded(
      child: ExpensesList(),
    ),
  ],
)
```

🧠 Notes on TextEditingController in Flutter

📌 Purpose:
To control and monitor the text being edited in a TextField or TextFormField.

🔧 Usage:
Attach it to a TextField using the controller property.
Access current text with .text
Update text programmatically using `.text`

✅ Example:
```
final _controller = TextEditingController();

TextField(
  controller: _controller,
);
```
// To get the value:
`print(_controller.text);`

`🗑 Disposing:`

Always call .dispose() on the controller in the dispose() method to avoid memory leaks:
```
@override
void dispose() {
  _controller.dispose();
  super.dispose();
}
```
🕓 When to Use:
To read the text input value
To set the text programmatically
To listen for changes in the text field
Summary:
TextEditingController is essential for managing text input in forms. Always dispose of it when done.

## Flutter _AssertionError – Cause & Fix (TextField inside Row)

🛑 Error Type:
`_AssertionError from dart:core-patch/errors_patch.dart`

⚠️ Cause:
Using a TextField inside a Row without width constraints.

Why It Fails:

Row gives children unbounded horizontal space
TextField tries to take infinite width
Flutter asserts that widget width must be finite → Assertion fails
🛠 Fixes:

## Option 1: Use Expanded
```
Row(
  children: [
    Expanded(
      child: TextField(),
    ),
  ],
)
```
## Option 2: Use Flexible

```
Row(
  children: [
    Flexible(
      child: TextField(),
    ),
  ],
)
```
## Option 3: Use SizedBox or Set Width
```
Row(
  children: [
    SizedBox(
      width: 200,
      child: TextField(),
    ),
  ],
)
```
## Option 4: Remove Row if Not Needed

TextField()
Summary:
Always constrain the width when placing a TextField inside a Row, or you'll get an _AssertionError during render.



--------------


`To Be Continued on` `@CodeBook(2).md`
