import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/counter_controller.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen({super.key});

  final controller = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
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
