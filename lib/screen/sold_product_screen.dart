import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_info/controller/product_controller.dart';
import 'package:product_info/model/sold_product.dart';
import 'package:product_info/widget/button_widget.dart';
import 'package:product_info/widget/text_field_widget.dart';

class SoldProductScreen extends StatefulWidget {
  final String? productName;
  final String? productSize;
  final String? totalProduct;
  final int index;

  const SoldProductScreen({
    super.key,
    required this.productName,
    required this.productSize,
    required this.totalProduct,
    required this.index,
  });

  @override
  State<SoldProductScreen> createState() => _SoldProductScreenState();
}

class _SoldProductScreenState extends State<SoldProductScreen> {
  TextEditingController totalController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController percentController = TextEditingController();
  TextEditingController totalAmountController = TextEditingController();

  final ProductController productController = Get.find<ProductController>();

  @override
  void initState() {
    super.initState();

    totalController.text = widget.totalProduct ?? "0";
  }

  void calculateTotalAmount() {
    double amount = double.tryParse(amountController.text) ?? 0;
    double price = double.tryParse(priceController.text) ?? 0;
    double percent = double.tryParse(percentController.text) ?? 0;

    double totalAmount = amount * price;
    if (percent > 0) {
      totalAmount -= (totalAmount * percent / 100);
    }

    totalAmountController.text = totalAmount.toStringAsFixed(2);
  }

  void onConfirmSale() {
    int totalProducts = int.tryParse(totalController.text) ?? 0;
    int soldAmount = int.tryParse(amountController.text) ?? 0;

    int remainingProducts = totalProducts - soldAmount;
    if (remainingProducts < 0) {
      Get.snackbar("Error", "Sold amount cannot exceed total products.");
      return;
    }

    var updatedProduct = productController.productList[widget.index];
    updatedProduct.total = remainingProducts.toString();
    productController.updateProduct(widget.index, updatedProduct);

    SoldProduct soldProduct = SoldProduct(
      productName: widget.productName,
      productSize: widget.productSize,
      soldAmount: amountController.text,
      price: priceController.text,
      totalPrice: totalAmountController.text,
      percent: percentController.text,
    );
    productController.addSoldProduct(soldProduct);

    Navigator.popUntil(context, ModalRoute.withName('/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.productName ?? "No Name",
              style: const TextStyle(fontFamily: 'TiroBangla-Regular', fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6.0),
            Text(
              widget.productSize ?? "No Size",
              style: const TextStyle(color: Colors.grey, fontFamily: 'TiroBangla-Regular', fontSize: 10.0, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      title: "মোট পণ্য :",
                      controller: totalController,
                      keyboard: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 8),
                  Expanded(
                    child: TextFieldWidget(
                      title: "পরিমাণ :",
                      controller: amountController,
                      keyboard: TextInputType.number,
                      onChanged: (value) => calculateTotalAmount(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18.0),
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      title: "দর :",
                      controller: priceController,
                      keyboard: TextInputType.number,
                      onChanged: (value) => calculateTotalAmount(),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 8),
                  Expanded(
                    child: TextFieldWidget(
                      title: "পারসেন্ট :",
                      controller: percentController,
                      keyboard: TextInputType.number,
                      onChanged: (value) => calculateTotalAmount(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18.0),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextFieldWidget(
                    title: 'টাকা :',
                    controller: totalAmountController,
                    keyboard: TextInputType.number,
                    enabled: false,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .2),
              ButtonWidget(
                title: 'নিশ্চিত',
                onPressed: onConfirmSale,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
