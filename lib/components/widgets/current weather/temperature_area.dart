import 'package:flutter/material.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_size.dart';
import '../../../models/current_weather_model.dart';
import '../../methods/kelvin_to_celsius.dart';

class TemperatureArea extends StatelessWidget {
  const TemperatureArea({
    super.key,
    required this.current,
  });

  final CurrentWeatherModel current;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: AppSize.baseSize),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            "assets/weather/${current.weather.icon}.png",
            height: AppSize.baseSize * 9,
            width: AppSize.baseSize * 9,
          ),
          Container(
            height: AppSize.baseSize * 5.2,
            width: 1,
            color: AppColors.dividerLine,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "${kelvinToCelsius(current.temp).toStringAsFixed(0)}°",
                  style: TextStyle(
                    color: AppColors.textColorBlack,
                    fontWeight: FontWeight.w500,
                    fontSize: AppSize.baseSize * 6.7,
                  ),
                ),
                TextSpan(
                  text: "${current.weather.description}".toUpperCase(),
                  style: const TextStyle(
                    color: Colors.black38,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}