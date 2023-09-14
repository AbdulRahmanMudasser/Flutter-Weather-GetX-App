import 'package:flutter_weather_getx_app/models/hourly_weather_model.dart';

class HourlyWeatherData {
  // we will go with this because we have to fetch all the list of data
  // not just one index of a list
  final List<HourlyWeatherModel> hourly;

  // below line is commented because this approach is best when we have
  // to fetch only one data from the list
  // final HourlyWeatherModel hourly;

  HourlyWeatherData({required this.hourly});

  // from json
  factory HourlyWeatherData.fromJson(Map<String, dynamic> json) {
    return HourlyWeatherData(
      hourly: List<HourlyWeatherModel>.from(
        json['list'].map(
          (e) => HourlyWeatherModel.fromJson(e),
        ),
      ),
    );
  }

  // another approach to achieve the same work as above one
  // factory HourlyWeatherData.fromJson(Map<String, dynamic> json) {
  //   return HourlyWeatherData(
  //     hourly: (json['hourly'] as List)
  //         .map((items) => HourlyWeatherModel.fromJson(items as Map<String, dynamic>))
  //         .toList(),
  //   );
  // }

  // below approach is best when we only have to fetch onlu index or one
  // data from the list
  // factory HourlyWeatherData.fromJson(Map<String, dynamic> json) {
  //   return HourlyWeatherData(
  //     hourly: HourlyWeatherModel.fromJson(json),
  //   );
  // }
}
