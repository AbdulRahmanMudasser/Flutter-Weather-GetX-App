import 'package:flutter_weather_getx_app/api/fetch_weather.dart';
import 'package:flutter_weather_getx_app/data/weather_data.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class GlobalController extends GetxController {
  // declares variables
  final RxBool _isLoading = true.obs; // checks whether the data is loaded or not
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  final weatherData = WeatherData().obs;

  // instance for them to be called
  // or you can say getters
  RxBool checkLoading() => _isLoading;

  RxDouble getLatitude() => _latitude;

  RxDouble getLongitude() => _longitude;

  @override
  void onInit() {
    super.onInit();

    if (_isLoading.isTrue) {
      getLocation();
    }
  }

  getLocation() async {
    bool isServiceEnabled;
    PermissionStatus permissionStatus;
    LocationPermission locationPermission;

    // check for the location service is enabled or not
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    // return if service is not enabled
    if (!isServiceEnabled) {
      // we will ask the user to turn the location on and save in permissionStatus
      permissionStatus = await Permission.locationWhenInUse.status;

      // check whether the user has denied the permission permanently
      if (permissionStatus == PermissionStatus.permanentlyDenied) {
        return Future.error("Turning Location On Service Permanently Denied");
      } else if (permissionStatus == PermissionStatus.denied) {
        // then request for the permission again
        permissionStatus = await Permission.locationWhenInUse.status;

        // check if the user denied the permission again
        if (permissionStatus == PermissionStatus.denied) {
          return Future.error("Turning Location On Service Denied");
        }
      }
    }

    // check for location permission
    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location Permission Denied Forever");
    } else if (locationPermission == LocationPermission.denied) {
      // then request for the permission again
      locationPermission = await Geolocator.requestPermission();

      // check if the user denied the permission again
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location Permission is Denied");
      }
    }

    // get current location/position
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      // then update the value of longitude and latitude
      _longitude.value = value.longitude;
      _latitude.value = value.latitude;

      return FetchWeatherAPI().processData(value.longitude, value.latitude).then((value) {
        weatherData.value = value;

        // set the check for loading to false
        _isLoading.value = false;
      });
    });
  }
}
