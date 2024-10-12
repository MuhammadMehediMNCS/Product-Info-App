import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_info/controller/product_controller.dart';
import 'package:product_info/model/products.dart';
import 'package:product_info/widget/text_field_widget.dart';

class EditProductScreen extends StatelessWidget {
  final Products product;
  final TextEditingController nameController;
  final TextEditingController totalController;
  final TextEditingController sizeController;

  EditProductScreen({super.key, required this.product})
      : nameController = TextEditingController(text: product.name),
        totalController = TextEditingController(text: product.total),
        sizeController = TextEditingController(text: product.size);

  final ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('এডিট করুন'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextFieldWidget(
                      title: 'পণ্যের নাম :',
                      controller: nameController
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * .2),
                  Expanded(
                    flex: 2,
                    child: TextFieldWidget(
                      title: 'মোট পণ্য :',
                      controller: totalController
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      title: 'পণ্যের সাইজ :',
                      controller: sizeController
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * .2),
                  Expanded(
                    child: TextFieldWidget(
                      title: 'বিক্রি পণ্য :',
                      controller: totalController
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                product.name = nameController.text;
                product.total = totalController.text;
                product.size = sizeController.text;

                productController.productList.refresh();
                Get.back();
              },
              child: const Text('নিশ্চিত'),
            ),
          ],
        ),
      ),
    );
  }
}
