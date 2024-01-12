import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';

var yLightScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

var yDarkScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 5, 99, 125));

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: yDarkScheme,
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: yDarkScheme.onPrimaryContainer,
            foregroundColor: yDarkScheme.primaryContainer),
        scaffoldBackgroundColor: yDarkScheme.background,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: yDarkScheme.primaryContainer,
            foregroundColor: yDarkScheme.onPrimaryContainer,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                foregroundColor: yDarkScheme.onBackground)),
        cardTheme: const CardTheme().copyWith(
          color: yDarkScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        bottomAppBarTheme: const BottomAppBarTheme()
            .copyWith(color: yDarkScheme.onPrimaryContainer),
        // textTheme: ThemeData().textTheme.copyWith(
        //       titleLarge: const TextStyle(fontWeight: FontWeight.bold),
        //     ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: yLightScheme,
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: yLightScheme.onPrimaryContainer,
            foregroundColor: yLightScheme.primaryContainer),
        scaffoldBackgroundColor: yLightScheme.background,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: yLightScheme.secondaryContainer,
              foregroundColor: yLightScheme.onSecondary),
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                foregroundColor: yLightScheme.onBackground)),
        cardTheme: const CardTheme().copyWith(
          color: yLightScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        bottomAppBarTheme:
            const BottomAppBarTheme().copyWith(color: yLightScheme.background),

        // textTheme: ThemeData().textTheme.copyWith(
        //       titleLarge: const TextStyle(fontWeight: FontWeight.bold),
        //     ),
      ),
      themeMode: ThemeMode.system,
      home: const Expenses(),
    ),
  );
}
