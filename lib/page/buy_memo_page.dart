import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_info/controller/product_controller.dart';

class BuyMemoPage extends StatefulWidget {

  const BuyMemoPage({super.key});

  @override
  State<BuyMemoPage> createState() => _BuyMemoPageState();
}

class _BuyMemoPageState extends State<BuyMemoPage> {
  final ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy Memo'),
        actions: [
          IconButton(
            onPressed: () {
              if(productController.purchasedProductList.isNotEmpty) {
                productController.purchasedProductList.clear();
                Get.snackbar("Success", "All sale data has been deleted.");
              } else {
                Get.snackbar("Info", "No data to delete.");
              }
            },
            icon: const Icon(Icons.delete) // Changed icon for delete action
          )
        ],
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: productController.purchasedProductList.length,
          itemBuilder: (context, index) {
            var buyProduct = productController.purchasedProductList[index];

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header row with column names
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    color: Colors.grey.shade300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Expanded(
                          flex: 2,
                          child: Text(
                            'পণ্যের বিবরণ', // Product Description
                            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'সাইজ', // Size
                            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'মোট পণ্য', // Total Product
                            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'নতুন পণ্য', // New Product
                            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'অর্ডার', // Order
                            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6.0),

                  // Data row with product details
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          buyProduct.productName ?? "No Name",
                          style: const TextStyle(fontSize: 14.0),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          buyProduct.productSize ?? "No Size",
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 14.0),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          buyProduct.totalProduct ?? "0",
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 14.0),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          buyProduct.newProduct ?? "0",
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 14.0),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          buyProduct.orderProduct ?? "0",
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 14.0),
                        ),
                      ),
                    ],
                  ),
                  const Divider(), // To separate items visually
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
