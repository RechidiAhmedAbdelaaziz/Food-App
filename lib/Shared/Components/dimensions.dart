import 'package:get/get.dart';

class Dimensions {
  // ignore: empty_constructor_bodies
  static double screenHeight() => Get.height;
  static double screenWidth() => Get.width;
}

double getWidth(double widht) {
  return Dimensions.screenWidth() / 393 * widht;
}

double getHeight(double height) {
  return Dimensions.screenHeight() / 804 * height;
}

double squarSize(double size) {
  return getWidth(size);
}
