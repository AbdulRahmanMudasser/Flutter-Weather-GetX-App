import 'current_weather_data.dart';
import 'hourly_weather_data.dart';

class WeatherData {
  final CurrentWeatherData? current;
  final HourlyWeatherData? hourly;

  WeatherData([
    this.current,
    this.hourly,
  ]);

  // function to fetch current weather data
  CurrentWeatherData getCurrentWeatherData() {
    return current!;
  }

  // function to fetch hourly weather data
  HourlyWeatherData getHourlyWeatherData() {
    return hourly!;
  }
}
