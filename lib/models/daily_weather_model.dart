import 'package:flutter_weather_getx_app/models/weather_model.dart';

class DailyWeatherModel {
  int dt;
  double tempMin;
  double tempMax;
  WeatherModel weather;

  DailyWeatherModel({
    required this.dt,
    required this.tempMin,
    required this.tempMax,
    required this.weather,
  });

  // from json
  // we are following the below approach because it is suitable to fetch all the list
  factory DailyWeatherModel.fromJson(Map<String, dynamic> json) {
    return DailyWeatherModel(
      dt: json['dt'],
      tempMin: json['main']['temp_min'].toDouble(),
      tempMax: json['main']['temp_max'].toDouble(),
      weather: WeatherModel.fromJson(json['weather'][0]),
    );
  }

  // to json
  Map<String, dynamic> toJson() {
    return {
      'dt': dt,
      'temp_min': tempMin,
      'temp_max': tempMax,
      'weather': weather.toJson(),
    };
  }
}
