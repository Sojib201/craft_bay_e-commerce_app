import 'package:craft_bay/data/models/product_details_model.dart';
import 'package:craft_bay/ui/getx/bottom_navitgation_controller.dart';
import 'package:craft_bay/ui/getx/product_details_controller.dart';
import 'package:craft_bay/ui/screens/review_screen.dart';
import 'package:craft_bay/ui/utils/app_colors.dart';
import 'package:craft_bay/ui/widgets/inc_dec_form_field.dart';
import 'package:craft_bay/ui/widgets/product_details/product_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/app_elevated_button.dart';

class ProductDetaiilsScreen extends StatefulWidget {
  final int productId;

  const ProductDetaiilsScreen({Key? key, required this.productId})
      : super(key: key);

  @override
  State<ProductDetaiilsScreen> createState() => _ProductDetaiilsScreenState();
}

class _ProductDetaiilsScreenState extends State<ProductDetaiilsScreen> {
  ProductDetailsController productDetailsController =
      Get.put(ProductDetailsController());


  Color? selectedColor;
  String? selectedSize;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      productDetailsController.getProductDetailsById(widget.productId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Product Details",
          style: TextStyle(color: Colors.black54),
        ),
        leading: BackButton(
          color: Colors.black54,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: GetBuilder<ProductDetailsController>(
          builder: (productDetailsController) {
        if (productDetailsController.getProductDetailsInProgress) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final ProductDetailsData productDetailsData =
              productDetailsController.productDetailsModel.data!.first;
          final List<Color> availableColors =
              getColorsFromString(productDetailsData.color ?? '');
          final List<String> availableSizes =
              getSizesFromString(productDetailsData.size ?? '');
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                   child: Column(
                    children: [
                      ProductIamgeSlider(
                        sliders: [
                          productDetailsData.img1 ?? '',
                          productDetailsData.img2 ?? '',
                          productDetailsData.img3 ?? '',
                          productDetailsData.img4 ?? '',
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    productDetailsData.product!.title ?? "",
                                    maxLines: 2,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                ),
                                SizedBox(
                                  width: 80,
                                  child: incdecFormField(),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Text(
                                  (productDetailsData.product!.star)!
                                      .toStringAsFixed(1),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ReviewScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Reviews",
                                    style:
                                        TextStyle(color: AppColor.primaryColor),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: AppColor.primaryColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(
                                    Icons.favorite_border,
                                    size: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Color",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  for (int i = 0;
                                      i < availableColors.length;
                                      i++)
                                    GestureDetector(
                                      onTap: () {
                                        selectedColor = availableColors[i];
                                        setState(() {});
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CircleAvatar(
                                          radius: 15,
                                          backgroundColor: availableColors[i],
                                          child: selectedColor ==
                                                  availableColors[i]
                                              ? Icon(Icons.check)
                                              : null,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Size",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  for (int i = 0;
                                      i < availableSizes.length;
                                      i++)
                                    GestureDetector(
                                      onTap: () {
                                        selectedSize = availableSizes[i];
                                        setState(() {});
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: selectedSize ==
                                                    availableSizes[i]
                                                ? AppColor.primaryColor
                                                    .withOpacity(0.7)
                                                : null,
                                            border: Border.all(
                                                color: Colors.black54,
                                                width: 2),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: Text(availableSizes[i]),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Description",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              productDetailsData.des ?? '',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 13,
                                  letterSpacing: 0.2),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                    color: AppColor.primaryColor.withOpacity(0.20),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Total Price",
                          style: TextStyle(color: Colors.black54, fontSize: 12),
                        ),
                        Text(
                          "\$1,000",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColor.primaryColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 130,
                      child:
                          AppElevatedButton(text: "Add to Cart", onTap: () {}),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      }),
    );
  }

  List<Color> getColorsFromString(String colors) {
    List<Color> hexaColors = [];
    final List<String> allColors = colors.split(',');
    for (var element in allColors) {
      hexaColors.add(HexColor(element));
    }
    return hexaColors;
  }

  List<String> getSizesFromString(String sizes) {
    return sizes.split(',');
  }
}
