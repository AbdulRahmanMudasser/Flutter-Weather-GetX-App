import 'package:flutter/material.dart';
import 'package:flutter_weather_getx_app/config/app_size.dart';
import 'package:flutter_weather_getx_app/data/daily_weather_data.dart';

import 'next_days_list.dart';

class DailyWeather extends StatelessWidget {
  final DailyWeatherData dailyWeatherData;

  const DailyWeather({super.key, required this.dailyWeatherData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // next days text
        Padding(
          padding: EdgeInsets.only(left: AppSize.baseSize * 2),
          child: Text(
            "Next Days",
            style: TextStyle(
              fontSize: AppSize.baseSize * 2.1,
              // fontWeight: FontWeight.w500,
            ),
          ),
        ),

        SizedBox(
          height: AppSize.baseSize * 2,
        ),

        // next days list
        NextDaysList(dailyWeatherData: dailyWeatherData),
      ],
    );
  }
}




