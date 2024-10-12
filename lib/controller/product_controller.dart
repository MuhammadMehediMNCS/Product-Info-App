import 'package:get/get.dart';
import 'package:product_info/model/products.dart';

class ProductController extends GetxController {
  var productList = <Products>[].obs;

  // Add Products
  void addProduct(Products products) {
    productList.add(products);
  }

  // Edit Products with Leading
   void updateProduct(int index, Products updatedProduct) {
    productList[index] = updatedProduct;
    productList.refresh();
  }
}