import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:product_info/widget/text_field_widget.dart';

class BuyerIntroScreen extends StatefulWidget {
  const BuyerIntroScreen({super.key});

  @override
  State<BuyerIntroScreen> createState() => _BuyerIntroScreenState();
}

class _BuyerIntroScreenState extends State<BuyerIntroScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
void initState() {
  super.initState();
  
  dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ক্রেতার তথ্য'),
        titleTextStyle: const TextStyle(color: Colors.black, fontFamily: 'TiroBangla-Regular', fontSize: 18.0, fontWeight: FontWeight.bold),
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
                      title: "নাম :",
                      controller: nameController,
                    )
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 8),
                  Expanded(
                    child: TextFieldWidget(
                      title: "তারিখ :",
                      controller: dateController,
                    )
                  )
                ],
              ),
              const SizedBox(height: 18.0),
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      title: "ঠিকানা :",
                      controller: areaController,
                    )
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 8),
                  Expanded(
                    child: TextFieldWidget(
                      title: "মোবাইল :",
                      controller: phoneController,
                      keyboard: TextInputType.phone,
                    )
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}