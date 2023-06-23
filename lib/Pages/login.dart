import 'dart:convert';
import 'package:acbs_sample/Pages/home_product.dart';
import 'package:acbs_sample/Pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Config/base_client.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? base = "https://acbs.hawkssolutions.com/public/v1/";
  List? loginlist;

  bool showpass = true;
  late SharedPreferences prefs;
  final userIdController = TextEditingController();
  final passController = TextEditingController();

  Future<void> saveLoginStatus() async {
  prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
  }

  callAPIandAssignData() async {
    var response =
    await BaseClient().post(api: "common/authenticate", body: {
      'username': 'userId',
      'password': 'password',
    }).catchError((
        err) {});
    if (response != null) {
      setState(() {
        debugPrint('api successful:');
        loginlist = jsonDecode(response);


        Fluttertoast.showToast(
          msg: "Success ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      });
    } else {
      debugPrint('api failed:');
      Fluttertoast.showToast(
        msg: "failed",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
  void initState() {
    callAPIandAssignData();
    // Save the login status
    saveLoginStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                heightFactor: 2,
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.black),
                ),
              ),
              const Text(
                "Welcome back! Login with your credentials",
                style: TextStyle(fontSize: 15, color: Colors.black45),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 20, bottom: 20),
                child: TextFormField(
                  controller: userIdController,
                  decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.account_box_sharp),
                      hintText: "Phone Number",
                      labelText: 'Phone Number',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10))),),
                  textInputAction: TextInputAction.next,
                  validator: (uname) {
                    if (uname!.isEmpty || !uname.contains('')) {
                      return 'Enter a valid Phone Number';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 20, bottom: 20),
                child: TextFormField(
                  controller: passController,
                  obscureText: showpass,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (showpass) {
                                showpass = false;
                              } else {
                                showpass = true;
                              }
                            });
                          },
                          icon: Icon(
                            showpass == true
                                ? Icons.visibility_off
                                : Icons.visibility,
                          )),
                      hintText: "Password",
                      labelText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10))),),
                  textInputAction: TextInputAction.done,
                  validator: (Password) {
                    if (Password!.isEmpty || Password.length < 6) {
                      return "Enter a valid Password, length should be greater than 6";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                      // Get the entered username and password
                      String username = userIdController.text.toString();
                      String password = passController.text.toString();

                      // Check if the username and password are not empty
                      if (username.isNotEmpty && password.isNotEmpty) {
                        // Make the API call with the entered credentials
                        var response = await BaseClient().post(api: "common/authenticate", body: {
                          'username': username,
                          'password': password,
                        }).catchError((err) {});

                        if (response != null) {
                          // API call succeeded
                          setState(() {
                            // Save the login status
                            saveLoginStatus();
                            debugPrint('API successful:');
                            loginlist = jsonDecode(response);
                            prefs.setString("isLoggedIn", "id");
                          });

                          Fluttertoast.showToast(
                            msg: "Login success",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                          // Navigate to the home screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeProduct()),
                          );
                        } else {
                          // API call failed
                          debugPrint('API failed:');
                          Fluttertoast.showToast(
                            msg: "Login failed",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }
                      } else {
                        // Username or password is empty
                        Fluttertoast.showToast(
                          msg: "Please enter username and password",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      shadowColor: Colors.indigo[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),topRight: Radius.circular(10)),
                      )),
                  child: Text("Login"),
                ),
              ),
              TextButton(
                child: Text("Don't have an account? Sign Up",
                    style: TextStyle(fontSize: 15, color: Colors.black45)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Signup()));
                },
              ),
            ],
          ),
        )
    );
  }
}
