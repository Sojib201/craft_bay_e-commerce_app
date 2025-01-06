// class Urls {
//   static String baseUrl = "https://craftybay.teamrabbil.com/api";
//   static String productSliderUrl = "$baseUrl/ListProductSlider";
//   static String categoriesUrl = "$baseUrl/CategoryList";
//   static String productByRemarkUrl(String remark) =>
//       "$baseUrl/ListProductByRemark/$remark";
//
//   static String productByCategoryUrl(String categoryId) =>
//       "$baseUrl/ListProductByCategory/$categoryId";
//
//   static String productDetailsByIdUrl(int ProductId) =>
//       "$baseUrl/ProductDetailsById/$ProductId";
// }

class Urls {
  static String url = "https://crud.teamrabbil.com/api/v1";
  static String productSliderUrl_1 = "$url/ReadProduct";

  static String baseUrl = "https://fakestoreapi.com";
  static String categoriesUrl = "$baseUrl/products";
  static String productByRemarkUrl(String remark) =>
      "$baseUrl/ListProductByRemark/$remark";

  static String productByCategoryUrl(String categoryId) =>
      "$baseUrl/ListProductByCategory/$categoryId";

  static String productDetailsByIdUrl(int ProductId) =>
      "$baseUrl/ProductDetailsById/$ProductId";

}
