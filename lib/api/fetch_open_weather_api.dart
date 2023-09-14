import 'dart:convert';

import 'package:flutter_weather_getx_app/data/current_weather_data.dart';
import 'package:flutter_weather_getx_app/data/hourly_weather_data.dart';
import 'package:flutter_weather_getx_app/data/weather_data.dart';
import 'package:http/http.dart' as http;

import '../components/methods/api_url.dart';

class FetchOpenWeatherAPI {
  WeatherData? _weatherData;

  // processing the data from response -> json
  Future<WeatherData> processData(latitude, longitude) async {
    // send a request to server for weather
    var currentWeatherResponse = await http.get(Uri.parse(apiUrl("weather", latitude, longitude)));

    // send a request to server for hourly forecast
    var hourlyWeatherResponse = await http.get(Uri.parse(apiUrl("forecast", latitude, longitude)));

    // decode the current weather response body
    var jsonCurrentWeatherDecodedResponse = jsonDecode(currentWeatherResponse.body);

    // decode the hourly weather response body
    var jsonHourlyWeatherDecodedResponse = jsonDecode(hourlyWeatherResponse.body);

    // only for debugging
    // print(jsonHourlyWeatherDecodedResponse);

    // send the json decoded body to weather data current class' method fromJson()
    _weatherData = WeatherData(
      CurrentWeatherData.fromJson(jsonCurrentWeatherDecodedResponse),
      HourlyWeatherData.fromJson(jsonHourlyWeatherDecodedResponse),
    );

    return _weatherData!;
  }
}
