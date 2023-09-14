import 'package:flutter_weather_getx_app/models/current_weather_model.dart';

class CurrentWeatherData {
  final CurrentWeatherModel current;

  CurrentWeatherData({required this.current});

  // from json
  factory CurrentWeatherData.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherData(current: CurrentWeatherModel.fromJson(json));
  }
}
