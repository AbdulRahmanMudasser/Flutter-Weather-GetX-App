import 'package:flutter/material.dart';
import 'package:flutter_weather_getx_app/components/methods/celsius_to_fahrenheit.dart';
import 'package:flutter_weather_getx_app/components/methods/get_next_day_name.dart';
import 'package:flutter_weather_getx_app/config/app_colors.dart';
import 'package:flutter_weather_getx_app/config/app_size.dart';
import 'package:flutter_weather_getx_app/data/daily_weather_data.dart';

class DailyWeather extends StatelessWidget {
  final DailyWeatherData dailyWeatherData;

  const DailyWeather({super.key, required this.dailyWeatherData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: AppSize.baseSize * 2),
          child: Text(
            "Next Days",
            style: TextStyle(
              fontSize: AppSize.baseSize * 2,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: AppSize.baseSize * 2,
        ),
        Container(
          height: 360,
          padding: EdgeInsets.all(AppSize.baseSize * 1.5),
          margin: EdgeInsets.symmetric(horizontal: AppSize.baseSize * 1.5),
          decoration: BoxDecoration(
            color: AppColors.dividerLine.withAlpha(150),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // next days

              Expanded(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5, // You want to display 5 items
                  itemBuilder: (context, index) {
                    int dataIndex = index * 8;

                    // Ensure that the calculated index is within bounds
                    if (dataIndex < dailyWeatherData.daily.length) {
                      final timeStamp = dailyWeatherData.daily[dataIndex].dt;
                      final dayName = getNextDayName(timeStamp);

                      return Column(
                        children: [
                          Container(
                            height: 55,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: AppSize.baseSize * 4,
                                  child: Text(
                                    "$dayName",
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
                                  "assets/weather/${dailyWeatherData.daily[dataIndex].weather.icon}.png",
                                  height: 40,
                                  width: 40,
                                ),
                                SizedBox(
                                  width: AppSize.baseSize * 9,
                                ),
                                Text(
                                  "${kelvinToCelsius(dailyWeatherData.daily[dataIndex].tempMax.ceil())}°/${kelvinToCelsius(dailyWeatherData.daily[dataIndex].tempMin.floor())}°",
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            color: AppColors.dividerLine,
                          )
                        ],
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
