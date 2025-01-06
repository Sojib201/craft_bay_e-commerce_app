import 'package:craft_bay/ui/getx/bottom_navitgation_controller.dart';
import 'package:craft_bay/ui/getx/categorylist_controller.dart';
import 'package:craft_bay/ui/screens/product_list_screen.dart';
import 'package:craft_bay/ui/widgets/category_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCategoryScreen extends StatefulWidget {
  const ProductCategoryScreen({Key? key}) : super(key: key);

  @override
  State<ProductCategoryScreen> createState() => _ProductCategoryScreenState();
}

class _ProductCategoryScreenState extends State<ProductCategoryScreen> {
  BottomNavigationController controller = Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            controller.changeIndex(0);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          "Categories",
          style: TextStyle(color: Colors.black54),
        ),
      ),
      body: GetBuilder<CategoryListController>(
        builder: (categoryListController) {
          if (categoryListController.getCategoryInProgress) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                categoryListController.getCategories();
              },
              child: GridView.builder(
                itemCount:
                    categoryListController.categoryListModel.data!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (content, index) {
                  return CategoryItemWidget(
                    categoryItemName: categoryListController
                            .categoryListModel.data![index].categoryName ??
                        "",
                    image: categoryListController
                            .categoryListModel.data![index].categoryImg ??
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
                },
              ),
            );
          }
        },
      ),
    );
  }
}
