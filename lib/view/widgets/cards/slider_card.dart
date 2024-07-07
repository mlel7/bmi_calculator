import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SliderCard extends StatelessWidget {
  SliderCard({
    super.key,
    required this.color,
    required this.height,
    required this.onChanged,
  });
  Color? color;
  late int height;
  Function(double)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'HEIGHT',
          style: TextStyle(color: Color(0xFF8D8E98), fontSize: 18),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              height.toString(),
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            const Text(
              'cm',
              style: TextStyle(
                color: Color(0xFF8D8E98),
                fontSize: 18,
              ),
            ),
          ],
        ),
        Slider(
            value: height.toDouble(),
            min: 120.0,
            max: 220.0,
    
            onChanged: onChanged),
      ],
    );
  }
}
