import 'package:craft_bay/ui/getx/bottom_navitgation_controller.dart';
import 'package:craft_bay/ui/getx/product_controller.dart';
import 'package:craft_bay/ui/screens/cartsScreen.dart';
import 'package:craft_bay/ui/screens/homeScreen.dart';
import 'package:craft_bay/ui/screens/product_list_screen.dart';
import 'package:craft_bay/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/categorylist_controller.dart';
import '../getx/home_controller.dart';
import 'product_category_screen.dart';

class MainNavigationBar extends StatefulWidget {
  const MainNavigationBar({Key? key}) : super(key: key);

  @override
  State<MainNavigationBar> createState() => _MainNavigationBarState();
}

class _MainNavigationBarState extends State<MainNavigationBar> {
  BottomNavigationController controller = Get.put(BottomNavigationController());

  HomeController homeController = Get.put(HomeController());
  CategoryListController categoryListController =
      Get.put(CategoryListController());
  ProductController productController = Get.put(ProductController());

  final List<Widget> screens = const [
    HomeScreen(),
    ProductCategoryScreen(),
    CartsScreen(),

  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      homeController.getProductSliderList();
      categoryListController.getCategories();
      productController.getPopularProduct();
      productController.getSpecialProduct();
      productController.getNewProduct();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BottomNavigationController>(
        builder: (_) {
          return screens[controller.selectedIndex];
        },
      ),
      bottomNavigationBar: GetBuilder<BottomNavigationController>(builder: (_) {
        return BottomNavigationBar(
          currentIndex: controller.selectedIndex,
          selectedItemColor: AppColor.primaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          onTap: (index) {
            controller.changeIndex(index);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: "Categories"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(Icons.card_giftcard), label: "Wish"),
          ],
        );
      }),
    );
  }
}
