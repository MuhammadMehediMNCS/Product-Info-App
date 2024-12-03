import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_info/controller/product_controller.dart';
import 'package:product_info/screen/saller_intro_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pdf/widgets.dart' as pw;

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
          /*
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
          ) */
          IconButton(
  onPressed: () async {
    // Check if there is data to export
    if (productController.soldProductList.isEmpty) {
      Get.snackbar("Info", "No data to export.");
      return;
    }

    // Request storage permission
    if (!await Permission.storage.request().isGranted) {
      Get.snackbar("Error", "Storage permission is required to export the PDF.");
      return;
    }

    try {
      // Get external storage directory
      final Directory? externalDir = await getExternalStorageDirectory();
      if (externalDir == null) {
        Get.snackbar("Error", "Unable to access storage.");
        return;
      }

      // Define folder and file paths
      final Directory folder = Directory('${externalDir.path}/Shapahar Hardware');
      final File file = File('${folder.path}/sale_memo.pdf');

      // Create folder if it doesn't exist
      if (!await folder.exists()) {
        await folder.create(recursive: true);
      }

      // Generate PDF content
      final pdf = pw.Document();
      final sallerAddress = productController.sallerAddress.value;

      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('বিসমিল্লাহির রাহমানির রাহিম', style: pw.TextStyle(fontSize: 10)),
                pw.Text('সাপাহার হার্ডওয়ার', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
                pw.Text('প্রোঃ মোঃ আজিজুল হাকিম (আজিজ)', style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 10),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('নাম : ${sallerAddress.name ?? "................"}'),
                    pw.Text('তারিখ : ${sallerAddress.date ?? "................"}'),
                  ],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('ঠিকানা : ${sallerAddress.area ?? "................"}'),
                    pw.Text('মোবাইল : ${sallerAddress.contact ?? "................"}'),
                  ],
                ),
                pw.SizedBox(height: 10),
                pw.Table.fromTextArray(
                  headers: ['বিবরণ', 'সাইজ', 'পরিমাণ', 'দর', 'হার %', 'টাকা'],
                  data: productController.soldProductList.map((product) {
                    return [
                      product.productName ?? 'No Name',
                      product.productSize ?? 'N/A',
                      product.soldAmount ?? '0',
                      product.price ?? '0',
                      product.percent ?? '0%',
                      product.totalPrice ?? '0'
                    ];
                  }).toList(),
                  cellAlignment: pw.Alignment.center,
                ),
                pw.SizedBox(height: 20),
                pw.Text('বিক্রিত মাল ফেরত হয় না।', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              ],
            );
          },
        ),
      );

      // Save PDF to file
      await file.writeAsBytes(await pdf.save());

      // Clear the data after saving
      productController.sallerAddress.update((val) {
        val?.name = null;
        val?.date = null;
        val?.area = null;
        val?.contact = null;
      });
      productController.soldProductList.clear();

      Get.snackbar("Success", "PDF exported successfully at ${file.path}");
    } catch (e) {
      Get.snackbar("Error", "Failed to export PDF: $e");
    }
  },
  icon: const Icon(Icons.file_download_outlined),
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
            Obx(() {
              final sallerAddress = productController.sallerAddress.value;

              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .50,
                        child: Text('নাম : ${sallerAddress.name ?? "................"}', style: const TextStyle(fontFamily: 'TiroBangla-Regular'))
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .40,
                        child: Text('তারিখ : ${sallerAddress.date ?? "................"}', style: const TextStyle(fontFamily: 'TiroBangla-Regular'))
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context). size.width * .50,
                        child: Text('ঠিকানা : ${sallerAddress.area ?? "................"}', style: const TextStyle(fontFamily: 'TiroBangla-Regular'))
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .40,
                        child: Text('মোবাইল : ${sallerAddress.contact ?? "................"}', style: const TextStyle(fontFamily: 'TiroBangla-Regular'))
                      ),
                    ],
                  ),
                ],
              );
            }),
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
                          child: Center(child: Text(soldProduct.productName ?? "No Name", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)))
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .10,
                          child: Center(child: Text(soldProduct.productSize ?? "N/A", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)))
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .10,
                          child: Center(child: Text(soldProduct.soldAmount ?? "0", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)))
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .15,
                          child: Center(child: Text(soldProduct.price ?? "0", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)))
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .10,
                          child: Center(child: Text(soldProduct.percent ?? "0%", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)))
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .20,
                          child: Center(child: Text(soldProduct.totalPrice ?? "0", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)))
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
    );
  }
}
