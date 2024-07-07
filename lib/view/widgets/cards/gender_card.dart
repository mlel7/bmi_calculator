
import 'package:bmi_claculator/view/widgets/cards/my_card.dart';
import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function()? onTap;
  final Color color;
  const GenderCard({super.key, required this.icon, required this.label, this.onTap, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        
        child: MyCard(
          color: color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 100,
                color: Colors.white,
              ),
              const SizedBox(height: 15),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 23,
                  color: Color(0xFF8D8E98),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
