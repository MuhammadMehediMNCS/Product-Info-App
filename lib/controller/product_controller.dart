import 'package:get/get.dart';
import 'package:product_info/model/products.dart';
import 'package:product_info/model/purchased_product.dart';
import 'package:product_info/model/sold_product.dart';

class ProductController extends GetxController {
  var productList = <Products>[].obs;
  var soldProductList = <SoldProduct>[].obs;
  var purchasedProductList = <PurchasedProduct>[].obs;

  // Add Products
  void addProduct(Products products) {
    productList.add(products);
  }

  // Edit Products with Leading
   void updateProduct(int index, Products updatedProduct) {
    productList[index] = updatedProduct;
    productList.refresh();
  }

  // Add Sold Product
  void addSoldProduct(SoldProduct soldProduct) {
    soldProductList.add(soldProduct);
  }

  // Add Purchased Product
  void addPurchasedProduct(PurchasedProduct purchasedProduct) {
    purchasedProductList.add(purchasedProduct);
  }
}
