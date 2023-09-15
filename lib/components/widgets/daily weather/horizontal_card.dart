import 'package:flutter/material.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_size.dart';
import '../../../models/daily_weather_model.dart';
import '../../methods/kelvin_to_celsius.dart';

class HorizontalCard extends StatelessWidget {
  const HorizontalCard({
    super.key,
    required this.dayName,
    required this.daily,
  });

  final String dayName;
  final DailyWeatherModel daily;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: AppSize.baseSize * 4,
            child: Text(
              dayName,
              style: const TextStyle(
                color: AppColors.textColorBlack,
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(
            width: AppSize.baseSize * 9,
          ),
          Image.asset(
            "assets/weather/${daily.weather.icon}.png",
            height: 40,
            width: 40,
          ),
          SizedBox(
            width: AppSize.baseSize * 9,
          ),
          Text(
            "${kelvinToCelsius(daily.tempMax.ceil()).toStringAsFixed(0)}°/${kelvinToCelsius(daily.tempMin.floor()).toStringAsFixed(0)}°",
          ),
        ],
      ),
    );
  }
}