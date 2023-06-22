import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Config/base_client.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String? base = "https://acbs.hawkssolutions.com/public/v1/";

  Map? signuplist;
  List? slist;
  bool showpass = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController passController = TextEditingController();

  callAPIandAssignData() async {
    var response = await BaseClient().post(api: "common/signUP", body: {
      "name": nameController.text,
      "email": emailController.text,
      "mobile": mobileController.text,
      "address": addressController.text,
      "location": locationController.text,
      "latitude": latitudeController.text,
      "longitude": longitudeController.text,
      "city": cityController.text,
      "state": stateController.text,
      "pincode": pincodeController.text,
      "password": passController.text,
    }).catchError((err) {});
    if (response != null) {
      setState(() {
        debugPrint('api successful:');
        signuplist = jsonDecode(response);

        print(response);

        Fluttertoast.showToast(
          msg: "Signup success",
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                heightFactor: 2,
                child: Text(
                  "Sign UP",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.black),
                ),
              ),
              Text(
                "Enter your details",
                style: TextStyle(fontSize: 15, color: Colors.black45),
              ),
          Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(10),
                      hintText: "Name",
                      labelText: 'Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a valid name';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 20, bottom: 10),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(10),
                      hintText: "Email ID",
                      labelText: 'Email ID',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Enter a valid Email ID';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
                child: TextFormField(
                  controller: mobileController,
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(10),
                      hintText: "Phone Number",
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a valid Mobile Number';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
                child: TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(10),
                      hintText: "Address",
                      labelText: 'Address',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a valid Address';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
                child: TextFormField(
                  controller: locationController,
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(10),
                      hintText: "location",
                      labelText: 'location',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a valid location';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
                child: TextFormField(
                  controller: latitudeController,
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(10),
                      hintText: "latitude",
                      labelText: 'latitude',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a valid latitude';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
                child: TextFormField(
                  controller: longitudeController,
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(10),
                      hintText: "longitude",
                      labelText: 'longitude',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a valid longitude';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
                child: TextFormField(
                  controller: cityController,
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(10),
                      hintText: "city",
                      labelText: 'city',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a valid city name';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
                child: TextFormField(
                  controller: stateController,
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(10),
                      hintText: "State",
                      labelText: 'State',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a valid State';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
                child: TextFormField(
                  controller: pincodeController,
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(10),
                      hintText: "Pin code",
                      labelText: 'Pin code',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a valid Pin code';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
                child: TextFormField(
                  controller: passController,
                  obscureText: showpass,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(10),
                      prefixIcon: const Icon(Icons.visibility_off),
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
                          borderRadius: BorderRadius.circular(10))),
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
                  onPressed: () {
                    callAPIandAssignData();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      shadowColor: Colors.indigo[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  child: Text("Sign Up"),
                ),
              ),
          TextButton(
                child: Text("Already have an account? Login",
                    style: TextStyle(fontSize: 15, color: Colors.black45)),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import '../Config/base_client.dart';
// import 'login.dart';
//
// class Signup extends StatefulWidget {
//   const Signup({Key? key}) : super(key: key);
//
//   @override
//   State<Signup> createState() => _SignupState();
// }
//
// class _SignupState extends State<Signup> {
//
//   String? base = "https://acbs.hawkssolutions.com/public/v1/";
//
//   List? signuplist;
//   bool showpass = true;
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController mobileController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   TextEditingController locationController = TextEditingController();
//   TextEditingController latitudeController = TextEditingController();
//   TextEditingController longitudeController = TextEditingController();
//   TextEditingController cityController = TextEditingController();
//   TextEditingController stateController = TextEditingController();
//   TextEditingController pincodeController = TextEditingController();
//   TextEditingController passController = TextEditingController();
//
//
//   callAPIandAssignData() async {
//     var response =
//     await BaseClient().post(api: "common/signUP", body: {
//       "name": "name",
//       "email": "email",
//       "mobile": "mobile",
//       "address": "address",
//       "location": "location",
//       "latitude": "latitude",
//       "longitude": "longitude",
//       "city": 'longitude',
//       "state": "state",
//       "pincode": 'pincode',
//       "password": "password",
//     }).catchError((
//         err) {});
//     if (response != null) {
//       setState(() {
//         debugPrint('api successful:');
//         signuplist = jsonDecode(response);
//
//         Fluttertoast.showToast(
//           msg: "Success ",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.CENTER,
//           timeInSecForIosWeb: 1,
//           textColor: Colors.white,
//           fontSize: 16.0,
//         );
//       });
//     } else {
//       debugPrint('api failed:');
//       Fluttertoast.showToast(
//         msg: "failed",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
//         timeInSecForIosWeb: 1,
//         textColor: Colors.white,
//         fontSize: 16.0,
//       );
//     }
//   }
//
//   @override
//   void initState() {
//     callAPIandAssignData();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(15),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Center(
//                 heightFactor: 2,
//                 child: Text(
//                   "Sign UP",
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 40,
//                       color: Colors.black),
//                 ),
//               ),
//               Text(
//                 "Enter your details",
//                 style: TextStyle(fontSize: 15, color: Colors.black45),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
//                 child: TextFormField(
//                   controller: nameController,
//                   decoration: InputDecoration(
//                       isDense: true,
//                       contentPadding: EdgeInsets.all(10),
//                       hintText: "Name",
//                       labelText: 'Name',
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10))),
//                   textInputAction: TextInputAction.next,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Enter a valid name';
//                     } else {
//                       return null;
//                     }
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                     left: 10, right: 10, top: 20, bottom: 10),
//                 child: TextFormField(
//                   controller: emailController,
//                   decoration: InputDecoration(
//                       isDense: true,
//                       contentPadding: EdgeInsets.all(10),
//                       hintText: "Email ID",
//                       labelText: 'Email ID',
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10))),
//                   textInputAction: TextInputAction.next,
//                   validator: (value) {
//                     if (value!.isEmpty || !value.contains('@')) {
//                       return 'Enter a valid Email ID';
//                     } else {
//                       return null;
//                     }
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
//                 child: TextFormField(
//                   controller: mobileController,
//                   decoration: InputDecoration(
//                       isDense: true,
//                       contentPadding: EdgeInsets.all(10),
//                       hintText: "Phone Number",
//                       labelText: 'Phone Number',
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10))),
//                   textInputAction: TextInputAction.next,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Enter a valid Mobile Number';
//                     } else {
//                       return null;
//                     }
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
//                 child: TextFormField(
//                   controller: addressController,
//                   decoration: InputDecoration(
//                       isDense: true,
//                       contentPadding: EdgeInsets.all(10),
//                       hintText: "Address",
//                       labelText: 'Address',
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10))),
//                   textInputAction: TextInputAction.next,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Enter a valid Address';
//                     } else {
//                       return null;
//                     }
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
//                 child: TextFormField(
//                   controller: locationController,
//                   decoration: InputDecoration(
//                       isDense: true,
//                       contentPadding: EdgeInsets.all(10),
//                       hintText: "location",
//                       labelText: 'location',
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10))),
//                   textInputAction: TextInputAction.next,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Enter a valid location';
//                     } else {
//                       return null;
//                     }
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
//                 child: TextFormField(
//                   controller: latitudeController,
//                   decoration: InputDecoration(
//                       isDense: true,
//                       contentPadding: EdgeInsets.all(10),
//                       hintText: "latitude",
//                       labelText: 'latitude',
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10))),
//                   textInputAction: TextInputAction.next,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Enter a valid latitude';
//                     } else {
//                       return null;
//                     }
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
//                 child: TextFormField(
//                   controller: longitudeController,
//                   decoration: InputDecoration(
//                       isDense: true,
//                       contentPadding: EdgeInsets.all(10),
//                       hintText: "longitude",
//                       labelText: 'longitude',
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10))),
//                   textInputAction: TextInputAction.next,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Enter a valid longitude';
//                     } else {
//                       return null;
//                     }
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
//                 child: TextFormField(
//                   controller: cityController,
//                   decoration: InputDecoration(
//                       isDense: true,
//                       contentPadding: EdgeInsets.all(10),
//                       hintText: "city",
//                       labelText: 'city',
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10))),
//                   textInputAction: TextInputAction.next,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Enter a valid city name';
//                     } else {
//                       return null;
//                     }
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
//                 child: TextFormField(
//                   controller: stateController,
//                   decoration: InputDecoration(
//                       isDense: true,
//                       contentPadding: EdgeInsets.all(10),
//                       hintText: "State",
//                       labelText: 'State',
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10))),
//                   textInputAction: TextInputAction.next,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Enter a valid State';
//                     } else {
//                       return null;
//                     }
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
//                 child: TextFormField(
//                   controller: pincodeController,
//                   decoration: InputDecoration(
//                       isDense: true,
//                       contentPadding: EdgeInsets.all(10),
//                       hintText: "Pin code",
//                       labelText: 'Pin code',
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10))),
//                   textInputAction: TextInputAction.next,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Enter a valid Pin code';
//                     } else {
//                       return null;
//                     }
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
//                 child: TextFormField(
//                   controller: passController,
//                   obscureText: showpass,
//                   obscuringCharacter: "*",
//                   decoration: InputDecoration(
//                       isDense: true,
//                       contentPadding: EdgeInsets.all(10),
//                       prefixIcon: const Icon(Icons.visibility_off),
//                       suffixIcon: IconButton(
//                           onPressed: () {
//                             setState(() {
//                               if (showpass) {
//                                 showpass = false;
//                               } else {
//                                 showpass = true;
//                               }
//                             });
//                           },
//                           icon: Icon(
//                             showpass == true
//                                 ? Icons.visibility_off
//                                 : Icons.visibility,
//                           )),
//                       hintText: "Password",
//                       labelText: "Password",
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10))),
//                   textInputAction: TextInputAction.done,
//                   validator: (Password) {
//                     if (Password!.isEmpty || Password.length < 6) {
//                       return "Enter a valid Password, length should be greater than 6";
//                     } else {
//                       return null;
//                     }
//                   },
//                 ),
//               ),
//               SizedBox(
//                 width: 350,
//                 height: 50,
//                 child: ElevatedButton(
//                   onPressed: ()  {
//                   },
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.indigo,
//                       shadowColor: Colors.indigo[300],
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15),
//                       )),
//                   child: Text("Sign Up"),
//                 ),
//               ),
//               TextButton(
//                 child: Text("Already have an account? Login",
//                     style: TextStyle(fontSize: 15, color: Colors.black45)),
//                 onPressed: () {
//                   Navigator.pushReplacement(context,
//                       MaterialPageRoute(builder: (context) => Login()));
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
