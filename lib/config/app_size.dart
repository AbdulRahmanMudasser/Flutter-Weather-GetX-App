import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppSize extends GetxController {
  static late MediaQueryData _mediaQueryData;
  static late double screenHeight;
  static late double screenWidth;
  static late double baseSize;
  static Rx<Orientation> orientation = Orientation.portrait.obs;

  void init() {
    _mediaQueryData = Get.mediaQuery;
    screenHeight = _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;
    orientation.value = _mediaQueryData.orientation;
    baseSize =
        orientation.value == Orientation.landscape ? screenHeight * 0.024 : screenWidth * 0.024;
  }
}
