import 'package:expense_tracker/widgets/bottom_bar/bottom_bar.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.model.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  _ExpensesState() {
    filteredExpenses = _registeredExpenses;
  }

  final List<DateTime> selectedMonths = [];

  final List<Expense> _registeredExpenses = [
    Expense(
        id: "0",
        title: "Flutter",
        amount: 19.99,
        category: Category.leisure,
        date: DateTime.now()),
    Expense(
        id: "1",
        title: "Cinema",
        amount: 5,
        category: Category.leisure,
        date: DateTime.now())
  ];

  List<Expense> filteredExpenses = [];

  void _onOpenExpenseModal() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return NewExpense(
            addNewExpense: addNewExpense,
          );
        });
  }

  void addNewExpense(Expense newExpense) {
    setState(() {
      _registeredExpenses.add(newExpense);
      filterExpensesByDate(lastFilteredDates);
    });
  }

  List<DateTime> lastFilteredDates = [];

  void filterExpensesByDate(List<DateTime> filteredDates) {
    lastFilteredDates = filteredDates;
    setState(() {
      filteredExpenses = _registeredExpenses.where((expense) {
        for (var date in filteredDates) {
          if (isSameMonth(date, expense.date)) {
            return false;
          }
        }
        return true;
      }).toList();
    });
  }

  bool isSameMonth(DateTime a, DateTime b) {
    return a.month != b.month || a.year != b.year;
  }

  void removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
      filterExpensesByDate(lastFilteredDates);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 3),
      content: const Text("Expense Deleted."),
      action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Expense Tracker"),
        actions: [
          IconButton(
              onPressed: _onOpenExpenseModal, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Chart(expenses: filteredExpenses),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: filteredExpenses.isNotEmpty
                ? ExpensesList(
                    expenses: filteredExpenses,
                    removeExpense: removeExpense,
                  )
                : const Center(
                    child: Text("No Expense found."),
                  ),
          )
        ],
      ),
      bottomNavigationBar: BottomBar(
        onFilter: filterExpensesByDate,
      ),
    );
  }
}
