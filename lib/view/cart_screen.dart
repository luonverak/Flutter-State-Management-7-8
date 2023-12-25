import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stat_management/controller/product_cotroller.dart';

import '../widget/cart_item.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Item'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.cartList.length,
          itemBuilder: (context, index) => itemCart(
            context,
            controller.cartList[index],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.red,
          ),
          alignment: Alignment.center,
          child: const Text(
            'Total : ',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
