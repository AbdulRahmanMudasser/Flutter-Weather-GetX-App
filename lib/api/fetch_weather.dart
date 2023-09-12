import 'dart:convert';

import 'package:flutter_weather_getx_app/api/api_key.dart';
import 'package:flutter_weather_getx_app/data/weather_data.dart';
import 'package:flutter_weather_getx_app/data/weather_data_current.dart';
import 'package:http/http.dart' as http;

class FetchWeatherAPI {
  WeatherData? _weatherData;

  // processing the data from response -> json
  Future<WeatherData> processData(latitude, longitude) async {
    // send a request to server
    var response = await http.get(Uri.parse(_apiUrl(latitude, longitude)));

    // decode the response body
    var jsonDecodedResponse = jsonDecode(response.body);

    // send the json decoded body to weather data current class' method fromJson()
    _weatherData = WeatherData(WeatherDataCurrent.fromJson(jsonDecodedResponse));

    return _weatherData!;
  }

  String _apiUrl(latitude, longitude) {
    String url =
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey";

    return url;
  }
}
