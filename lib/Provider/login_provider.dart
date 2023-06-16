import 'package:flutter/material.dart';


import '../Config/base_client.dart';
import '../Model/login_res_model.dart';

class LoginPageController extends ChangeNotifier {
  bool isLoading = false;

  Future<bool> login({required String userId, required String password}) async {
    bool isSuccess = false;
    isLoading = true;
    notifyListeners();

    final response = await BaseClient().post(
      api: 'common/authenticate',
      body: {
        'username': userId,
        'password': password,
      },
    );
    final decodedResponse = LoginResponseModel.fromJson(response[0]);

    isLoading = false;
    notifyListeners();

    if (decodedResponse.id > 1) {
      isSuccess = true;
      print(response);
    }
    return isSuccess;
  }
}
