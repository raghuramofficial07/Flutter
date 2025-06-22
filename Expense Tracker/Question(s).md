
<img width="841" alt="Screenshot 2025-06-22 at 10 51 31 AM" src="https://github.com/user-attachments/assets/501c98ee-809c-4376-b32d-6d38ae07c489" />

# Understanding Data Flow in ExpensesList and ExpenseItem Widgets

## 📥 How Does `ExpensesList` Get the Data It Displays?

`ExpensesList` receives a list of `Expense` objects from its parent widget (such as `Expenses`).  
This list is passed through the constructor as the `expenses` parameter.

---

## 📄 What Type of Data Does `ExpensesList` Expect?

It expects a `List<Expense>`, which is a Dart list containing multiple `Expense` objects.

---

## 🖼️ How Does `ExpensesList` Display Each Expense?

`ExpensesList` uses `ListView.builder` to iterate over the `expenses` list.  
For each index, it creates an `ExpenseItem` widget and passes the corresponding `Expense` object (`expenses[index]`) to it.

---

## 📦 How Does `ExpenseItem` Get Its Data?

`ExpenseItem` receives a single `Expense` object from `ExpensesList` and displays its details.

---

## 🔒 Can `ExpensesList` Store or Modify the Data?

No, `ExpensesList` **only receives and displays** the data.  
It does **not** store or modify the list itself.

---

## 🧱 How Is the Data Structured in the List?

Each item in the list is an `Expense` object, which contains fields like:

- `title`
- `amount`
- `date`
- `category`

---

## 🔍 How Do I Access a Specific Expense in the List?

You can access a specific expense by its index. For example:

```dart
expenses[0] // Accesses the first Expense object in the list
