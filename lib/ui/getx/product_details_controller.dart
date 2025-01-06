import 'package:craft_bay/data/models/product_details_model.dart';
import 'package:craft_bay/data/network_utils.dart';
import 'package:get/get.dart';

import '../../data/urls.dart';

class ProductDetailsController extends GetxController{

  ProductDetailsModel productDetailsModel=ProductDetailsModel();

  bool getProductDetailsInProgress=false;

  Future<bool> getProductDetailsById(int id) async{
    getProductDetailsInProgress=true;
    update();
    
    final response=await NetworkUtils().getMethod(Urls.productDetailsByIdUrl(id));

    getProductDetailsInProgress=false;
    if(response!=null && response['msg']=='success'){
      productDetailsModel=ProductDetailsModel.fromJson(response);
      update();
      return true;
    }
    else{
      update();
      return false;

    }
  }

}