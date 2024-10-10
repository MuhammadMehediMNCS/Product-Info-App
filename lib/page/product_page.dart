import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_info/controller/product_controller.dart';
import 'package:product_info/screen/add_product_screen.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ProductController productController = Get.find<ProductController>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          itemCount: productController.productList.length,
          itemBuilder: (context, index) {
            final product = productController.productList[index];

            return Card(
              child: ListTile(
                leading: IconButton(
                  onPressed: () {},
                  icon: Image.asset('images/edit.png', height: 18.0, width: 18.0,)
                ),
                title: Text(product.name ?? 'No Name'),
                titleTextStyle: const TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),
                subtitle: Text(product.size ?? 'Empty'),
                subtitleTextStyle: const TextStyle(color: Colors.grey, fontSize: 12.0),
                trailing: Text(product.total ?? '0'),
                leadingAndTrailingTextStyle: const TextStyle(color: Colors.indigo, fontSize: 18.0, fontWeight: FontWeight.bold),
                onTap: () {},
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {
          Get.to(const AddProductScreen());
        },
        child: const Icon(
          Icons.add_shopping_cart,
          color: Colors.white
        )
      ),
    );
  }
}