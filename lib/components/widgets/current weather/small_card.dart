import 'package:flutter/material.dart';

import '../../../config/app_colors.dart';

class SmallCard extends StatelessWidget {
  const SmallCard({
    super.key,
    required this.leadingText,
    required this.icon,
    this.suffixText = "%",
  });

  final String leadingText;
  final String icon;
  final String suffixText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset(icon),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "$leadingText$suffixText",
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black38,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}


