import 'package:flutter/material.dart';

import '../../../config/app_size.dart';

class TodayDate extends StatelessWidget {
  const TodayDate({
    super.key,
    required this.date,
  });

  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: AppSize.baseSize * 2,
      ),
      child: Text(
        date,
        style: TextStyle(
          fontSize: AppSize.baseSize * 1.5,
          height: 1.5,
          color: Colors.grey[700],
        ),
      ),
    );
  }
}