import 'package:flutter/material.dart';
import '../Config/base_client.dart';
import '../Model/signup_res_model.dart';


class SignUpPageController extends ChangeNotifier {
  bool isLoading = false;

  Future<bool> signUp({
    required String name,
    required String email,
    required String mobile,
    required String address,
    required String location,
    required String latitude,
    required String longitude,
    required String state,
    required String pincode,
    // required String status,
    // required String image,
    // required String created,
    // required String id,
    required String password

  }) async {
    bool isSuccess = false;
    isLoading = true;
    notifyListeners();

    final response = await BaseClient().post(
      api: 'common/signUP',
      body: {
        "name": name,
        "email": email,
        "mobile": mobile,
        "address": address,
        "location": location,
        "latitude": latitude,
        "longitude": longitude,
        "city": longitude,
        "state": state,
        "pincode": pincode,
        // "status": status,
        // "image": image,
        // "created": created,
        // "id": id,
        "password": password,
      },
    );

    final decodedResponse = SignupResponseModel.fromJson(response);
    isLoading = false;
    notifyListeners();

    if (decodedResponse.status != 2) {
      isSuccess = true;
      print(response);
    }
    return isSuccess;
  }
}
