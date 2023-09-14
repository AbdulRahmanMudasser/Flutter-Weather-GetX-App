import 'package:flutter/material.dart';

import '../../../config/app_size.dart';
import '../../../models/hourly_weather_model.dart';
import '../../methods/celsius_to_fahrenheit.dart';
import '../../methods/timestamp_to_particular_format.dart';

class HourlyWeatherDetails extends StatelessWidget {
  const HourlyWeatherDetails({
    super.key,
    required this.hourly,
    required this.color,
  });

  final HourlyWeatherModel hourly;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // time stamp
        Text(
          timeStampToParticularFormat(hourly.dt),
          textAlign: TextAlign.center,
          style: TextStyle(color: color, fontWeight: FontWeight.w400, fontSize: 12),
        ),

        const SizedBox(
          height: 8,
        ),

        // day time
        Image.asset(
          "assets/weather/${hourly.weather.icon}.png",
          height: AppSize.baseSize * 5.5,
          width: AppSize.baseSize * 5.5,
        ),

        const SizedBox(
          height: 8,
        ),

        // temperature
        Text(
          "${kelvinToCelsius(hourly.temp)}°",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: color,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}