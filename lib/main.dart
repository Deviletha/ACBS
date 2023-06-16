import 'package:flutter/material.dart';
import 'Pages/home_product.dart';
import 'Provider/login_provider.dart';
import 'Provider/signup_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginPageController>(
            create: (_) => LoginPageController()),
        ChangeNotifierProvider<SignUpPageController>(
            create: (_) => SignUpPageController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeProduct(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.indigoAccent
          ),
        ),
      ),
    );
  }
}
