import 'package:flutter/cupertino.dart';
import 'package:flutter_weather_getx_app/api/fetch_open_weather_api.dart';
import 'package:flutter_weather_getx_app/data/weather_data.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class GlobalController extends GetxController {
  // declares variables
  final RxBool _isLoading = true.obs;   // checks whether the data is loaded or not
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  final weatherData = WeatherData().obs;

  WeatherData getWeatherData() {
    return weatherData.value;
  }

  final RxInt _currentIndex = 0.obs;    // for changing the card color

  RxInt getCurrentIndex() {
    return _currentIndex;
  }

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
    } else {
      getCurrentIndex();
    }
  }

  getLocation() async {
    bool isServiceEnabled;
    // PermissionStatus permissionStatus;
    PermissionWithService permission;
    LocationPermission locationPermission;

    // check for the location service is enabled or not
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    // return if service is not enabled
    if (!isServiceEnabled) {
      // we will ask the user to turn the location on and save in permissionStatus
      // permissionStatus = await Permission.locationWhenInUse.status;

      permission = Permission.locationWhenInUse;

      // check whether the user has denied the permission permanently
      if (permission.status == PermissionStatus.permanentlyDenied) {
        return Future.error("Turning Location-On Service Permanently Denied");
      } else if (permission.status == PermissionStatus.denied) {
        // then request for the permission again
        permission = Permission.locationWhenInUse;

        // check if the user denied the permission again
        if (permission.status == PermissionStatus.denied) {
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

      debugPrint("Longitude ${value.longitude}");
      debugPrint("Latitude ${value.latitude}");

      return FetchOpenWeatherAPI().processData(value.latitude, value.longitude).then((value) {
        weatherData.value = value;

        // set the check for loading to false
        _isLoading.value = false;
      });
    });
  }
}
