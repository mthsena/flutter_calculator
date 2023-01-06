import 'package:flutter/material.dart';

import 'calculator_button_grid_widget.dart';
import 'calculator_color.dart';
import 'calculator_controller.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({
    super.key,
    required this.controller,
  });

  final CalculatorController controller;

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(CalculatorColor.primaryBlack),
      body: Center(
        child: Container(
          width: 480,
          height: 674,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.white24,
            ),
          ),
          clipBehavior: Clip.hardEdge,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    color: Colors.red,
                    onPressed: () {},
                    icon: const Icon(Icons.circle),
                  ),
                  IconButton(
                    color: Colors.orange,
                    onPressed: () {},
                    icon: const Icon(Icons.circle),
                  ),
                  IconButton(
                    color: Colors.green,
                    onPressed: () {},
                    icon: const Icon(Icons.circle),
                  ),
                ],
              ),
              AnimatedBuilder(
                animation: widget.controller,
                builder: (context, child) {
                  return Container(
                    height: 170,
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.bottomRight,
                    child: FittedBox(
                      child: Text(
                        widget.controller.output,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Theme.of(context).textTheme.displayLarge?.fontSize,
                        ),
                      ),
                    ),
                  );
                },
              ),
              Expanded(
                child: CalculatorButtonGridWidget(
                  buttons: widget.controller.buttons,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
