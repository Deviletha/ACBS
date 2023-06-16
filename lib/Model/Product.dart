// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    required this.pagination,
  });

  Pagination pagination;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    pagination: Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "pagination": pagination.toJson(),
  };
}

class Pagination {
  Pagination({
    required this.currentPage,
    required this.pageData,
    required this.total,
    required this.lastPage,
  });

  int currentPage;
  List<PageDatum> pageData;
  int total;
  int lastPage;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
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
  PageDatum({
    required this.id,
    required this.name,
    required this.image,
    required this.thumb,
    required this.description,
    required this.model,
    required this.productCode,
    required this.price,
    required this.mrp,
    required this.taxId,
    required this.design,
    required this.quantity,
    required this.minimumOrderQuantity,
    required this.deliveryCharges,
    required this.expressDeliveryCharges,
    required this.parcelCharges,
    required this.otherCharges,
    required this.subtractStock,
    required this.outOfStockStatus,
    required this.length,
    required this.width,
    required this.height,
    required this.sortOrder,
    required this.categories,
    required this.subCategories,
    required this.status,
    required this.deleteStatus,
    required this.updated,
    required this.metaKeywords,
    required this.metaTitle,
    required this.discountType,
    required this.discount,
    required this.offerStart,
    required this.offerEnds,
  });

  String id;
  String name;
  String image;
  String thumb;
  String description;
  String model;
  String productCode;
  String price;
  String mrp;
  String taxId;
  String design;
  String quantity;
  String minimumOrderQuantity;
  String deliveryCharges;
  String expressDeliveryCharges;
  String parcelCharges;
  String otherCharges;
  String subtractStock;
  String outOfStockStatus;
  String length;
  String width;
  String height;
  String sortOrder;
  String categories;
  String subCategories;
  String status;
  String deleteStatus;
  String updated;
  String metaKeywords;
  String metaTitle;
  String discountType;
  String discount;
  String offerStart;
  String offerEnds;

  factory PageDatum.fromJson(Map<String, dynamic> json) => PageDatum(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    thumb: json["thumb"],
    description: json["description"],
    model: json["model"],
    productCode: json["product_code"],
    price: json["price"],
    mrp: json["mrp"],
    taxId: json["tax_id"],
    design: json["design"],
    quantity: json["quantity"],
    minimumOrderQuantity: json["minimum_order_quantity"],
    deliveryCharges: json["delivery_charges"],
    expressDeliveryCharges: json["express_delivery_charges"],
    parcelCharges: json["parcel_charges"],
    otherCharges: json["other_charges"],
    subtractStock: json["subtract_stock"],
    outOfStockStatus: json["out_of_stock_status"],
    length: json["length"],
    width: json["width"],
    height: json["height"],
    sortOrder: json["sort_order"],
    categories: json["categories"],
    subCategories: json["sub_categories"],
    status: json["status"],
    deleteStatus: json["delete_status"],
    updated: json["updated"],
    metaKeywords: json["meta_keywords"],
    metaTitle: json["meta_title"],
    discountType: json["discount_type"],
    discount: json["discount"],
    offerStart: json["offerStart"],
    offerEnds: json["offerEnds"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "thumb": thumb,
    "description": description,
    "model": model,
    "product_code": productCode,
    "price": price,
    "mrp": mrp,
    "tax_id": taxId,
    "design": design,
    "quantity": quantity,
    "minimum_order_quantity": minimumOrderQuantity,
    "delivery_charges": deliveryCharges,
    "express_delivery_charges": expressDeliveryCharges,
    "parcel_charges": parcelCharges,
    "other_charges": otherCharges,
    "subtract_stock": subtractStock,
    "out_of_stock_status": outOfStockStatus,
    "length": length,
    "width": width,
    "height": height,
    "sort_order": sortOrder,
    "categories": categories,
    "sub_categories": subCategories,
    "status": status,
    "delete_status": deleteStatus,
    "updated": updated,
    "meta_keywords": metaKeywords,
    "meta_title": metaTitle,
    "discount_type": discountType,
    "discount": discount,
    "offerStart": offerStart,
    "offerEnds": offerEnds,
  };
}
