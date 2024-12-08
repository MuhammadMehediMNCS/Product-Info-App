import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_info/controller/product_controller.dart';
import 'package:product_info/screen/buyer_intro_screen.dart';

class PurchasedMemoPage extends StatefulWidget {

  const PurchasedMemoPage({super.key});

  @override
  State<PurchasedMemoPage> createState() => _PurchasedMemoPageState();
}

class _PurchasedMemoPageState extends State<PurchasedMemoPage> {
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
            const Text('চৌমাশিয়া নওহাটার মোড় পেট্রোল পাম্পের দক্ষিণ পার্শ্বে, মহাদেবপুর, নওগাঁ।', style: TextStyle(fontFamily: 'TiroBangla-Regular', fontSize: 11.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10.0),
            Obx(() {
              final buyerAddress = productController.buyerAddress.value;

              return Column(
                children: [
                  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .50,
                  child: Text('নাম: ${buyerAddress.name ?? "................"}', style: const TextStyle(fontFamily: 'TiroBangla-Regular'))
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .40,
                  child: Text('তারিখ: ${buyerAddress.date ?? "................"}', style: const TextStyle(fontFamily: 'TiroBangla-Regular'))
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context). size.width * .50,
                  child: Text('ঠিকানা: ${buyerAddress.area ?? "................"}', style: const TextStyle(fontFamily: 'TiroBangla-Regular'))
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .40,
                  child: Text('মোবাইল: ${buyerAddress.contact ?? "................"}', style: const TextStyle(fontFamily: 'TiroBangla-Regular'))
                ),
              ],
            ),
                ],
              );
            }),
            const SizedBox(height: 10.0),
            Container(
              color: Colors.grey,
              child: const Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Center(child: Text('পণ্যের বিবরণ', style: TextStyle(fontFamily: 'TiroBangla-Regular', fontSize: 12.0, fontWeight: FontWeight.bold))),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(child: Text('সাইজ', style: TextStyle(fontFamily: 'TiroBangla-Regular', fontSize: 12.0, fontWeight: FontWeight.bold))),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(child: Text('অর্ডার', style: TextStyle(fontFamily: 'TiroBangla-Regular', fontSize: 12.0, fontWeight: FontWeight.bold))),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(child: Text('নতুন', style: TextStyle(fontFamily: 'TiroBangla-Regular', fontSize: 12.0, fontWeight: FontWeight.bold))),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(child: Text('বাঁকি', style: TextStyle(fontFamily: 'TiroBangla-Regular', fontSize: 12.0, fontWeight: FontWeight.bold))),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(child: Text('টাকা', style: TextStyle(fontFamily: 'TiroBangla-Regular', fontSize: 12.0, fontWeight: FontWeight.bold))),
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
                        Expanded(
                          flex: 3,
                          child: Center(child: Text(buyProduct.productName ?? "No Name", style: const TextStyle(fontSize: 10.0, fontWeight: FontWeight.w600)))
                        ),
                        Expanded(
                          flex: 2,
                          child: Center(child: Text(buyProduct.productSize ?? "N/A", style: const TextStyle(fontSize: 10.0, fontWeight: FontWeight.w600)))
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(child: Text(buyProduct.orderProduct ?? "0", style: const TextStyle(fontSize: 10.0, fontWeight: FontWeight.w600)))
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(child: Text(buyProduct.newProduct ?? "0", style: const TextStyle(fontSize: 10.0, fontWeight: FontWeight.w600)))
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(child: Text(buyProduct.dueProduct ?? "0", style: const TextStyle(fontSize: 10.0, fontWeight: FontWeight.w600)))
                        ),
                        Expanded(
                          flex: 2,
                          child: Center(child: Text(buyProduct.totalPrice ?? "0", style: const TextStyle(fontSize: 10.0, fontWeight: FontWeight.w600)))
                        ),
                      ],
                    );
                  }
                );
              }),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              width: MediaQuery.of(context).size.width * .84,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('বিক্রেতার স্বাক্ষর', style: TextStyle(fontFamily: 'TiroBangla-Regular', fontWeight: FontWeight.bold)),
                  Text('ক্রেতার স্বাক্ষর', style: TextStyle(fontFamily: 'TiroBangla-Regular', fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 12.0)
          ],
        ),
      )
    );
  }
}