import 'package:flutter/material.dart';

import 'calculator/calculator_controller.dart';
import 'calculator/calculator_page.dart';
import 'main/main_widget.dart';

void main() {
  runApp(
    MainWidget(
      title: 'Flutter Calculator',
      child: CalculatorPage(
        controller: CalculatorController(),
      ),
    ),
  );
}
