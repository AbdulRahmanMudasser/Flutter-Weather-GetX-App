import 'package:flutter/material.dart';
import 'package:flutter_weather_getx_app/components/widgets/daily%20weather/daily_weather.dart';
import 'package:flutter_weather_getx_app/components/widgets/footer/footer.dart';
import 'package:flutter_weather_getx_app/components/widgets/hourly%20weather/hourly_weather.dart';
import 'package:flutter_weather_getx_app/config/app_assets.dart';
import 'package:flutter_weather_getx_app/config/app_colors.dart';
import 'package:flutter_weather_getx_app/data/weather_data.dart';
import 'package:get/get.dart';

import '../components/widgets/current weather/current_weather.dart';
import '../components/widgets/header/header.dart';
import '../config/app_size.dart';
import '../controllers/global_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // call global controller or inject dependency
  // dependency injection is just calling a class instance
  // in another class
  GlobalController globalController = Get.put(
    GlobalController(),
    permanent: true,
    // permanent is set to true, which means that this controller will not
    // be destroyed when current page is removed
  );

  final AppSize appSizeController = Get.put(AppSize());

  @override
  Widget build(BuildContext context) {
    appSizeController.init();

    return Scaffold(
      body: SafeArea(
        child: Obx(
          () {
            WeatherData weatherData = globalController.getWeatherData();

            return globalController.checkLoading().isTrue
                ? Center(
                    child: Image.asset(
                      AppAssets.clouds,
                      height: AppSize.baseSize * 22,
                      width: AppSize.baseSize * 22,
                    ),
                  )
                : ListView(
                    children: [
                      SizedBox(
                        height: AppSize.baseSize * 1.3,
                      ),

                      // header
                      const Header(),

                      // current weather
                      CurrentWeather(
                        currentWeatherData: weatherData.getCurrentWeatherData(),
                      ),

                      SizedBox(
                        height: AppSize.baseSize * 2,
                      ),

                      // hourly weather
                      HourlyWeather(
                        hourlyWeatherData: weatherData.getHourlyWeatherData(),
                      ),

                      SizedBox(
                        height: AppSize.baseSize * 2,
                      ),

                      // daily weather
                      DailyWeather(
                        dailyWeatherData: weatherData.getDailyWeatherData(),
                      ),

                      SizedBox(
                        height: AppSize.baseSize * 3,
                      ),

                      // footer
                      Footer(
                        currentWeatherData: weatherData.getCurrentWeatherData(),
                      ),

                      SizedBox(
                        height: AppSize.baseSize * 2,
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
