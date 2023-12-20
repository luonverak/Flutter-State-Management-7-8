import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt counter = 0.obs;
  void increase() {
    counter.value++;
  }

  void decrease() {
    counter.value--;
  }

  Future mode() async {
    Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
    update();
  }
}
