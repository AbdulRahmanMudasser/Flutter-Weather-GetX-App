import 'package:flutter/material.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_size.dart';
import '../../../data/daily_weather_data.dart';
import '../../methods/get_next_day_name.dart';
import 'horizontal_card.dart';

class NextDaysList extends StatelessWidget {
  const NextDaysList({
    super.key,
    required this.dailyWeatherData,
  });

  final DailyWeatherData dailyWeatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              itemCount: dailyWeatherData.daily.length > 5 ? 5 : dailyWeatherData.daily.length,
              itemBuilder: (context, index) {
                int dataIndex = index * 8;

                // Ensure that the calculated index is within bounds
                if (dataIndex < dailyWeatherData.daily.length) {
                  final timeStamp = dailyWeatherData.daily[dataIndex].dt;
                  final dayName = getNextDayName(timeStamp);

                  return Column(
                    children: [
                      HorizontalCard(
                        dayName: dayName,
                        daily: dailyWeatherData.daily[dataIndex],
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
    );
  }
}