import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_info/controller/product_controller.dart';

class SaleMemoPage extends StatefulWidget {

  const SaleMemoPage({super.key});

  @override
  State<SaleMemoPage> createState() => _SaleMemoPageState();
}

class _SaleMemoPageState extends State<SaleMemoPage> {
  final ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sales Memo"),
        actions: [
          IconButton(
            onPressed: () {
              if (productController.soldProductList.isNotEmpty) {
                productController.soldProductList.clear();
                Get.snackbar("Success", "All sale data has been deleted.");
              } else {
                Get.snackbar("Info", "No data to delete.");
              }
            }, 
            icon: const Icon(Icons.picture_as_pdf)
          )
        ],
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: productController.soldProductList.length,
          itemBuilder: (context, index) {
            var soldProduct = productController.soldProductList[index];
            return Column(
              children: [
                Text(soldProduct.productName ?? "No Name"),
                Text("Size: ${soldProduct.productSize ?? "N/A"}"),
                Text("Sold Amount: ${soldProduct.soldAmount}"),
                Text("Percent Discount: ${soldProduct.percent ?? "0"}%"),
                Text("Total Price: ${soldProduct.totalPrice}"),
              ],
            );
          },
        );
      }),
    );
  }
}
