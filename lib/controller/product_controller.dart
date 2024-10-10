import 'package:get/get.dart';
import 'package:product_info/model/products.dart';

class ProductController extends GetxController {
  var productList = <Products>[].obs;

  void addProduct(Products products) {
    productList.add(products);
  }
}