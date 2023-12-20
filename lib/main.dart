import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/translation.dart';
import 'view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.native,
      translations: MyTranslations(),
      locale: const Locale('en', 'UK'),
      home: HomeScreen(),
    );
  }
}
