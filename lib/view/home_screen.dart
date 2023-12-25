import 'package:flutter/material.dart';

import '../model/category_model.dart';
import '../model/product_model.dart';
import '../widget/category_item.dart';
import '../widget/header_app.dart';
import '../widget/product_item.dart';
import '../widget/search_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      body: SafeArea(
        child: ListView(
          children: [
            HeaderApp(),
            searchStyle(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < listCategory.length; i++)
                    CategoryItem(
                      model: listCategory[i],
                    )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8, top: 20, right: 8),
              child: Row(
                children: [
                  Text(
                    'All Product',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 10, right: 8),
              child: SizedBox(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 15,
                  shrinkWrap: true,
                  primary: false,
                  childAspectRatio: 1 / 1.75,
                  children: List.generate(
                    listProduct.length,
                    (index) => productItem(
                      context,
                      listProduct[index],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
