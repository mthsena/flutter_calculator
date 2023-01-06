import 'calculator_operator.dart';

class CalculatorOperatorAdd implements CalculatorOperator {
  @override
  Future<num> calculate(num firstOperand, num secondOperand) async {
    return firstOperand + secondOperand;
  }
}
