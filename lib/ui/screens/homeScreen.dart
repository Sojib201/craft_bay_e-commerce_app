import 'package:craft_bay/ui/getx/bottom_navitgation_controller.dart';
import 'package:craft_bay/ui/getx/categorylist_controller.dart';
import 'package:craft_bay/ui/getx/home_controller.dart';
import 'package:craft_bay/ui/getx/product_controller.dart';
import 'package:craft_bay/ui/screens/product_list_screen.dart';
import 'package:craft_bay/ui/widgets/home/home_banner_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/category_item_widget.dart';
import '../widgets/home/section_header.dart';
import '../widgets/product_item_preview_card.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: SvgPicture.asset("assets/images/logo_nav.svg"),
        actions: [
          CircleAvatar(
            child: Icon(
              Icons.person,
              color: Colors.grey.shade700,
            ),
            radius: 16,
            backgroundColor: Colors.grey.shade200,
          ),
          SizedBox(
            width: 5,
          ),
          CircleAvatar(
            child: Icon(
              Icons.call,
              color: Colors.grey.shade700,
            ),
            radius: 16,
            backgroundColor: Colors.grey.shade200,
          ),
          SizedBox(
            width: 5,
          ),
          CircleAvatar(
            child: Icon(
              Icons.notifications,
              color: Colors.grey.shade700,
            ),
            radius: 16,
            backgroundColor: Colors.grey.shade200,
          ),
          SizedBox(
            width: 5,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              GetBuilder<HomeController>(builder: (homecontroller) {
                if (homecontroller.getProductSliderInProgress) {
                  return CircularProgressIndicator();
                } else {
                  return HomeBannerSlider(
                    productSliderModel: homecontroller.productSliderModel,
                  );
                }
              }),
              SectionHeader(
                headername: "All Categories",
                onTapSeeAll: () {
                  bottomNavigationController.changeIndex(1);
                },
              ),
              GetBuilder<CategoryListController>(
                  builder: (categoryListController) {
                if (categoryListController.getCategoryInProgress) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return SizedBox(
                    height: 100,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categoryListController
                            .categoryListModel.data!.length,
                        itemBuilder: (context, index) {
                          return CategoryItemWidget(
                            categoryItemName: categoryListController
                                    .categoryListModel
                                    .data![index]
                                    .categoryName ??
                                "",
                            image: categoryListController.categoryListModel
                                    .data![index].categoryImg ??
                                "",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductListScreen(
                                      categoryName: categoryListController
                                              .categoryListModel
                                              .data![index]
                                              .categoryName ??
                                          "",
                                      categoryId:
                                          "${categoryListController.categoryListModel.data![index].id ?? 1}"),
                                ),
                              );
                            },
                          );
                        }),
                  );
                }
              }),
              SizedBox(
                height: 16,
              ),
              SectionHeader(
                headername: "Popular",
                onTapSeeAll: () {},
              ),
              GetBuilder<ProductController>(builder: (productController) {
                if (productController.popuparInProgress) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return SizedBox(
                    height: 160,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productController
                                .popularProductModel.data?.length ??
                            0,
                        itemBuilder: (context, index) {
                          return ProductItemPreviewCard(
                            productData: productController
                                .popularProductModel.data![index],
                          );
                        }),
                  );
                }
              }),
              SizedBox(
                height: 16,
              ),
              SectionHeader(
                headername: "Special",
                onTapSeeAll: () {},
              ),
              GetBuilder<ProductController>(builder: (productController) {
                if (productController.specialInProgress) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return SizedBox(
                    height: 160,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productController
                                .specialProductModel.data?.length ??
                            0,
                        itemBuilder: (context, index) {
                          return ProductItemPreviewCard(
                            productData: productController
                                .specialProductModel.data![index],
                          );
                        }),
                  );
                }
              }),
              SizedBox(
                height: 16,
              ),
              SectionHeader(
                headername: "New",
                onTapSeeAll: () {},
              ),
              GetBuilder<ProductController>(builder: (productController) {
                if (productController.newInProgress) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return SizedBox(
                    height: 160,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            productController.newProductModel.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          return ProductItemPreviewCard(
                            productData:
                                productController.newProductModel.data![index],
                          );
                        }),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
