// To parse this JSON data, do
//
//     final getProducts = getProductsFromJson(jsonString);

import 'dart:convert';

GetProducts getProductsFromJson(String str) => GetProducts.fromJson(json.decode(str));

String getProductsToJson(GetProducts data) => json.encode(data.toJson());

class GetProducts {
  Data data;

  GetProducts({
    required this.data,
  });

  factory GetProducts.fromJson(Map<String, dynamic> json) => GetProducts(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}
class Data {
  int currentPage;
  List<PageDatum> pageData;
  int total;
  int lastPage;

  Data({
    required this.currentPage,
    required this.pageData,
    required this.total,
    required this.lastPage,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    currentPage: json["currentPage"],
    pageData: List<PageDatum>.from(json["pageData"].map((x) => PageDatum.fromJson(x))),
    total: json["total"],
    lastPage: json["lastPage"],
  );

  Map<String, dynamic> toJson() => {
    "currentPage": currentPage,
    "pageData": List<dynamic>.from(pageData.map((x) => x.toJson())),
    "total": total,
    "lastPage": lastPage,
  };
}

class PageDatum {
  int id;
  String name;
  String code;
  String image;
  String description;
  int amount;
  String latitude;
  String longitude;
  dynamic location;
  String city;
  String? categoryImg;
  String categoryName;
  String customer;
  int customerid;
  String brand;
  int status;

  PageDatum({
    required this.id,
    required this.name,
    required this.code,
    required this.image,
    required this.description,
    required this.amount,
    required this.latitude,
    required this.longitude,
    this.location,
    required this.city,
    this.categoryImg,
    required this.categoryName,
    required this.customer,
    required this.customerid,
    required this.brand,
    required this.status,
  });

  factory PageDatum.fromJson(Map<String, dynamic> json) => PageDatum(
    id: json["id"],
    name: json["name"],
    code: json["code"],
    image: json["image"],
    description: json["description"],
    amount: json["amount"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    location: json["location"],
    city: json["city"],
    categoryImg: json["categoryImg"],
    categoryName: json["categoryName"],
    customer: json["customer"],
    customerid: json["customerid"],
    brand: json["brand"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "code": code,
    "image": image,
    "description": description,
    "amount": amount,
    "latitude": latitude,
    "longitude": longitude,
    "location": location,
    "city": city,
    "categoryImg": categoryImg,
    "categoryName": categoryName,
    "customer": customer,
    "customerid": customerid,
    "brand": brand,
    "status": status,
  };
}
