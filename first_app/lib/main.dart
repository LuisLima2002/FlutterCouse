import 'package:flutter/material.dart';
import 'package:first_app/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          colors: [
            Color.fromRGBO(76, 175, 80, 1),
            Color.fromRGBO(255, 235, 59, 1)
          ],
        ),
      ),
    ),
  );
}
