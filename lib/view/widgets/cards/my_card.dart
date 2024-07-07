
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final Color color;
  final Widget child;

  const MyCard({super.key, required this.color, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
