import 'package:craft_bay/ui/getx/product_controller.dart';
import 'package:craft_bay/ui/widgets/product_item_preview_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../getx/bottom_navitgation_controller.dart';

class ProductListScreen extends StatefulWidget {
  final String categoryId, categoryName;

  const ProductListScreen(
      {Key? key, required this.categoryId, required this.categoryName})
      : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  ProductController controller = Get.put(ProductController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getProductByCategory(widget.categoryId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          "All Products",
          style: TextStyle(color: Colors.black54),
        ),
      ),
      body: GetBuilder<ProductController>(builder: (controller) {
        if (controller.productByCategoryInProgress) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if ((controller.productByCategoryModel.data!.length) == 0) {
          return Center(
            child: Text("No Products"),
          );
        } else {
          return GridView.builder(
            padding: EdgeInsets.only(top: 10),
            itemCount: controller.productByCategoryModel.data!.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 2/3),
            itemBuilder: (content, index) {
              return ProductItemPreviewCard(
                productData: controller.productByCategoryModel.data![index],
              );
            },
          );
        }
      }),
    );
  }
}
