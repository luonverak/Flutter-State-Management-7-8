import 'package:get/get.dart';
import 'package:stat_management/model/product_model.dart';

class ProductController extends GetxController {
  late RxList<ProductModel> cartList = <ProductModel>[].obs;

  Future addCart(ProductModel model) async {
    try {
      cartList.add(model);
      Get.snackbar('Success', 'Product add to cart');
    } catch (e) {
      print(e);
    }
    update();
  }

  Future deleteCart(ProductModel model) async {
    try {
      cartList.remove(model);
      Get.snackbar('Success', 'Product remove from cart');
    } catch (e) {
      print(e);
    }
    update();
  }
}
