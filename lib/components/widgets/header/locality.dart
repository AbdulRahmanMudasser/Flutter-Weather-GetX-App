import 'package:flutter/material.dart';

import '../../../config/app_size.dart';

class Locality extends StatelessWidget {
  const Locality({
    super.key,
    required this.locality,
  });

  final String locality;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Text(
        locality,
        style: TextStyle(
          fontSize: AppSize.baseSize * 3.3,
        ),
      ),
    );
  }
}