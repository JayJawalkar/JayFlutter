import 'package:flutter/material.dart';
import 'package:shop_ecommerce/global_variable.dart';
import 'package:shop_ecommerce/homepage.dart';
import 'package:shop_ecommerce/product_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lato',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(254, 206, 1, 1),
          primary: const Color.fromRGBO(254, 206, 1, 1),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      home: ProductDetail(
        product: products[0],
      ),
    );
  }
}
