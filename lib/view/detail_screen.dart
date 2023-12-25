import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:stat_management/controller/product_cotroller.dart';

import '../model/product_model.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({super.key, required this.model});
  final ProductModel model;
  final controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height / 2,
                  child: Image.asset(
                    model.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 5,
                  right: 5,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Obx(
                        () => GestureDetector(
                          onTap: () {
                            model.favorite.value = !model.favorite.value;
                          },
                          child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: (model.favorite.value == false)
                                ? const Icon(
                                    Icons.favorite_border,
                                    color: Colors.white,
                                    size: 30,
                                  )
                                : const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 30,
                                  ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Price ${model.price} \$',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueAccent,
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                model.counter.value <= 1
                                    ? model.counter.value
                                    : model.counter.value--;
                              },
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                            Obx(
                              () => Text(
                                '${model.counter.value}',
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                model.counter.value++;
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'All Size',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < model.size.length; i++)
                          Padding(
                            padding: const EdgeInsets.only(right: 15, top: 5),
                            child: CircleAvatar(
                              child: Text(model.size[i]),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Detail of product',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ReadMoreText(
                    model.description,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontSize: 16),
                    trimLines: 3,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    lessStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    moreStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18.0),
        child: GestureDetector(
          onTap: () async => controller.addCart(model),
          child: Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.pink[400],
            ),
            alignment: Alignment.center,
            child: const Text(
              'Add to cart',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
