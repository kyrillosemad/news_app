import 'package:get/get.dart';

class CHANGE extends GetxController {
  bool isDark = false;

  changeMode() {
    isDark = !isDark;
    update();
  }
}
