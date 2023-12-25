import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:stat_management/controller/product_cotroller.dart';
import 'package:stat_management/view/cart_screen.dart';

class HeaderApp extends StatelessWidget {
  HeaderApp({super.key});
  final controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 8, top: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu)),
          const Text(
            'Eldoria',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: () => Get.to(CartScreen()),
            child: badges.Badge(
              badgeContent: Obx(
                () => Text(
                  '${controller.cartList.length}',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              child: const Icon(
                Icons.shopping_cart,
                size: 26,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
