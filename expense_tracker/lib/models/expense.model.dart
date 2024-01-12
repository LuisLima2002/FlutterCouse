import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense(
      {required this.id,
      required this.title,
      required this.amount,
      required this.category,
      required this.date});

  String get formattedDate {
    return formatter.format(date);
  }
}

final formatter = DateFormat.yMd();

enum Category { food, travel, leisure, housing }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.beach_access,
  Category.housing: Icons.house,
};

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}
