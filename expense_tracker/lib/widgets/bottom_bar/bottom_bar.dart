import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key, required this.onFilter});

  final void Function(List<DateTime> filteredDates) onFilter;

  @override
  State<BottomBar> createState() {
    return _BottomBarState();
  }
}

final formatteryM = DateFormat.yM();

class _BottomBarState extends State<BottomBar> {
  _BottomBarState() : _selectButtons = List.filled(12, false);

  final List<bool> _selectButtons;

  final List<DateTime> months = List.generate(
    12,
    (index) => DateTime.now().add(Duration(days: index * 30)),
  );

  final List<DateTime> _selectedMonths = [];

  void _onChangeMonth() {
    for (int i = 0; i < _selectButtons.length; i++) {
      if (_selectedMonths.contains(months[i])) {
        _selectButtons[i] = true;
      } else {
        _selectButtons[i] = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                final firstMonth = months.first;
                for (int i = 0; i < months.length; i++) {
                  months[i] = firstMonth
                      .subtract(Duration(days: (months.length - 1 - i) * 30));
                }
                _onChangeMonth();
              });
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          ToggleButtons(
            onPressed: (int index) {
              setState(() {
                _selectButtons[index] = !_selectButtons[index];
                if (_selectButtons[index]) {
                  _selectedMonths.add(months[index]);
                } else {
                  _selectedMonths.remove(months[index]);
                }
                widget.onFilter(_selectedMonths);
              });
            },
            color: Colors.black.withOpacity(0.60),
            selectedColor: Color(0xFF6200EE),
            selectedBorderColor: Color(0xFF6200EE),
            fillColor: Color(0xFF6200EE).withOpacity(0.08),
            splashColor: Color(0xFF6200EE).withOpacity(0.12),
            hoverColor: Color(0xFF6200EE).withOpacity(0.04),
            constraints: const BoxConstraints(
              minHeight: 40.0,
              minWidth: 80.0,
            ),
            isSelected: _selectButtons,
            children:
                months.map((date) => Text(formatteryM.format(date))).toList(),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                final lastMonth = months.last;
                for (int i = 0; i < months.length; i++) {
                  months[i] = lastMonth.add(Duration(days: i * 30));
                }
                _onChangeMonth();
              });
            },
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          )
        ],
      ),
    );
  }
}
