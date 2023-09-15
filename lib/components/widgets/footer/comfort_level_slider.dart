import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_size.dart';
import '../../../data/current_weather_data.dart';

class ComfortLevelSlider extends StatelessWidget {
  const ComfortLevelSlider({
    super.key,
    required this.currentWeatherData,
  });

  final CurrentWeatherData currentWeatherData;

  @override
  Widget build(BuildContext context) {
    return SleekCircularSlider(
      min: 0,
      max: 100,
      initialValue: currentWeatherData.current.humidity.toDouble(),
      appearance: CircularSliderAppearance(
        size: AppSize.baseSize * 16,
        animationEnabled: true,
        infoProperties: InfoProperties(
          bottomLabelText: "Humidity",
          bottomLabelStyle: TextStyle(
            fontSize: AppSize.baseSize * 1.6,
            height: 1.5,
            letterSpacing: 0.1,
          ),
        ),
        customWidths: CustomSliderWidths(
          progressBarWidth: 14,
          trackWidth: 14,
        ),
        customColors: CustomSliderColors(
          trackColor: const Color(0xffd8e1e5),
          hideShadow: true,
          progressBarColors: [
            AppColors.firstGradientColor,
            AppColors.secondGradientColor,
          ],
          dotColor: Colors.transparent,
        ),
      ),
    );
  }
}