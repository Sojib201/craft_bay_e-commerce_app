import 'package:craft_bay/data/models/product_model.dart';
import 'package:craft_bay/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class ProductItemPreviewCard extends StatelessWidget {
  const ProductItemPreviewCard({
    Key? key, required this.productData,
  }) : super(key: key);

  final ProductData productData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetaiilsScreen(productId: productData.id!,),
          ),
        );
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Image.network(
              productData.image??"",
              height: 90,
              width: 160,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              productData.title??"",
              maxLines: 2,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  overflow: TextOverflow.ellipsis,
                  color: Colors.black54,
                  letterSpacing: 0.4),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "\$${productData.price}",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColor.primaryColor),
                ),
                SizedBox(
                  width: 8,
                ),
                Icon(
                  Icons.star,
                  size: 14,
                  color: Colors.amberAccent,
                ),
                Text(
                 " ${productData.star ?? 0.0}",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
                SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Icon(
                      Icons.favorite_border,
                      size: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
