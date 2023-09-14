import 'package:flutter_weather_getx_app/data/daily_weather_data.dart';

import 'current_weather_data.dart';
import 'hourly_weather_data.dart';

class WeatherData {
  final CurrentWeatherData? current;
  final HourlyWeatherData? hourly;
  final DailyWeatherData? daily;

  WeatherData([
    this.current,
    this.hourly,
    this.daily,
  ]);

  // function to fetch current weather data
  CurrentWeatherData getCurrentWeatherData() {
    return current!;
  }

  // function to fetch hourly weather data
  HourlyWeatherData getHourlyWeatherData() {
    return hourly!;
  }

  // function to fetch daily weather data
  DailyWeatherData getDailyWeatherData() {
    return daily!;
  }
}
