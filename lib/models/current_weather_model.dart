import 'package:flutter_weather_getx_app/models/weather_model.dart';
import 'package:flutter_weather_getx_app/models/wind_model.dart';

import 'cloud_model.dart';

class CurrentWeatherModel {
  int temp;
  int pressure;
  int humidity;
  WeatherModel weather;
  CloudModel clouds;
  WindModel wind;

  CurrentWeatherModel({
    required this.temp,
    required this.pressure,
    required this.humidity,
    required this.weather,
    required this.clouds,
    required this.wind,
  });

  // from json
  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
      temp: json['main']['temp'].toInt(),
      pressure: json['main']['pressure'],
      humidity: json['main']['humidity'],
      weather: WeatherModel.fromJson(json['weather'][0]),
      clouds: CloudModel.fromJson(json['clouds']),
      wind: WindModel.fromJson(json['wind']),
    );
  }

  // to json
  Map<String, dynamic> toJson() {
    return {
      'temp': temp,
      'pressure': pressure,
      'humidity': humidity,
      'weather': weather.toJson(),
      'clouds': clouds.toJson(),
      'wind': wind.toJson(),
    };
  }
}
