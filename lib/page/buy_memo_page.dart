import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_info/controller/product_controller.dart';
import 'package:product_info/screen/buyer_intro_screen.dart';

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
        title: const Text("ক্রয় মেমো"),
        titleTextStyle: const TextStyle(fontFamily: 'TiroBangla-Regular', fontSize: 18.0, fontWeight: FontWeight.bold),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(const BuyerIntroScreen());
            },
            icon: const Icon(Icons.people)
          ),
          IconButton(
            onPressed: () {
              if (productController.soldProductList.isNotEmpty) {
                productController.soldProductList.clear();
                Get.snackbar("Success", "All sale data has been deleted.");
              } else {
                Get.snackbar("Info", "No data to delete.");
              }
            }, 
            icon: const Icon(Icons.file_download_outlined)
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Text('বিসমিল্লাহির রাহমানির রাহিম', style: TextStyle(fontFamily: 'TiroBangla-Regular', fontSize: 10.0)),
            const Text('সাপাহার হার্ডওয়ার', style: TextStyle(fontFamily: 'TiroBangla-Regular', fontSize: 18.0, fontWeight: FontWeight.bold)),
            const Text('প্রোঃ মোঃ আজিজুল হাকিম (আজিজ)', style: TextStyle(fontFamily: 'TiroBangla-Regular', fontWeight: FontWeight.bold)),
            const Text(
              'এখানে পিভিসি পাইপ ফিটিং, প্লাস্টিক সামগ্রী এবং ইলেকট্রিক ও\nহার্ডওয়্যার সামগ্রী খুচরা ও পাইকারী সুলভ মূল্যে পাওয়া যায়।',
              style: TextStyle(fontFamily: 'TiroBangla-Regular', fontSize: 12.0),
            ),
            const Text('বিঃ দ্রঃ শরিফ হোম অ্যাপ্লায়েন্স, বিআরবি, আরএফএল', style: TextStyle(fontFamily: 'TiroBangla-Regular', fontWeight: FontWeight.bold)),
            const Text('চৌমাশিয়া নওহাটার মোড় পেট্রোল পাম্পের দক্ষিণ পার্শ্বে, মহাদেবপুর, নওগাঁ।', style: TextStyle(fontFamily: 'TiroBangla-Regular', fontSize: 12.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.red,
                  width: MediaQuery.of(context).size.width * .50,
                  child: Text('নাম:.............')
                ),
                Container(
                  color: Colors.blue,
                  width: MediaQuery.of(context).size.width * .40,
                  child: Text('তারিখ:.............')
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context). size.width * .50,
                  child: Text('ঠিকানা:.............')
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .40,
                  child: Text('মোবাইল:.............')
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Container(
              color: Colors.grey,
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .25,
                    child: const Center(child: Text('পণ্যের বিবরণ', style: TextStyle(fontFamily: 'TiroBangla-Regular', fontWeight: FontWeight.bold))),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .10,
                    child: const Center(child: Text('সাইজ', style: TextStyle(fontFamily: 'TiroBangla-Regular', fontWeight: FontWeight.bold))),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .10,
                    child: const Center(child: Text('অর্ডার', style: TextStyle(fontFamily: 'TiroBangla-Regular', fontWeight: FontWeight.bold))),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .15,
                    child: const Center(child: Text('নতুন পণ্য', style: TextStyle(fontFamily: 'TiroBangla-Regular', fontWeight: FontWeight.bold))),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .15,
                    child: const Center(child: Text('বাঁকি পণ্য', style: TextStyle(fontFamily: 'TiroBangla-Regular', fontWeight: FontWeight.bold))),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .20,
                    child: const Center(child: Text('টাকা', style: TextStyle(fontFamily: 'TiroBangla-Regular', fontWeight: FontWeight.bold))),
                  )
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: productController.purchasedProductList.length,
                  itemBuilder: (context, index) {
                    var buyProduct = productController.purchasedProductList[index];
              
                    return Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .25,
                          child: Center(child: Text(buyProduct.productName ?? "No Name"))
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .10,
                          child: Center(child: Text(buyProduct.productSize ?? "N/A"))
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .10,
                          child: Center(child: Text(buyProduct.orderProduct ?? "0"))
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .15,
                          child: Center(child: Text(buyProduct.newProduct ?? "0"))
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .15,
                          child: Center(child: Text(buyProduct.dueProduct ?? "0"))
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .20,
                          child: Center(child: Text(buyProduct.totalPrice ?? "0"))
                        ),
                      ],
                    );
                  }
                );
              }),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('বিক্রেতার স্বাক্ষর', style: TextStyle(fontFamily: 'TiroBangla-Regular', fontWeight: FontWeight.bold)),
                Text('ক্রেতার স্বাক্ষর', style: TextStyle(fontFamily: 'TiroBangla-Regular', fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 20.0)
          ],
        ),
      )
    );
  }
}