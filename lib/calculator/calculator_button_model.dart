import 'calculator_input.dart';
import 'operator/calculator_operator.dart';

class CalculatorButtonModel {
  const CalculatorButtonModel({
    required this.color,
    required this.input,
    required this.action,
    this.operator,
  });

  final int color;
  final CalculatorInput input;
  final void Function(CalculatorInput, CalculatorOperator?) action;
  final CalculatorOperator? operator;
}
