import 'package:get/get.dart';

class CHANGE extends GetxController {
  bool is_dark = false;

  change_mode() {
    is_dark = !is_dark;
    update();
  }
}
