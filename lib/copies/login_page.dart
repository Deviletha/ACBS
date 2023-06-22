// // ignore_for_file: use_build_context_synchronously, avoid_print
// import 'package:acbs_sample/Pages/signup_page.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../Provider/login_provider.dart';
// import 'home_product.dart';
//
//
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   var formkey = GlobalKey<FormState>();
//   bool showpass = true;
//
//   final userIdController = TextEditingController();
//   final passController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.all(15),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Center(
//               heightFactor: 2,
//               child: Text(
//                 "Login",
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 40,
//                     color: Colors.black),
//               ),
//             ),
//             Text(
//               "Welcome back! Login with your credentials",
//               style: TextStyle(fontSize: 15, color: Colors.black45),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(
//                   left: 10, right: 10, top: 20, bottom: 20),
//               child: TextFormField(
//                 controller: userIdController,
//                 decoration: InputDecoration(
//                     prefixIcon: const Icon(Icons.account_box_sharp),
//                     hintText: "Phone Number",
//                     labelText: 'Phone Number',
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10))),
//                 textInputAction: TextInputAction.next,
//                 validator: (uname) {
//                   if (uname!.isEmpty || !uname.contains('')) {
//                     return 'Enter a valid Phone Number';
//                   } else {
//                     return null;
//                   }
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(
//                   left: 10, right: 10, top: 20, bottom: 20),
//               child: TextFormField(
//                 controller: passController,
//                 obscureText: showpass,
//                 obscuringCharacter: "*",
//                 decoration: InputDecoration(
//                     prefixIcon: const Icon(Icons.visibility_off),
//                     suffixIcon: IconButton(
//                         onPressed: () {
//                           setState(() {
//                             if (showpass) {
//                               showpass = false;
//                             } else {
//                               showpass = true;
//                             }
//                           });
//                         },
//                         icon: Icon(
//                           showpass == true
//                               ? Icons.visibility_off
//                               : Icons.visibility,
//                         )),
//                     hintText: "Password",
//                     labelText: "Password",
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10))),
//                 textInputAction: TextInputAction.done,
//                 validator: (Password) {
//                   if (Password!.isEmpty || Password.length < 6) {
//                     return "Enter a valid Password, length should be greater than 6";
//                   } else {
//                     return null;
//                   }
//                 },
//               ),
//             ),
//             SizedBox(
//               width: 350,
//               height: 50,
//               child: ElevatedButton(
//                 onPressed: () async {
//                   final isSuccess = await context
//                       .read<LoginPageController>()
//                       .login(
//                       userId: userIdController.text.trim(),
//                       password: passController.text.trim());
//                   print(isSuccess);
//                   if (isSuccess == true) {
//                     userIdController.clear();
//                     passController.clear();
//                     Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const HomeProduct()));
//                   } else {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         backgroundColor: Colors.red,
//                         content: Text('Login Failed, Try again'),
//                       ),
//                     );
//                   }
//                 },
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.indigo,
//                     shadowColor: Colors.indigo[300],
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     )),
//                 child: Text("Login"),
//               ),
//             ),
//             TextButton(
//               child: Text("Don't have an account? Sign Up",
//                   style: TextStyle(fontSize: 15, color: Colors.black45)),
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => SignUpPage()));
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
