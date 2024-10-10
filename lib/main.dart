import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_info/controller/product_controller.dart';
import 'package:product_info/page/calculator_page.dart';
import 'package:product_info/page/product_page.dart';

void main() {
  Get.put(ProductController());
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedindex = 0;

  final List<Widget> pages = [
    const ProductPage(),
    const CalculatorPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedindex,
        onTap: (index) {
          setState(() {
            selectedindex = index;
          });
        },
        backgroundColor: Colors.indigo,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedIconTheme: const IconThemeData(color: Colors.white),
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        items: [
          BottomNavigationBarItem(
            icon: ColorFiltered(
              colorFilter: ColorFilter.mode(
                selectedindex == 0 ? Colors.white : Colors.grey,
                BlendMode.srcIn,
              ),
              child: Image.asset('images/product.png', height: 24.0, width: 24.0),
            ),
            label: 'পণ্যের তথ্য',
          ),
          BottomNavigationBarItem(
            icon: ColorFiltered(
              colorFilter: ColorFilter.mode(
                selectedindex == 1 ? Colors.white : Colors.grey,
                BlendMode.srcIn,
              ),
              child: Image.asset('images/calculator.png', height: 24.0, width: 24.0),
            ),
            label: 'ক্যালকুলেটর',
          ),
        ],
      ),
    );
  }
}