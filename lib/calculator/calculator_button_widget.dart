import 'package:flutter/material.dart';

class CalculatorButtonWidget extends StatelessWidget {
  const CalculatorButtonWidget({
    super.key,
    required this.text,
    required this.color,
    required this.onTap,
  });

  final String text;
  final Color color;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: Theme.of(context).textTheme.displaySmall?.fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
