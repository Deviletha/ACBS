// // ignore_for_file: use_build_context_synchronously
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../Provider/signup_provider.dart';
// import 'login.dart';
// import 'login_page.dart';
//
//
// class SignUpPage extends StatefulWidget {
//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }
//
// class _SignUpPageState extends State<SignUpPage> {
//   var formkey = GlobalKey<FormState>();
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
//                   onPressed: () async {
//                     bool success =
//                     await context.read<SignUpPageController>().signUp(
//                       name: nameController.text.trim(),
//                       email: emailController.text.trim(),
//                       mobile: mobileController.text.trim(),
//                       address: addressController.text.trim(),
//                       location: locationController.text.trim(),
//                       latitude: latitudeController.text.trim(),
//                       longitude: longitudeController.text.trim(),
//                       state: stateController.text.trim(),
//                       pincode: pincodeController.text.trim(),
//                       password: passController.text.trim(),
//                     );
//                     print(success);
//                     if (success == true) {
//                       nameController.clear();
//                       emailController.clear();
//                       mobileController.clear();
//                       addressController.clear();
//                       locationController.clear();
//                       latitudeController.clear();
//                       longitudeController.clear();
//                       stateController.clear();
//                       pincodeController.clear();
//                       passController.clear();
//                       Navigator.pushReplacement(context,
//                           MaterialPageRoute(builder: (context) => Login()));
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           backgroundColor: Colors.red,
//                           content: Text('Sign UP Failed, Try again'),
//                         ),
//                       );
//                     }
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
