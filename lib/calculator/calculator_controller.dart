import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'calculator.dart';
import 'calculator_button_model.dart';
import 'calculator_color.dart';
import 'calculator_input.dart';
import 'operator/calculator_operator.dart';
import 'operator/calculator_operator_add.dart';
import 'operator/calculator_operator_divide.dart';
import 'operator/calculator_operator_multiply.dart';
import 'operator/calculator_operator_percent.dart';
import 'operator/calculator_operator_subtract.dart';

class CalculatorController extends ChangeNotifier {
  final Calculator calculator = Calculator();

  String output = '0';

  late List<CalculatorButtonModel> buttons = [
    CalculatorButtonModel(color: CalculatorColor.secondaryBlack, input: CalculatorInput.clean, action: onClean),
    CalculatorButtonModel(color: CalculatorColor.secondaryBlack, input: CalculatorInput.inverse, action: onInverse),
    CalculatorButtonModel(color: CalculatorColor.secondaryBlack, input: CalculatorInput.percent, action: onPercent, operator: CalculatorOperatorPercent()),
    CalculatorButtonModel(color: CalculatorColor.primaryOrange, input: CalculatorInput.divide, action: onOperator, operator: CalculatorOperatorDivide()),
    CalculatorButtonModel(color: CalculatorColor.tertiaryBlack, input: CalculatorInput.seven, action: onInput),
    CalculatorButtonModel(color: CalculatorColor.tertiaryBlack, input: CalculatorInput.eight, action: onInput),
    CalculatorButtonModel(color: CalculatorColor.tertiaryBlack, input: CalculatorInput.nine, action: onInput),
    CalculatorButtonModel(color: CalculatorColor.primaryOrange, input: CalculatorInput.multiply, action: onOperator, operator: CalculatorOperatorMultiply()),
    CalculatorButtonModel(color: CalculatorColor.tertiaryBlack, input: CalculatorInput.four, action: onInput),
    CalculatorButtonModel(color: CalculatorColor.tertiaryBlack, input: CalculatorInput.five, action: onInput),
    CalculatorButtonModel(color: CalculatorColor.tertiaryBlack, input: CalculatorInput.six, action: onInput),
    CalculatorButtonModel(color: CalculatorColor.primaryOrange, input: CalculatorInput.subtract, action: onOperator, operator: CalculatorOperatorSubtract()),
    CalculatorButtonModel(color: CalculatorColor.tertiaryBlack, input: CalculatorInput.one, action: onInput),
    CalculatorButtonModel(color: CalculatorColor.tertiaryBlack, input: CalculatorInput.two, action: onInput),
    CalculatorButtonModel(color: CalculatorColor.tertiaryBlack, input: CalculatorInput.three, action: onInput),
    CalculatorButtonModel(color: CalculatorColor.primaryOrange, input: CalculatorInput.add, action: onOperator, operator: CalculatorOperatorAdd()),
    CalculatorButtonModel(color: CalculatorColor.tertiaryBlack, input: CalculatorInput.zero, action: onInput),
    CalculatorButtonModel(color: CalculatorColor.tertiaryBlack, input: CalculatorInput.dot, action: onInput),
    CalculatorButtonModel(color: CalculatorColor.tertiaryBlack, input: CalculatorInput.pi, action: onPi),
    CalculatorButtonModel(color: CalculatorColor.primaryOrange, input: CalculatorInput.equal, action: onEqual),
  ];

  void setOutput([String? output]) {
    this.output = output ?? '0';
    notifyListeners();
  }

  void onClean(CalculatorInput input, CalculatorOperator? operator) {
    calculator.clearAll();
    setOutput();
  }

  void onInverse(CalculatorInput input, CalculatorOperator? operator) {
    calculator.inverseInput();
    setOutput(calculator.currentOperand.toString());
  }

  void onPercent(CalculatorInput input, CalculatorOperator? operator) async {
    final result = await calculator.percent(input, operator);
    setOutput(result.toString());
  }

  void onInput(CalculatorInput input, CalculatorOperator? operator) async {
    calculator.addInput(input);
    setOutput(calculator.currentOperand.toString());
  }

  void onOperator(CalculatorInput input, CalculatorOperator? operator) async {
    final result = await calculator.operate(input, operator);
    setOutput(result.toString());
  }

  void onPi(CalculatorInput input, CalculatorOperator? operator) async {
    calculator.clearAll();
    calculator.addInputsFromText(math.pi.toString());
    setOutput(calculator.currentOperand.toString());
  }

  void onEqual(CalculatorInput input, CalculatorOperator? operator) async {
    final result = await calculator.equal(input, operator);
    setOutput(result.toString());
  }
}
