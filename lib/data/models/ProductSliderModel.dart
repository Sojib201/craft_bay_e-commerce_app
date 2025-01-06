// class ProductSliderModel {
//   String? msg;
//   List<Data>? data;
//
//   ProductSliderModel({this.msg, this.data});
//
//   ProductSliderModel.fromJson(Map<String, dynamic> json) {
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
//   String? title;
//   String? shortDes;
//   String? image;
//   int? productId;
//   String? createdAt;
//   String? updatedAt;
//
//   Data(
//       {this.id,
//       this.title,
//       this.shortDes,
//       this.image,
//       this.productId,
//       this.createdAt,
//       this.updatedAt});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     shortDes = json['short_des'];
//     image = json['image'];
//     productId = json['product_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = id;
//     data['title'] = title;
//     data['short_des'] = shortDes;
//     data['image'] = image;
//     data['product_id'] = productId;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     return data;
//   }
// }





class ProductSliderModel {
  String? status;
  List<Data>? data;

  ProductSliderModel({this.status, this.data});

  ProductSliderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? productName;
  String? productCode;
  String? img;
  String? unitPrice;
  String? qty;
  String? totalPrice;
  String? createdDate;

  Data(
      {this.sId,
        this.productName,
        this.productCode,
        this.img,
        this.unitPrice,
        this.qty,
        this.totalPrice,
        this.createdDate});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    productName = json['ProductName'];
    productCode = json['ProductCode'];
    img = json['Img'];
    unitPrice = json['UnitPrice'];
    qty = json['Qty'];
    totalPrice = json['TotalPrice'];
    createdDate = json['CreatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['ProductName'] = this.productName;
    data['ProductCode'] = this.productCode;
    data['Img'] = this.img;
    data['UnitPrice'] = this.unitPrice;
    data['Qty'] = this.qty;
    data['TotalPrice'] = this.totalPrice;
    data['CreatedDate'] = this.createdDate;
    return data;
  }
}

