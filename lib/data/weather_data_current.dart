import 'package:flutter_weather_getx_app/models/current_model.dart';

class WeatherDataCurrent {
  final CurrentModel current;

  WeatherDataCurrent({required this.current});

  // from json
  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) {
    return WeatherDataCurrent(current: CurrentModel.fromJson(json));
  }
}
