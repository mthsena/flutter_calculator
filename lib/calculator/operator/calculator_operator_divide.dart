import 'calculator_operator.dart';

class CalculatorOperatorDivide implements CalculatorOperator {
  @override
  Future<num> calculate(num firstOperand, num secondOperand) async {
    return firstOperand / secondOperand;
  }
}
