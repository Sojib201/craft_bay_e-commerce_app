class Urls {
  static String baseUrl = "https://craftybay.teamrabbil.com/api";
  static String productSliderUrl = "$baseUrl/ListProductSlider";
  static String categoriesUrl = "$baseUrl/CategoryList";
  static String productByRemarkUrl(String remark) =>
      "$baseUrl/ListProductByRemark/$remark";

  static String productByCategoryUrl(String categoryId) =>
      "$baseUrl/ListProductByCategory/$categoryId";

  static String productDetailsByIdUrl(int ProductId) =>
      "$baseUrl/ProductDetailsById/$ProductId";

}
