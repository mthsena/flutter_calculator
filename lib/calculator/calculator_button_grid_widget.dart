import 'package:flutter/material.dart';

import 'calculator_button_model.dart';
import 'calculator_button_widget.dart';

class CalculatorButtonGridWidget extends StatelessWidget {
  const CalculatorButtonGridWidget({
    super.key,
    required this.buttons,
  });

  final List<CalculatorButtonModel> buttons;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        childAspectRatio: 1.3,
      ),
      itemCount: buttons.length,
      itemBuilder: (context, index) {
        final button = buttons.elementAt(index);
        return CalculatorButtonWidget(
          text: button.input.value,
          color: Color(button.color),
          onTap: () => button.action(button.input, button.operator),
        );
      },
    );
  }
}
