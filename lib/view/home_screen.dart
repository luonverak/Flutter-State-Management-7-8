import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stat_management/controller/counter_controller.dart';
import 'package:stat_management/view/second_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'.trArgs(['title'])),
        actions: [
          IconButton(
            onPressed: () {
              Get.snackbar('Hello ', 'Tos der lg');
            },
            icon: const Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {
              Get.updateLocale(
                Locale('kh', 'KHR'),
              );
            },
            icon: const Icon(Icons.language),
          ),
          IconButton(
            onPressed: () async => controller.mode(),
            icon: const Icon(Icons.dark_mode),
          ),
          IconButton(
            onPressed: () async => Get.to(SecondScreen()),
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
      body: Obx(
        () => Center(
          child: Text(
            '${controller.counter.value}',
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => controller.increase(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
