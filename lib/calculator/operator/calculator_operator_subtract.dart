import 'calculator_operator.dart';

class CalculatorOperatorSubtract implements CalculatorOperator {
  @override
  Future<num> calculate(num firstOperand, num secondOperand) async {
    return firstOperand - secondOperand;
  }
}
