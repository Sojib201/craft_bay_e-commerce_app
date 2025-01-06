import 'package:craft_bay/data/models/product_model.dart';
import 'package:craft_bay/data/network_utils.dart';
import 'package:craft_bay/data/urls.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  ProductModel popularProductModel = ProductModel();
  ProductModel specialProductModel = ProductModel();
  ProductModel newProductModel = ProductModel();
  ProductModel productByCategoryModel = ProductModel();

  bool popuparInProgress = false;
  bool specialInProgress = false;
  bool newInProgress = false;
  bool productByCategoryInProgress = false;

  Future<bool> getPopularProduct() async {
    popuparInProgress = true;
    update();
    final response =
        await NetworkUtils().getMethod(Urls.productByRemarkUrl("popular"));

    popuparInProgress = false;
    if (response != null && response['msg'] == 'success') {
      popularProductModel = ProductModel.fromJson(response);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  Future<bool> getSpecialProduct() async {
    specialInProgress = true;
    update();
    final response =
        await NetworkUtils().getMethod(Urls.productByRemarkUrl('special'));
    specialInProgress = false;
    if (response != null && response['msg'] == 'success') {
      specialProductModel = ProductModel.fromJson(response);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  Future<bool> getNewProduct() async {
    newInProgress = true;
    update();
    final response =
        await NetworkUtils().getMethod(Urls.productByRemarkUrl('new'));

    newInProgress = false;
    if (response != null && response['msg'] == 'success') {
      newProductModel = ProductModel.fromJson(response);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  Future<bool> getProductByCategory(String categoryId) async {
    productByCategoryInProgress = true;
    update();
    final response = await NetworkUtils().getMethod(
      Urls.productByCategoryUrl(categoryId),
    );

    productByCategoryInProgress = false;
    if (response != null && response['msg'] == 'success') {
      productByCategoryModel = ProductModel.fromJson(response);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
