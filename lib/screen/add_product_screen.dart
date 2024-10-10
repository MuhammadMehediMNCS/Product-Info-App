import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_info/controller/product_controller.dart';
import 'package:product_info/model/products.dart';
import 'package:product_info/widget/button_widget.dart';
import 'package:product_info/widget/text_field_widget.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController productName = TextEditingController();
  TextEditingController totalProduct = TextEditingController();
  TextEditingController productSize = TextEditingController();
  
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('নতুন পণ্য'),
        titleTextStyle: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TextFieldWidget(
              title: 'পণ্যের নাম :',
              controller: productName
            ),
            const SizedBox(height: 24.0),
            SizedBox(
              height: 100.0,
              child: Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      title: 'মোট পণ্য',
                      controller: totalProduct
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * .2),
                  Expanded(
                    child: TextFieldWidget(
                      title: 'পণ্যের সাইজ',
                      controller: productSize
                    ),
                  ),
                ],
              ),
            ),
              ],
            ),
            ButtonWidget(
              title: 'নিশ্চিত করুন',
              onPressed: () {
                productController.addProduct(
                  Products(
                    name: productName.text.isNotEmpty ? productName.text : null,
                    total: totalProduct.text.isNotEmpty ? totalProduct.text : null,
                    size: productSize.text.isNotEmpty ? productSize.text : null,
                  ),
                );
                Get.back();
              }
            )
          ],
        ),
      ),
    );
  }
}