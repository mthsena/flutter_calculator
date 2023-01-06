import 'calculator_input.dart';
import 'operator/calculator_operator.dart';

class Calculator {
  num lastOperand = 0;
  bool get hasLastOperand => lastOperand != 0;
  CalculatorOperator? lastOperator;
  bool get hasLastOperator => lastOperator != null;
  List<CalculatorInput> inputs = [CalculatorInput.zero];
  num get currentOperand => num.parse(inputs.map((e) => e.value).join());

  void setLastOperand([num? operand]) => lastOperand = operand ?? 0;

  void setLastOperator([CalculatorOperator? operator]) => lastOperator = operator;

  void setInputs([List<CalculatorInput>? inputs]) => this.inputs = inputs ?? [CalculatorInput.zero];

  void clearAll() {
    setLastOperand();
    setLastOperator();
    setInputs();
  }

  void addInput(CalculatorInput input) {
    if (inputs.contains(CalculatorInput.dot) && input.isDot) return;
    inputs.add(input);
    if (!inputs.contains(CalculatorInput.dot) && inputs.first.isZero) {
      inputs.remove(inputs.first);
    }
  }

  void addInputsFromText(String text) {
    setInputs();
    text.split('').map(CalculatorInput.fromValue).forEach(addInput);
  }

  void inverseInput() {
    if (inputs.first.isSubtract) {
      inputs.removeAt(0);
    } else {
      inputs.insert(0, CalculatorInput.subtract);
    }
  }

  Future<num> calculate(num firstOperand, CalculatorOperator? operator, num secondOperand) async {
    final currentOperator = operator ?? lastOperator;
    if (currentOperator != null && hasLastOperand && hasLastOperator) {
      return await currentOperator.calculate(firstOperand, secondOperand);
    }
    return currentOperand;
  }

  Future<num> percent(CalculatorInput input, CalculatorOperator? operator) async {
    if (!hasLastOperand && !hasLastOperator) return currentOperand;
    final percentResult = await calculate(lastOperand, operator, currentOperand);
    final result = await calculate(lastOperand, lastOperator, percentResult);
    setLastOperand(result);
    setLastOperator();
    setInputs();
    addInputsFromText(result.toString());
    return result;
  }

  Future<num> equal(CalculatorInput input, CalculatorOperator? operator) async {
    if (!hasLastOperand && !hasLastOperator) return currentOperand;
    final result = await calculate(lastOperand, lastOperator, currentOperand);
    setLastOperand(result);
    setLastOperator();
    setInputs();
    addInputsFromText(result.toString());
    return result;
  }

  Future<num> operate(CalculatorInput input, CalculatorOperator? operator) async {
    if (!hasLastOperand && !hasLastOperator) {
      setLastOperand(currentOperand);
      setLastOperator(operator);
      setInputs();
      return lastOperand;
    }
    final result = await calculate(lastOperand, lastOperator, currentOperand);
    setLastOperand(result);
    setLastOperator(operator);
    setInputs();
    return result;
  }
}
