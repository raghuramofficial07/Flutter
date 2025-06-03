import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
// This file defines the Expense class and its related components.
// The Expense class represents an expense with a title, amount, date, and category.
// It also includes an enumeration for different categories and a mapping of category icons.
// Importing necessary packages
import 'package:flutter/material.dart';

final formatter = DateFormat.yMd();

final uuid = Uuid();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

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

  String get formattedDate {
    return formatter.format(date);
  }
}
