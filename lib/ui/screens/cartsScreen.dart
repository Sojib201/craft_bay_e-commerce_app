import 'package:craft_bay/ui/getx/bottom_navitgation_controller.dart';
import 'package:craft_bay/ui/utils/app_colors.dart';
import 'package:craft_bay/ui/widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/carts/cart_product_item.dart';

class CartsScreen extends StatefulWidget {
  const CartsScreen({Key? key}) : super(key: key);

  @override
  State<CartsScreen> createState() => _CartsScreenState();
}

class _CartsScreenState extends State<CartsScreen> {
  BottomNavigationController controller = Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            controller.changeIndex(0);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
          ),
        ),
        title: Text(
          "Carts",
          style: TextStyle(color: Colors.black54),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return cartProductItem();
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
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
                      "\$120000",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColor.primaryColor),
                    ),
                  ],
                ),
                SizedBox(
                    width: 110,
                    child: AppElevatedButton(text: "CheckOut", onTap: () {})),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



