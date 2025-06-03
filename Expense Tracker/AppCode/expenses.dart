import 'package:flutter/material.dart';
import 'package:tracker_app/expenses_list.dart';
import 'package:tracker_app/expense.dart';
import 'package:tracker_app/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _expenses = [
    Expense(
      title: 'Groceries',
      amount: 50.0,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Bus Ticket',
      amount: 2.5,
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: 'Movie Ticket',
      amount: 12.0,
      date: DateTime.now(),
      category: Category.work,
    ),
  ];

  void _addExpense(Expense expense) {
    setState(() {
      _expenses.add(expense);
    });
  }

  void _overlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpense(onSaveExpense: _addExpense),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker App'),
        backgroundColor: Colors.green,
        actions: [
          // Padding(
          //   padding: const EdgeInsets.only(left: 16.0),
          //   child: Text('Expense App'),
          // ),
          // Spacer(),
          IconButton(onPressed: _overlay, icon: Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          // Text('Saying Hello'),
          // Text('This is the Second Box'),
          Expanded(
            child: ExpensesList(
              expenses: _expenses,
              onRemoveExpense: (expense) {
                setState(() {
                  _expenses.remove(expense);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
