import 'package:expense_tracker/models/expense.model.dart';
import 'package:flutter/material.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            expense.title,
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Text('€${expense.amount.toStringAsFixed(2)}'),
              const Spacer(),
              Row(
                children: [
                  // Text(expense.date.toString()),
                  Icon(categoryIcons[expense.category]),
                  const SizedBox(width: 4),
                  Text(expense.formattedDate),
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }
}
