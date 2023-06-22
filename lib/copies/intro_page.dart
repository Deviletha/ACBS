// import 'dart:async';
// import 'package:acbs_sample/Pages/home_product.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'login_page.dart';
//
// class IntroPage extends StatefulWidget {
//   const IntroPage({Key? key}) : super(key: key);
//
//   @override
//   State<IntroPage> createState() => _IntroPageState();
// }
//
// class _IntroPageState extends State<IntroPage> {
//
//   final userIdController = TextEditingController();
//   final passController = TextEditingController();
//   final idController = TextEditingController();
//
//   late SharedPreferences logindata;
//   late bool newuser;
//   // late String
//
//   @override
//   void initState() {
//     super.initState();
//     Timer(const Duration(seconds: 3), () async{
//       logindata = await SharedPreferences.getInstance();
//       newuser = (logindata.getBool('login') ?? true);
//       print(newuser);
//
//       logindata.setBool('login', false);
//       logindata.setString('id', idController.text.trim());
//       // logindata.setString('username', userIdController.text.trim());
//
//       if (newuser == false){
//         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => HomeProduct()));
//       }else{
//         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => LoginPage()));
//       }
//     });
//
//   }
//   @override
//   void dispose() {
//     // Clean up the controller when the widget is disposed.
//     userIdController.dispose();
//     passController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           body: Padding(
//             padding: const EdgeInsets.all(15),
//             child: Column(
//               children: const [
//                 Spacer(),
//                 Text(
//                   "ACBS",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 40,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Text(
//                   "Anything Can Buy & Sell",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Spacer()
//               ],
//             ),
//           )),
//     );
//   }
// }
