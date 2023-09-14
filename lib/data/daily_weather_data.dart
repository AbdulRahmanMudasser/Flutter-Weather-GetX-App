import 'package:flutter_weather_getx_app/models/daily_weather_model.dart';

class DailyWeatherData {
  final List<DailyWeatherModel> daily;

  DailyWeatherData({required this.daily});

  // from json
  factory DailyWeatherData.fromJson(Map<String, dynamic> json) {
    return DailyWeatherData(
      daily: List<DailyWeatherModel>.from(
        json['list'].map(
          (e) => DailyWeatherModel.fromJson(e),
        ),
      ),
    );
  }
}
