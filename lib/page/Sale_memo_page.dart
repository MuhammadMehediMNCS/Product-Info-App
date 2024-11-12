import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_info/controller/product_controller.dart';
import 'package:product_info/screen/saller_intro_screen.dart';

class SaleMemoPage extends StatefulWidget {

  const SaleMemoPage({super.key});

  @override
  State<SaleMemoPage> createState() => _SaleMemoPageState();
}

class _SaleMemoPageState extends State<SaleMemoPage> {
  final ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("বিক্রয় মেমো"),
        titleTextStyle: const TextStyle(fontFamily: 'TiroBangla-Regular', fontSize: 18.0, fontWeight: FontWeight.bold),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(const SallerIntroScreen());
            },
            icon: const Icon(Icons.person)
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
                    width: MediaQuery.of(context).size.width * .30,
                    child: const Center(child: Text('বিবরণ', style: TextStyle(fontFamily: 'TiroBangla-Regular', fontWeight: FontWeight.bold))),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .10,
                    child: const Center(child: Text('সাইজ', style: TextStyle(fontFamily: 'TiroBangla-Regular', fontWeight: FontWeight.bold))),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .10,
                    child: const Center(child: Text('পরিমাণ', style: TextStyle(fontFamily: 'TiroBangla-Regular', fontWeight: FontWeight.bold))),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .15,
                    child: const Center(child: Text('দর', style: TextStyle(fontFamily: 'TiroBangla-Regular', fontWeight: FontWeight.bold))),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .10,
                    child: const Center(child: Text('হার %', style: TextStyle(fontFamily: 'TiroBangla-Regular', fontWeight: FontWeight.bold))),
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
                  itemCount: productController.soldProductList.length,
                  itemBuilder: (context, index) {
                    var soldProduct = productController.soldProductList[index];
              
                    return Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .30,
                          child: Center(child: Text(soldProduct.productName ?? "No Name"))
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .10,
                          child: Center(child: Text(soldProduct.productSize ?? "N/A"))
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .10,
                          child: Center(child: Text(soldProduct.soldAmount ?? "0"))
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .15,
                          child: Center(child: Text(soldProduct.price ?? "0"))
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .10,
                          child: Center(child: Text(soldProduct.percent ?? "0%"))
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .20,
                          child: Center(child: Text(soldProduct.totalPrice ?? "0"))
                        ),
                      ],
                    );
                  }
                );
              }),
            ),
            const Text('বিক্রিত মাল ফেরত হয় না।', style: TextStyle(fontFamily: 'TiroBangla-Regular', fontWeight: FontWeight.bold)),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .20,
                child: const Text('বিক্রেতার স্বাক্ষর', style: TextStyle(fontFamily: 'TiroBangla-Regular', fontWeight: FontWeight.bold))
              )
            ),
            const SizedBox(height: 20.0)
          ],
        ),
      )
      /*Obx(() {
        return ListView.builder(
          itemCount: productController.soldProductList.length,
          itemBuilder: (context, index) {
            var soldProduct = productController.soldProductList[index];
            
            return Column(
              children: [
                Text(soldProduct.productName ?? "No Name"),
                Text("Size: ${soldProduct.productSize ?? "N/A"}"),
                Text("Sold Amount: ${soldProduct.soldAmount}"),
                Text("Percent Discount: ${soldProduct.percent ?? "0"}%"),
                Text("Total Price: ${soldProduct.totalPrice}"),
              ],
            );
          },
        );
      }),*/
    );
  }
}
