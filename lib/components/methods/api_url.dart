import '../../api/api_key.dart';

String apiUrl(String type, latitude, longitude) {
  String url =
      "https://api.openweathermap.org/data/2.5/$type?lat=$latitude&lon=$longitude&appid=$apiKey";

  // units are in metric like temperature in celsius
  // String url =
  //     "https://api.openweathermap.org/data/2.5/$type?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric";

  return url;
}
