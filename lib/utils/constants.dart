import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

   static double getHeight(double h) {
    double heightRatio = screenHeight / h;
    return screenHeight / heightRatio;
  }

   static double getWidth(double w) {
    double widthRatio = screenWidth / w;
    return screenWidth / widthRatio;
  }
}
