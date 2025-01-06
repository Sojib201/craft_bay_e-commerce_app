import 'package:craft_bay/data/models/ProductSliderModel.dart';
import 'package:craft_bay/data/network_utils.dart';
import 'package:craft_bay/data/urls.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  ProductSliderModel productSliderModel = ProductSliderModel();
  bool getProductSliderInProgress = false;

  Future<bool> getProductSliderList() async {
    getProductSliderInProgress = true;
    update();
    final result = await NetworkUtils().getMethod(Urls.productSliderUrl);

    getProductSliderInProgress = false;
    if (result != null) {
      productSliderModel = ProductSliderModel.fromJson(result);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
