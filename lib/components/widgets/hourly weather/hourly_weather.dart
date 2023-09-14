import 'package:flutter/material.dart';
import 'package:flutter_weather_getx_app/config/app_size.dart';
import 'package:flutter_weather_getx_app/data/hourly_weather_data.dart';

import 'hourly_weather_cards.dart';

class HourlyWeather extends StatelessWidget {
  final HourlyWeatherData hourlyWeatherData;

  HourlyWeather({super.key, required this.hourlyWeatherData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // today text
        Text(
          "Today",
          style: TextStyle(fontSize: AppSize.baseSize * 2),
        ),

        SizedBox(
          height: AppSize.baseSize * 2,
        ),

        // hourly forecasts
        HourlyWeatherCards(hourlyWeatherData: hourlyWeatherData),
      ],
    );
  }
}




