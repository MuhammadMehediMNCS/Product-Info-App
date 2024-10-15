import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_info/controller/product_controller.dart';

class SaleMemoPage extends StatelessWidget {
  final ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sales Memo"),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: productController.soldProductList.length,
          itemBuilder: (context, index) {
            var soldProduct = productController.soldProductList[index];
            return ListTile(
              title: Text(soldProduct.productName ?? "No Name"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Size: ${soldProduct.productSize ?? "N/A"}"),
                  Text("Sold Amount: ${soldProduct.soldAmount}"),
                  Text("Total Price: ${soldProduct.totalPrice}"),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
