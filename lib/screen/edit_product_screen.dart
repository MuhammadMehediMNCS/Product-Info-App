import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_info/controller/product_controller.dart';
import 'package:product_info/model/products.dart';
import 'package:product_info/widget/button_widget.dart';
import 'package:product_info/widget/text_field_widget.dart';


class EditProductScreen extends StatefulWidget {
  final Products product;

  const EditProductScreen({super.key, required this.product});

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  late TextEditingController nameController;
  late TextEditingController totalController;
  late TextEditingController sizeController;
  late TextEditingController soldController;

  final ProductController productController = Get.find<ProductController>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.product.name);
    totalController = TextEditingController(text: widget.product.total);
    sizeController = TextEditingController(text: widget.product.size);
    soldController = TextEditingController(text: "");

    soldController.addListener(_updateRemainingTotal);
  }

  @override
  void dispose() {
    soldController.removeListener(_updateRemainingTotal);
    nameController.dispose();
    totalController.dispose();
    sizeController.dispose();
    soldController.dispose();
    super.dispose();
  }

  void _updateRemainingTotal() {
    try {
      int total = int.tryParse(widget.product.total ?? "0") ?? 0;
      int sold = int.tryParse(soldController.text) ?? 0;
      int remaining = total - sold;

      totalController.text = remaining.toString();
    } catch (e) {
      totalController.text = "0";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('এডিট করুন'),
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w700),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextFieldWidget(
                      title: 'পণ্যের নাম :',
                      controller: nameController,
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * .1),
                  Expanded(
                    flex: 2,
                    child: TextFieldWidget(
                      title: 'মোট পণ্য :',
                      controller: totalController,
                      enabled: false,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      title: 'পণ্যের সাইজ :',
                      controller: sizeController,
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * .2),
                  Expanded(
                    child: TextFieldWidget(
                      title: 'বিক্রি পণ্য :',
                      controller: soldController,
                      keyboard: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .2),
              ButtonWidget(
                title: 'নিশ্চিত',
                onPressed: () {
                  widget.product.name = nameController.text;
                  widget.product.total = totalController.text;
                  widget.product.size = sizeController.text;
          
                  productController.productList.refresh();
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
