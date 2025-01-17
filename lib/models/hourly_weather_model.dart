import 'package:flutter_weather_getx_app/models/weather_model.dart';

class HourlyWeatherModel {
  int dt;
  double temp;
  WeatherModel weather;

  HourlyWeatherModel({
    required this.dt,
    required this.temp,
    required this.weather,
  });

  // from json
  // we are following the below approach because it is suitable to fetch all the list
  factory HourlyWeatherModel.fromJson(Map<String, dynamic> json) {
    return HourlyWeatherModel(
      dt: json['dt'].toInt(),
      temp: json['main']['temp'].toDouble(),
      weather: WeatherModel.fromJson(json['weather'][0]),
    );
  }

  // this approach is suitable when we only have to fetch just one index or data
  // factory HourlyWeatherModel.fromJson(Map<String, dynamic> json) {
  //   return HourlyWeatherModel(
  //     dt: json['list'][0]['dt'],
  //     dtText: json['list'][0]['dt_txt'],
  //     temp: json['list'][0]['main']['temp'].toInt(),
  //     weather: WeatherModel.fromJson(json['list'][0]['weather'][0]),
  //   );
  // }

  // to json
  Map<String, dynamic> toJson() {
    return {
      'dt': dt,
      'temp': temp,
      'weather': weather.toJson(),
    };
  }
}
