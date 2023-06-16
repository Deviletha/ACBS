// To parse this JSON data, do
//
//     final signupResponseModel = signupResponseModelFromJson(jsonString);

import 'dart:convert';

SignupResponseModel signupResponseModelFromJson(String str) => SignupResponseModel.fromJson(json.decode(str));

String signupResponseModelToJson(SignupResponseModel data) => json.encode(data.toJson());

class SignupResponseModel {
  int status;
  String message;
  Details details;

  SignupResponseModel({
    required this.status,
    required this.message,
    required this.details,
  });

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) => SignupResponseModel(
    status: json["status"],
    message: json["message"],
    details: Details.fromJson(json["details"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "details": details.toJson(),
  };
}

class Details {
  String name;
  String email;
  String mobile;
  String address;
  String location;
  String latitude;
  String longitude;
  String city;
  String state;
  String pincode;
  String password;

  Details({
    required this.name,
    required this.email,
    required this.mobile,
    required this.address,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.city,
    required this.state,
    required this.pincode,
    required this.password
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    address: json["address"],
    location: json["location"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    city: json["city"],
    state: json["state"],
    pincode: json["pincode"],
    password: '',
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "mobile": mobile,
    "address": address,
    "location": location,
    "latitude": latitude,
    "longitude": longitude,
    "city": city,
    "state": state,
    "pincode": pincode,
    "password": password
  };
}
