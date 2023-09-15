import 'package:flutter/material.dart';
import 'package:flutter_weather_getx_app/config/app_colors.dart';
import 'package:flutter_weather_getx_app/config/app_size.dart';
import 'package:flutter_weather_getx_app/data/current_weather_data.dart';

import '../../methods/kelvin_to_celsius.dart';
import 'comfort_level_slider.dart';
import 'feels_like_uv_index.dart';

class Footer extends StatelessWidget {
  final CurrentWeatherData currentWeatherData;

  const Footer({super.key, required this.currentWeatherData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // comfort level text
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.baseSize * 2),
          child: Text(
            "Comfort Level",
            style: TextStyle(
              fontSize: AppSize.baseSize * 2.1,
              // fontWeight: FontWeight.w500,
            ),
          ),
        ),

        SizedBox(
          height: AppSize.baseSize * 2,
        ),

        // comfort level or humidity
        ComfortLevelSlider(currentWeatherData: currentWeatherData),

        SizedBox(
          height: AppSize.baseSize,
        ),

        // feels like and uv index
        FeelsLikeUvIndex(currentWeatherData: currentWeatherData),
      ],
    );
  }
}


