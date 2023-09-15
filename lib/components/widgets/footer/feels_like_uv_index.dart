import 'package:flutter/material.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_size.dart';
import '../../../data/current_weather_data.dart';
import '../../methods/kelvin_to_celsius.dart';

class FeelsLikeUvIndex extends StatelessWidget {
  const FeelsLikeUvIndex({
    super.key,
    required this.currentWeatherData,
  });

  final CurrentWeatherData currentWeatherData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Feels Like ${kelvinToCelsius(currentWeatherData.current.feelsLike).toStringAsFixed(2)}",
          style: TextStyle(
            fontSize: AppSize.baseSize * 1.6,
            color: AppColors.textColorBlack,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          height: AppSize.baseSize * 3,
          width: 1,
          color: AppColors.dividerLine,
        ),
        Text(
          "UV Index ${currentWeatherData.current.uvIndex}",
          style: TextStyle(
            fontSize: AppSize.baseSize * 1.6,
            color: AppColors.textColorBlack,
          ),
        ),
      ],
    );
  }
}