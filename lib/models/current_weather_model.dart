import 'package:flutter_weather_getx_app/models/weather_model.dart';
import 'package:flutter_weather_getx_app/models/wind_model.dart';

import 'cloud_model.dart';

class CurrentWeatherModel {
  double temp;
  // int pressure;
  int humidity;
  double feelsLike;
  double uvIndex;
  WeatherModel weather;
  CloudModel clouds;
  WindModel wind;

  CurrentWeatherModel({
    required this.temp,
    // required this.pressure,
    required this.humidity,
    required this.feelsLike,
    this.uvIndex = 0.0,
    required this.weather,
    required this.clouds,
    required this.wind,
  });

  // from json
  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
      temp: json['main']['temp'].toDouble(),
      // pressure: json['main']['pressure'].toInt(),
      humidity: json['main']['humidity'].toInt(),
      feelsLike: json['main']['feels_like'].toDouble(),
      weather: WeatherModel.fromJson(json['weather'][0]),
      clouds: CloudModel.fromJson(json['clouds']),
      wind: WindModel.fromJson(json['wind']),
    );
  }

  // to json
  Map<String, dynamic> toJson() {
    return {
      'temp': temp,
      // 'pressure': pressure,
      'humidity': humidity,
      'feels_like': feelsLike,
      'weather': weather.toJson(),
      'clouds': clouds.toJson(),
      'wind': wind.toJson(),
    };
  }
}
