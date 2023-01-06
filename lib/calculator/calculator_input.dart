enum CalculatorInput {
  clean('AC'),
  inverse('+/-'),
  percent('%'),
  divide('÷'),
  seven('7'),
  eight('8'),
  nine('9'),
  multiply('x'),
  four('4'),
  five('5'),
  six('6'),
  subtract('-'),
  one('1'),
  two('2'),
  three('3'),
  add('+'),
  zero('0'),
  pi('π'),
  dot('.'),
  equal('=');

  const CalculatorInput(
    this.value,
  );

  final String value;

  factory CalculatorInput.fromValue(String value) {
    return CalculatorInput.values.firstWhere((e) => e.value == value);
  }

  bool get isSubtract => CalculatorInput.fromValue(value) == subtract;
  bool get isZero => CalculatorInput.fromValue(value) == zero;
  bool get isDot => CalculatorInput.fromValue(value) == dot;
  bool get isEqual => CalculatorInput.fromValue(value) == equal;
}
