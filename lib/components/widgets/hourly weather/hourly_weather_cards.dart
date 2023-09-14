import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_size.dart';
import '../../../controllers/global_controller.dart';
import '../../../data/hourly_weather_data.dart';
import 'hourly_weather_details.dart';

class HourlyWeatherCards extends StatelessWidget {
  HourlyWeatherCards({
    super.key,
    required this.hourlyWeatherData,
  });

  final HourlyWeatherData hourlyWeatherData;
  RxInt currentIndex = GlobalController().getCurrentIndex();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.only(left: AppSize.baseSize * 1.6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            hourlyWeatherData.hourly.length > 6 ? 6 : hourlyWeatherData.hourly.length,
            (index) => Obx(() {
              return GestureDetector(
                onTap: () {
                  currentIndex.value = index;
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 15),
                  padding: const EdgeInsets.all(15),
                  alignment: Alignment.center,
                  height: AppSize.baseSize * 16.2,
                  width: AppSize.baseSize * 11,
                  decoration: BoxDecoration(
                    // color: AppColors.cardColor,
                    color:
                        currentIndex.value == index ? const Color(0xff007ad9) : AppColors.cardColor,
                    borderRadius: BorderRadius.circular(15),
                    // boxShadow: [
                    //   BoxShadow(
                    //     offset: const Offset(0.5, 0),
                    //     blurRadius: 3,
                    //     spreadRadius: 1,
                    //     color: AppColors.dividerLine.withAlpha(150),
                    //   ),
                    // ],
                  ),
                  child: HourlyWeatherDetails(
                    hourly: hourlyWeatherData.hourly[index],
                    color: currentIndex.value == index ? Colors.white : AppColors.textColorBlack,
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
