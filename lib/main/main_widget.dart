import 'package:flutter/material.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: child,
    );
  }
}
