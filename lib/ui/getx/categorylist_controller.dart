import 'package:craft_bay/data/models/category_list_model.dart';
import 'package:craft_bay/data/network_utils.dart';
import 'package:get/get.dart';

import '../../data/urls.dart';

class CategoryListController extends GetxController{
  CategoryListModel categoryListModel=CategoryListModel();
  bool getCategoryInProgress=false;

  Future<bool> getCategories() async{
    getCategoryInProgress=true;
    update();

    final result=await NetworkUtils().getMethod(Urls.categoriesUrl);

    getCategoryInProgress=false;

    if(result!=null){
      categoryListModel=CategoryListModel.fromJson(result);
      update();
      return true;
    }
    else{
      update();
      return false;
    }
  }

}