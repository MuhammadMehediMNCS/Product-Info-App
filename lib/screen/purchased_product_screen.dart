import 'package:flutter/material.dart';
import 'package:product_info/widget/button_widget.dart';
import 'package:product_info/widget/text_field_widget.dart';

class PurchasedProductScreen extends StatefulWidget {
  const PurchasedProductScreen({super.key});

  @override
  State<PurchasedProductScreen> createState() => _PurchasedProductScreenState();
}

class _PurchasedProductScreenState extends State<PurchasedProductScreen> {
  TextEditingController totalController = TextEditingController();
  TextEditingController newController = TextEditingController();
  TextEditingController orderController = TextEditingController();
  TextEditingController dueController = TextEditingController();
  TextEditingController productController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mr. Twist Chips',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6.0),
            Text(
              '100 g',
              style: TextStyle(color: Colors.grey, fontSize: 10.0, fontWeight: FontWeight.bold),
            )
          ],
        )
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
                      controller: totalController
                    )
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 8),
                  Expanded(
                    child: TextFieldWidget(
                      title: "নতুন পণ্য :",
                      controller: newController
                    )
                  )
                ],
              ),
              const SizedBox(height: 18.0),
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      title: "অর্ডার পণ্য:",
                      controller: orderController
                    )
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 8),
                  Expanded(
                    child: TextFieldWidget(
                      title: "বাঁকি পণ্য :",
                      controller: dueController
                    )
                  )
                ],
              ),
              const SizedBox(height: 18.0),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextFieldWidget(
                    title: 'পাওয়া পণ্য :',
                    controller: productController
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .2),
              ButtonWidget(
                title: 'নিশ্চিত',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}