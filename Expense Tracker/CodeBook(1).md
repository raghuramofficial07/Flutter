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
