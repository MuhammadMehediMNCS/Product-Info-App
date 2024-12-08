import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_info/controller/product_controller.dart';
import 'package:product_info/page/purchased_memo_page.dart';
import 'package:product_info/page/sale_memo_page.dart';
import 'package:product_info/screen/add_product_screen.dart';
import 'package:product_info/screen/edit_product_screen.dart';
import 'package:product_info/screen/purchased_product_screen.dart';
import 'package:product_info/screen/sold_product_screen.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ProductController productController = Get.find<ProductController>();
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Obx(() {
            productController.productList.sort((a, b) => (a.name ?? '').compareTo(b.name ?? ''));
            
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              itemCount: productController.productList.length,
              itemBuilder: (context, index) {
                final product = productController.productList[index];
                
                return Card(
                  child: ListTile(
                    leading: IconButton(
                      onPressed: () {
                        Get.to(EditProductScreen(product: product));
                      },
                      icon: Image.asset('images/edit.png', height: 22.0, width: 22.0,)
                    ),
                    title: Text(product.name ?? 'No Name'),
                    titleTextStyle: const TextStyle(color: Colors.black, fontFamily: 'TiroBangla-Regular', fontSize: 16.0, fontWeight: FontWeight.bold),
                    subtitle: Text(product.size ?? 'No Size'),
                    subtitleTextStyle: const TextStyle(color: Colors.grey, fontFamily: 'TiroBangla-Regular', fontSize: 12.0),
                    trailing: Text(product.total ?? '0'),
                    leadingAndTrailingTextStyle: const TextStyle(color: Colors.indigo, fontSize: 18.0, fontWeight: FontWeight.bold),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Center(
                                child: SizedBox(
                                  width: 28.0,
                                  child: Divider(thickness: 4.0)
                                )
                              ),
                              const SizedBox(height: 16.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(SoldProductScreen(
                                          productName: product.name,
                                          productSize: product.size,
                                          totalProduct: product.total,
                                          index: index,
                                        ));
                                      },
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width /2,
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              'images/sale.png',
                                              height: 28.0,
                                              width: 28.0,
                                            ),
                                            const SizedBox(width: 12.0),
                                            const Text(
                                              'পণ্য বিক্রয়',
                                              style: TextStyle(
                                                fontFamily: 'TiroBangla-Regular',
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(const SaleMemoPage());
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          const Text(
                                            'বিক্রয় মেমো',
                                            style: TextStyle(
                                              fontFamily: 'TiroBangla-Regular',
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(width: 12.0),
                                          Image.asset(
                                            'images/recipe.png',
                                            height: 28.0,
                                            width: 28.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(PurchasedProductScreen(
                                          productName: product.name,
                                          productSize: product.size,
                                          totalProduct: product.total,
                                          index: index,
                                        ));
                                      },
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'images/buy.png',
                                            height: 28.0,
                                            width: 28.0,
                                          ),
                                          const SizedBox(width: 12.0),
                                          const Text(
                                            'পণ্য ক্রয়',
                                            style: TextStyle(
                                              fontFamily: 'TiroBangla-Regular',
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(const PurchasedMemoPage());
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          const Text(
                                            'ক্রয় মেমো',
                                            style: TextStyle(
                                              fontFamily: 'TiroBangla-Regular',
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(width: 12.0),
                                          Image.asset(
                                            'images/recipe.png',
                                            height: 28.0,
                                            width: 28.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.indigo,
          onPressed: () {
            Get.to(const AddProductScreen());
          },
          child: const Icon(
            Icons.add_shopping_cart,
            color: Colors.white
          )
        ),
      ),
    );
  }
}
