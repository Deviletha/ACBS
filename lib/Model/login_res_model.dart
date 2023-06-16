// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

List<LoginResponseModel> loginResponseModelFromJson(String str) => List<LoginResponseModel>.from(json.decode(str).map((x) => LoginResponseModel.fromJson(x)));

String loginResponseModelToJson(List<LoginResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LoginResponseModel {
  dynamic deviceId;
  int id;
  String type;
  String image;
  String username;
  String mobile;
  String email;
  String password;
  dynamic pass;
  dynamic userId;
  String name;
  DateTime created;
  DateTime updated;
  int status;
  int deleteStatus;
  dynamic deletedAt;
  dynamic deletedBy;
  String address;
  String latitude;
  String longitude;
  String location;
  dynamic rememberme;

  LoginResponseModel({
    this.deviceId,
    required this.id,
    required this.type,
    required this.image,
    required this.username,
    required this.mobile,
    required this.email,
    required this.password,
    this.pass,
    this.userId,
    required this.name,
    required this.created,
    required this.updated,
    required this.status,
    required this.deleteStatus,
    this.deletedAt,
    this.deletedBy,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.location,
    this.rememberme,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
    deviceId: json["device_id"],
    id: json["id"],
    type: json["type"],
    image: json["image"],
    username: json["username"],
    mobile: json["mobile"],
    email: json["email"],
    password: json["password"],
    pass: json["pass"],
    userId: json["user_id"],
    name: json["name"],
    created: DateTime.parse(json["created"]),
    updated: DateTime.parse(json["updated"]),
    status: json["status"],
    deleteStatus: json["delete_status"],
    deletedAt: json["deleted_at"],
    deletedBy: json["deleted_by"],
    address: json["address"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    location: json["location"],
    rememberme: json["rememberme"],
  );

  Map<String, dynamic> toJson() => {
    "device_id": deviceId,
    "id": id,
    "type": type,
    "image": image,
    "username": username,
    "mobile": mobile,
    "email": email,
    "password": password,
    "pass": pass,
    "user_id": userId,
    "name": name,
    "created": "${created.year.toString().padLeft(4, '0')}-${created.month.toString().padLeft(2, '0')}-${created.day.toString().padLeft(2, '0')}",
    "updated": updated.toIso8601String(),
    "status": status,
    "delete_status": deleteStatus,
    "deleted_at": deletedAt,
    "deleted_by": deletedBy,
    "address": address,
    "latitude": latitude,
    "longitude": longitude,
    "location": location,
    "rememberme": rememberme,
  };
}
