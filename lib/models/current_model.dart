import 'package:flutter_weather_getx_app/models/weather_model.dart';
import 'package:flutter_weather_getx_app/models/wind_model.dart';

import 'cloud_model.dart';

class CurrentModel {
  double? temp;
  int? pressure;
  int? humidity;
  List<WeatherModel>? weather;
  CloudModel? clouds;
  WindModel? wind;

  CurrentModel({
    this.temp,
    this.pressure,
    this.humidity,
    this.weather,
    this.clouds,
    this.wind,
  });

  // from json
  factory CurrentModel.fromJson(Map<String, dynamic> json) {
    return CurrentModel(
      temp: json['temp'],
      pressure: json['pressure'],
      humidity: json['humidity'],
      weather: json['weather'] != null && json['weather'] is List
          ? (json['weather'] as List).map((e) => WeatherModel.fromJson(e)).toList()
          : null,
      clouds: json['clouds'] != null
          ? CloudModel.fromJson(json['clouds'] as Map<String, dynamic>)
          : null,
      wind: json['wind'] != null ? WindModel.fromJson(json['wind'] as Map<String, dynamic>) : null,
    );
  }

  // to json
  Map<String, dynamic> toJson() {
    return {
      'temp': temp,
      'pressure': pressure,
      'humidity': humidity,
      'weather': weather?.map((e) => e.toJson()).toList(),
      'clouds': clouds?.toJson(),
      'wind': wind?.toJson(),
    };
  }
}
