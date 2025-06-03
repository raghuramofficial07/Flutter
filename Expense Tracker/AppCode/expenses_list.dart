import 'package:flutter/material.dart';
import 'package:tracker_app/expense_item.dart'; // Ensure this file defines the ExpenseItem widget
import 'package:tracker_app/expense.dart';
// import 'package:tracker_app/expenses.dart';

class ExpensesList extends StatelessWidget {
  // Passes the key to the parent StatelessWidget for widget identification.
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;

  final void Function(Expense expense) onRemoveExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return Dismissible(
          onDismissed: (direction) => onRemoveExpense(expenses[index]),
          key: ValueKey(expenses[index]),
          child: ExpenseItem(expenses[index]),
        );
      },
    );
  }
}
