// class CategoryListModel {
//   String? msg;
//   List<Data>? data;
//
//   CategoryListModel({this.msg, this.data});
//
//   CategoryListModel.fromJson(Map<String, dynamic> json) {
//     msg = json['msg'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(Data.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['msg'] = msg;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Data {
//   int? id;
//   String? categoryName;
//   String? categoryImg;
//   String? createdAt;
//   String? updatedAt;
//
//   Data(
//       {this.id,
//         this.categoryName,
//         this.categoryImg,
//         this.createdAt,
//         this.updatedAt});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     categoryName = json['categoryName'];
//     categoryImg = json['categoryImg'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['id'] = id;
//     data['categoryName'] = categoryName;
//     data['categoryImg'] = categoryImg;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     return data;
//   }
// }



class CategoryListModel {
  List<CategoryList>? categoryList;

  CategoryListModel({this.categoryList});

  CategoryListModel.fromJson(Map<String, dynamic> json) {
    if (json['categoryList'] != null) {
      categoryList = <CategoryList>[];
      json['categoryList'].forEach((v) {
        categoryList!.add(new CategoryList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categoryList != null) {
      data['categoryList'] = this.categoryList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryList {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  CategoryList(
      {this.id,
        this.title,
        this.price,
        this.description,
        this.category,
        this.image,
        this.rating});

  CategoryList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating =
    json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;
    if (this.rating != null) {
      data['rating'] = this.rating!.toJson();
    }
    return data;
  }
}

class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['count'] = this.count;
    return data;
  }
}
