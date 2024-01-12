import 'package:expense_tracker/models/expense.model.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.addNewExpense});

  final void Function(Expense newExpense) addNewExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  // String _enteredTitle = '';

  // void _saveTitleInput(String value) {
  //   _enteredTitle = value;
  // }

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectDate = DateTime.now();
  Category _selectCategory = Category.food;

  void _presentDatePicker() {
    final now = DateTime.now();
    showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now.subtract(const Duration(days: 365)),
      lastDate: now.add(const Duration(days: 365)),
    ).then((value) => {
          if (value != null)
            {
              setState(() {
                _selectDate = value;
              })
            }
        });
  }

  void _submitNewExpense() {
    final enteredAmount = double.tryParse(_amountController.text);
    if (_titleController.text.trim().isEmpty ||
        enteredAmount == null ||
        enteredAmount < 0) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text("Invalid input"),
                content: const Text(
                    " Please make sure to insert a valid title and amount"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: const Text("Close"))
                ],
              ));
      return;
    }
    widget.addNewExpense(Expense(
        id: "0",
        title: _titleController.text,
        amount: enteredAmount,
        category: _selectCategory,
        date: _selectDate));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(children: [
        TextField(
          decoration: const InputDecoration(label: Text("Title")),
          maxLength: 50,
          controller: _titleController,
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                    label: Text("Amount"), prefixText: "€"),
                keyboardType: TextInputType.number,
                controller: _amountController,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(formatter.format(_selectDate)),
                  IconButton(
                    onPressed: _presentDatePicker,
                    icon: const Icon(Icons.calendar_month),
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            DropdownButton(
                value: _selectCategory,
                items: Category.values
                    .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name.toUpperCase()),
                        ))
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectCategory = value;
                  });
                }),
            const Spacer(),
            ElevatedButton(
                onPressed: _submitNewExpense, child: const Text("Save")),
            const SizedBox(width: 20),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Close"))
          ],
        )
      ]),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }
}
