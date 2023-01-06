import 'calculator_operator.dart';

class CalculatorOperatorPercent implements CalculatorOperator {
  @override
  Future<num> calculate(num firstOperand, num secondOperand) async {
    return firstOperand * secondOperand / 100;
  }
}
