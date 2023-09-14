import 'package:flutter/material.dart';
import 'package:flutter_weather_getx_app/config/app_assets.dart';
import 'package:flutter_weather_getx_app/config/app_size.dart';
import 'package:flutter_weather_getx_app/data/current_weather_data.dart';

import 'small_card.dart';
import 'temperature_area.dart';

class CurrentWeather extends StatelessWidget {
  final CurrentWeatherData currentWeatherData;

  const CurrentWeather({super.key, required this.currentWeatherData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // current day time and temperature
        TemperatureArea(current: currentWeatherData.current),

        SizedBox(
          height: AppSize.baseSize * 3,
        ),

        // current wind speed, clouds and humidity
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: AppSize.baseSize * 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmallCard(
                leadingText: currentWeatherData.current.wind.speed.toString(),
                icon: AppAssets.windSpeed,
                suffixText: " m/s",
              ),
              SmallCard(
                leadingText: currentWeatherData.current.clouds.all.toString(),
                icon: AppAssets.clouds,
              ),
              SmallCard(
                leadingText: currentWeatherData.current.humidity.toString(),
                icon: AppAssets.humidity,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
